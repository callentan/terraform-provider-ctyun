"""Generate a source-backed catalog without configuring or calling cloud APIs."""

import ast
import hashlib
import re
from pathlib import Path

import hcl2
from lark import Tree
from lark.exceptions import LarkError
from tree_sitter import Language, Parser
import tree_sitter_go


class CatalogError(ValueError):
    pass


GO_PARSER = Parser(Language(tree_sitter_go.language()))
SCALARS = {
    "String": "string", "Bool": "bool", "Int32": "number", "Int64": "number",
    "Float32": "number", "Float64": "number", "Number": "number",
}


def walk(node):
    yield node
    for child in node.named_children:
        if child.type != "comment":
            yield from walk(child)


def text(node):
    return node.text.decode("utf-8") if node is not None else ""


def unwrap(node):
    while node.type in {"literal_element", "parenthesized_expression"}:
        node = node.named_children[0]
    return node


def parse_go(source, filename="<source>"):
    root = GO_PARSER.parse(source.encode("utf-8")).root_node
    if root.has_error:
        errors = [n for n in walk(root) if n.type == "ERROR" or n.is_missing]
        raise CatalogError(f"{filename}: Go parse errors at {[n.start_point for n in errors]}")
    return root


def receiver_name(node):
    receiver = node.child_by_field_name("receiver")
    if receiver is None:
        return ""
    declaration = receiver.named_children[0]
    return text(declaration.child_by_field_name("type")).removeprefix("*")


def method_node(root, name, receiver=None):
    matches = [
        node for node in root.named_children
        if node.type == "method_declaration"
        and text(node.child_by_field_name("name")) == name
        and (receiver is None or receiver_name(node) == receiver)
    ]
    if len(matches) != 1:
        raise CatalogError(f"Expected one {receiver or '*'}.{name}, found {len(matches)}")
    return matches[0]


def string_value(node):
    node = unwrap(node)
    if node.type == "raw_string_literal":
        return text(node)[1:-1].replace("\r", "")
    if node.type == "interpreted_string_literal":
        return ast.literal_eval(text(node))
    if node.type == "binary_expression" and text(node.child_by_field_name("operator")) == "+":
        return string_value(node.child_by_field_name("left")) + string_value(node.child_by_field_name("right"))
    raise CatalogError(f"Not a static Go string: {text(node)}")


def fields(node, *, attribute_keys=False):
    node = unwrap(node)
    if node.type == "composite_literal":
        node = node.child_by_field_name("body")
    if node.type != "literal_value":
        raise CatalogError(f"Expected a literal Attributes/struct map, got {text(node)}")
    result = {}
    for entry in node.named_children:
        if entry.type == "comment":
            continue
        if entry.type != "keyed_element":
            raise CatalogError(f"Expected keyed schema entry: {text(entry)}")
        key = unwrap(entry.child_by_field_name("key"))
        if attribute_keys and key.type not in {"interpreted_string_literal", "raw_string_literal"}:
            raise CatalogError(f"Nonliteral attribute key requires constant/runtime resolution: {text(key)}")
        name = string_value(key) if key.type.endswith("string_literal") else text(key)
        if name in result:
            raise CatalogError(f"Duplicate schema key: {name}")
        result[name] = unwrap(entry.child_by_field_name("value"))
    return result


def expression_list(node):
    if node is None:
        return []
    node = unwrap(node)
    if node.type != "composite_literal":
        raise CatalogError(f"Expected explicit validator/plan-modifier list: {text(node)}")
    return [text(unwrap(n)) for n in node.child_by_field_name("body").named_children if n.type != "comment"]


def boolean(props, name):
    if name not in props:
        return False
    value = text(props[name])
    if value not in {"true", "false"}:
        raise CatalogError(f"Nonliteral schema flag {name}: {value}")
    return value == "true"


def primitive_type(node):
    name = text(node).split(".")[-1].removesuffix("{}").removesuffix("Type")
    if name not in SCALARS:
        raise CatalogError(f"Unsupported ElementType: {text(node)}")
    return SCALARS[name]


def attributes_from_map(node, source_file, prefix="", parent_configurable=True, parent_sensitive=False):
    result = []
    for name, value in sorted(fields(node, attribute_keys=True).items()):
        if value.type != "composite_literal":
            raise CatalogError(f"{source_file}: nonliteral attribute {name}: {text(value)}")
        schema_type = text(value.child_by_field_name("type"))
        kind = schema_type.split(".")[-1].removesuffix("Attribute")
        props = fields(value)
        if "CustomType" in props:
            raise CatalogError(f"{source_file}: unsupported CustomType on {name}")
        children_map = None
        suffix = "."
        if kind in SCALARS:
            value_type = SCALARS[kind]
        elif kind in {"List", "Set", "Map"}:
            value_type = f"{kind.lower()}({primitive_type(props['ElementType'])})"
        elif kind in {"ListNested", "SetNested", "MapNested", "SingleNested"}:
            collection = kind.removesuffix("Nested").lower()
            nested_props = fields(props["NestedObject"]) if "NestedObject" in props else props
            children_map = nested_props["Attributes"]
            if collection == "single":
                value_type = "object"
            else:
                value_type = f"{collection}(object)"
                suffix = "{}." if collection == "map" else "[]."
        else:
            raise CatalogError(f"{source_file}: unsupported schema type {schema_type}")
        path = prefix + name
        required, optional = boolean(props, "Required"), boolean(props, "Optional")
        computed, sensitive = boolean(props, "Computed"), boolean(props, "Sensitive")
        configurable = parent_configurable and (required or optional)
        description_node = props.get("MarkdownDescription", props.get("Description"))
        description = string_value(description_node) if description_node is not None else ""
        attribute = {
            "name": name, "path": path, "type": value_type, "schema_type": schema_type,
            "required": required, "optional": optional, "computed": computed,
            "configurable": configurable, "sensitive": sensitive,
            "effective_sensitive": sensitive or parent_sensitive,
            "write_only": boolean(props, "WriteOnly"),
            "description": description,
            "deprecated": string_value(props["DeprecationMessage"]) if "DeprecationMessage" in props else "",
            "default_expression": text(props.get("Default")),
            "validators": expression_list(props.get("Validators")),
            "plan_modifiers": expression_list(props.get("PlanModifiers")),
            "source_file": source_file, "source_line": value.start_point.row + 1,
            "children": [],
        }
        if children_map is not None:
            attribute["children"] = attributes_from_map(
                children_map, source_file, path + suffix, configurable,
                attribute["effective_sensitive"],
            )
        result.append(attribute)
    return result


def extract_schema(source, receiver, source_file):
    method = method_node(parse_go(source, source_file), "Schema", receiver)
    body = method.child_by_field_name("body")
    if any(n.type in {"if_statement", "for_statement", "expression_switch_statement"} for n in walk(body)):
        raise CatalogError(f"{source_file}: conditional Schema requires runtime extraction")
    assignments = []
    for statement_list in body.named_children:
        if statement_list.type == "comment":
            continue
        if statement_list.type != "statement_list":
            raise CatalogError(f"{source_file}: unsupported Schema mutation: {text(statement_list)}")
        for statement in statement_list.named_children:
            if statement.type == "comment":
                continue
            if statement.type != "assignment_statement":
                raise CatalogError(f"{source_file}: possible Schema mutation requires runtime extraction: {text(statement)}")
            assignments.append(statement)
    for assignment in assignments:
        lhs = text(assignment.child_by_field_name("left"))
        if not re.fullmatch(r"\w+\.Schema(?:\.\w+)?", lhs):
            raise CatalogError(f"{source_file}: unsupported Schema mutation: {lhs}")
    schemas = [
        n for n in walk(body) if n.type == "composite_literal"
        and text(n.child_by_field_name("type")).endswith(".Schema")
    ]
    if len(schemas) == 1:
        if len(assignments) != 1 or not re.fullmatch(
            r"\w+\.Schema", text(assignments[0].child_by_field_name("left"))
        ):
            raise CatalogError(f"{source_file}: Schema mutation after/beside the complete literal")
        values = assignments[0].child_by_field_name("right").named_children
        if len(values) != 1 or unwrap(values[0]) != schemas[0]:
            raise CatalogError(f"{source_file}: indirect Schema mutation requires runtime extraction")
        props = fields(schemas[0])
    elif not schemas:
        props = {}
        for assignment in assignments:
            lhs = text(assignment.child_by_field_name("left"))
            match = re.fullmatch(r"\w+\.Schema\.(\w+)", lhs)
            if match:
                values = assignment.child_by_field_name("right").named_children
                if len(values) != 1 or match[1] in props:
                    raise CatalogError(f"{source_file}: ambiguous schema assignment {lhs}")
                props[match[1]] = values[0]
    else:
        raise CatalogError(f"{source_file}: multiple Schema literals")
    if "Attributes" not in props:
        raise CatalogError(f"{source_file}: no explicit Attributes map")
    if "Blocks" in props:
        raise CatalogError(f"{source_file}: block schema is not supported by this catalog generator")
    description_node = props.get("MarkdownDescription", props.get("Description"))
    description, service, url = "", "", ""
    if description_node is not None:
        if description_node.type == "call_expression" and text(
            description_node.child_by_field_name("function")
        ).endswith(".FormatDesc"):
            args = description_node.child_by_field_name("arguments").named_children
            description, service, url = [string_value(n) for n in args if n.type != "comment"]
        else:
            description = string_value(description_node)
    return {
        "description": description, "service": service, "service_url": url,
        "source_line": method.start_point.row + 1,
        "attributes": attributes_from_map(props["Attributes"], source_file),
    }


def flatten(attributes):
    return [item for attribute in attributes for item in [attribute, *flatten(attribute["children"])]]


def registered_constructors(source, method):
    declaration = method_node(parse_go(source), method)
    builder = "buildResource" if method == "Resources" else "buildDataSource"
    calls = [
        node for node in walk(declaration.child_by_field_name("body"))
        if node.type == "call_expression"
        and text(node.child_by_field_name("function")).endswith("." + builder)
    ]
    if len(calls) != 1:
        raise CatalogError(f"Expected one {builder} call")
    result = []
    for node in calls[0].child_by_field_name("arguments").named_children:
        if node.type == "comment":
            continue
        if node.type != "call_expression":
            raise CatalogError(f"Unsupported registration: {text(node)}")
        function = node.child_by_field_name("function")
        if function.type != "selector_expression":
            raise CatalogError(f"Unsupported constructor: {text(node)}")
        result.append((text(function.child_by_field_name("operand")), text(function.child_by_field_name("field"))))
    if len(result) != len(set(result)):
        raise CatalogError(f"Duplicate registrations in {method}")
    return result


def input_type(attribute, indent):
    children = [a for a in attribute["children"] if a["configurable"]]
    if not attribute["children"]:
        result = attribute["type"]
    else:
        lines = [
            " " * (indent + 2) + a["name"] + " = " + input_type(a, indent + 2)
            for a in children
        ]
        result = "object({\n" + "\n".join(lines) + "\n" + " " * indent + "})"
        if attribute["type"] != "object":
            result = attribute["type"].split("(")[0] + "(" + result + ")"
    return result if attribute["required"] else "optional(" + result + ")"


def render_template(resource):
    inputs = [a for a in resource["attributes"] if a["configurable"]]
    readonly = [a for a in flatten(resource["attributes"]) if not a["configurable"]]
    lines = [
        "# Generated from registered Go Schema; see the linked resource detail.",
        "# Complete input shape, not a deployment scenario or a set of valid sample values.",
        "# Required members need real values. Omit optional members you do not need.",
        "# Do not set conflicting options together. Optional+Computed is configurable.",
        "# This file is a standalone module; do not apply the whole templates directory.",
        'terraform {',
        '  required_version = ">= 1.5.7"',
        "  required_providers {",
        "    ctyun = {",
        '      source = "ctyun-it/ctyun"',
        "    }",
        "  }",
        "}",
        "",
        "# Configure credentials/region using CTYUN_* environment variables.",
        'provider "ctyun" {}',
        "",
        'variable "config" {',
        '  description = "Complete configurable shape for ' + resource["type"] + '; consult constraints before use."',
        "  nullable = false",
    ]
    if any(a["effective_sensitive"] and a["configurable"] for a in flatten(resource["attributes"])):
        lines.append("  sensitive = true")
    lines.append("  type = object({")
    for attribute in inputs:
        lines.append("    " + attribute["name"] + " = " + input_type(attribute, 4))
    lines.extend(["  })", "}", "", f'resource "{resource["type"]}" "example" {{'])
    lines.extend("  " + a["name"] + " = var.config." + a["name"] for a in inputs)
    lines.extend(["}", "", "# Read-only attributes (reference only; never resource assignments):"])
    for attribute in readonly:
        reference = attribute["path"].replace("[]", "[*]").replace("{}", '["<key>"]')
        lines.append(f'# {resource["type"]}.example.{reference} : {attribute["type"]}')
    return "\n".join(lines) + "\n"


def template_input_paths(source):
    return set(template_input_fields(source))


def template_input_fields(source):
    tree = hcl2.parses(source)
    result = {}

    def descend(node, prefix):
        while isinstance(node, Tree) and node.data == "expr_term":
            node = node.children[0]
        if node.data == "function_call":
            name = str(node.children[0].children[0])
            arguments = node.children[1]
            child = next(n for n in arguments.children if isinstance(n, Tree) and n.data == "expr_term")
            suffix = "[]" if name in {"list", "set"} else "{}" if name == "map" else ""
            kind, optional = descend(child, prefix + suffix)
            if name == "optional":
                return kind, True
            if name == "object":
                return kind, optional
            if name in {"list", "set", "map"}:
                return f"{name}({kind})", False
            raise CatalogError(f"Unexpected type function: {name}")
        elif node.data == "object":
            for entry in node.children:
                if not isinstance(entry, Tree) or entry.data != "object_elem":
                    continue
                key = str(entry.children[0].children[0].children[0])
                path = (prefix + "." if prefix else "") + key
                result[path] = descend(entry.children[-1], path)
            return "object", False
        elif node.data == "identifier":
            return str(node.children[0]), False
        raise CatalogError(f"Unexpected template type expression: {node.data}")

    for block in tree.find_data("block"):
        if str(block.children[0].children[0]) != "variable":
            continue
        for attribute in block.children[-1].children:
            if isinstance(attribute, Tree) and attribute.data == "attribute":
                if str(attribute.children[0].children[0]) == "type":
                    descend(attribute.children[-1], "")
    return result


def canonical_path(path):
    return path.replace("[]", "").replace("{}", "")


def documented_schema(document):
    match = re.search(r"(?m)^## Schema\s*$", document)
    if not match:
        return {}
    prefix, mode, result = "", "", {}
    for line in document[match.end():].splitlines():
        if line.startswith("## "):
            break
        nested = re.match(r"### Nested Schema for `([^`]+)`", line)
        if nested:
            prefix = nested[1] + "."
        category = re.fullmatch(r"(?:### )?(Required|Optional|Read-Only):?\s*", line)
        if category:
            mode = category[1]
        entry = re.match(r"- `([^`]+)` \(([^)]+)\)", line)
        if entry:
            path = prefix + entry[1]
            if path in result:
                raise CatalogError(f"Duplicate documented schema attribute: {path}")
            result[path] = {"mode": mode, "type": entry[2]}
    return result


def documentation_type(attribute):
    kind = attribute["schema_type"].split(".")[-1]
    nested = {
        "SingleNestedAttribute": "Attributes", "ListNestedAttribute": "Attributes List",
        "SetNestedAttribute": "Attributes Set", "MapNestedAttribute": "Attributes Map",
    }
    if kind in nested:
        return nested[kind]
    primitives = {"string": "String", "bool": "Boolean", "number": "Number"}
    value_type = attribute["type"]
    if value_type in primitives:
        return primitives[value_type]
    collection, element = value_type.removesuffix(")").split("(")
    return collection.title() + " of " + primitives[element]


def audit_document(resource, document):
    attributes = flatten(resource["attributes"])
    expected = {a["path"] for a in attributes if a["configurable"]}
    source_by_path = {canonical_path(a["path"]): a for a in attributes}
    documented = documented_schema(document)
    modes = [
        {"path": a["path"], "source": "Required" if a["required"] else "Optional" if a["optional"] else "Read-Only",
         "document": documented[p]["mode"]}
        for p, a in source_by_path.items() if p in documented
        and documented[p]["mode"] != ("Required" if a["required"] else "Optional" if a["optional"] else "Read-Only")
    ]
    type_mismatches = [
        {"path": a["path"], "source": documentation_type(a), "document": documented[p]["type"]}
        for p, a in source_by_path.items() if p in documented
        and documented[p]["type"].split(",")[0] != documentation_type(a)
    ]
    present, unknown, readonly, unexpanded = set(), set(), set(), set()
    errors, targets = [], 0
    meta = {"count", "for_each", "depends_on", "lifecycle", "provider", "provisioner", "connection"}

    def inspect(values, schema, prefix=""):
        if not isinstance(values, dict):
            raise CatalogError(f"Expected resource object, got {type(values).__name__}")
        by_name = {a["name"]: a for a in schema}
        for name, value in values.items():
            if not prefix and name in meta:
                continue
            if name not in by_name:
                unknown.add(prefix + name)
                continue
            attribute = by_name[name]
            path = attribute["path"]
            if attribute["configurable"]:
                present.add(path)
            else:
                readonly.add(path)
            if not attribute["children"]:
                continue
            if attribute["type"] == "object" and isinstance(value, dict):
                inspect(value, attribute["children"], path + ".")
            elif isinstance(value, list):
                for item in value:
                    if isinstance(item, dict):
                        inspect(item, attribute["children"], path + "[].")
                    else:
                        unexpanded.add(path)
            elif attribute["type"] == "map(object)" and isinstance(value, dict):
                for item in value.values():
                    if isinstance(item, dict):
                        inspect(item, attribute["children"], path + "{}.")
                    else:
                        unexpanded.add(path)
            elif value is not None:
                unexpanded.add(path)

    before_schema = re.split(r"(?m)^## Schema\s*$", document, maxsplit=1)[0]
    for index, code in enumerate(re.findall(r"(?ms)^```(?:terraform|hcl)\s*\n(.*?)^```\s*$", before_schema), 1):
        try:
            config = hcl2.loads(code)
        except (LarkError, ValueError) as error:
            errors.append(f"Example block {index}: {error}")
            continue
        for block in config.get("resource", []):
            for values in block.get(resource["type"], {}).values():
                targets += 1
                inspect(values, resource["attributes"])
    missing = sorted(expected - present)
    status = "error" if errors else "no_target" if not targets else "invalid" if unknown or readonly else "partial" if missing else "complete"
    return {
        "schema_missing": sorted(source_by_path[p]["path"] for p in source_by_path.keys() - documented.keys()),
        "schema_extra": sorted(documented.keys() - source_by_path.keys()),
        "schema_mode_mismatches": modes, "schema_type_mismatches": type_mismatches,
        "example_present": sorted(present), "example_missing": missing,
        "example_unknown": sorted(unknown), "example_readonly": sorted(readonly),
        "example_unexpanded": sorted(unexpanded), "example_errors": errors,
        "example_target_blocks": targets, "example_status": status,
    }


def build_inventory(root):
    root = Path(root).resolve()
    service_dir = root / "internal" / "service"
    files, functions, methods, package_names = {}, {}, {}, {}
    for path in sorted(service_dir.rglob("*.go")):
        if path.name.endswith("_test.go"):
            continue
        source = path.read_text(encoding="utf-8-sig")
        tree = parse_go(source, str(path))
        files[path] = (source, tree)
        package = next(n for n in tree.named_children if n.type == "package_clause")
        package_names[path.parent] = text(package.named_children[0])
        for node in tree.named_children:
            if node.type == "function_declaration":
                key = (path.parent, text(node.child_by_field_name("name")))
                if key in functions:
                    raise CatalogError(f"Duplicate constructor/function: {key}")
                functions[key] = (path, node)
            elif node.type == "method_declaration":
                key = (path.parent, receiver_name(node), text(node.child_by_field_name("name")))
                if key in methods:
                    raise CatalogError(f"Duplicate method: {key}")
                methods[key] = (path, node)
    provider_file = service_dir / "ctyun_provider.go"
    provider_source, provider_tree = files[provider_file]
    provider_metadata = method_node(provider_tree, "Metadata")
    provider_receiver = receiver_name(provider_metadata)

    def type_name(metadata, provider_name):
        assignments = [
            node for node in walk(metadata.child_by_field_name("body"))
            if node.type == "assignment_statement"
            and text(node.child_by_field_name("left")).endswith(".TypeName")
        ]
        if len(assignments) != 1:
            raise CatalogError("Metadata must assign TypeName exactly once")
        expression = assignments[0].child_by_field_name("right").named_children[0]
        if expression.type == "binary_expression":
            left = text(expression.child_by_field_name("left"))
            if left.endswith(".ProviderTypeName") and text(expression.child_by_field_name("operator")) == "+":
                return provider_name + string_value(expression.child_by_field_name("right"))
        return string_value(expression)

    provider_name = type_name(provider_metadata, "")
    module_match = re.search(r"(?m)^module\s+(\S+)", (root / "go.mod").read_text(encoding="utf-8"))
    if not module_match:
        raise CatalogError("go.mod has no module declaration")
    imports = {}
    for spec in (n for n in walk(provider_tree) if n.type == "import_spec"):
        module_path = string_value(spec.child_by_field_name("path"))
        if not module_path.startswith(module_match[1] + "/internal/service/"):
            continue
        relative = module_path.removeprefix(module_match[1] + "/")
        directory = root.joinpath(*relative.split("/"))
        alias = text(spec.child_by_field_name("name")) or package_names[directory]
        imports[alias] = directory

    def resolve_constructor(alias, name):
        directory = imports[alias]
        path, declaration = functions[(directory, name)]
        returns = [n for n in walk(declaration.child_by_field_name("body")) if n.type == "return_statement"]
        if len(returns) != 1:
            raise CatalogError(f"{path}: constructor {name} has multiple returns")
        composites = [n for n in walk(returns[0]) if n.type == "composite_literal"]
        if not composites:
            raise CatalogError(f"{path}: cannot resolve constructor {name}")
        return directory, text(composites[0].child_by_field_name("type"))

    def resource_metadata(directory, receiver):
        path, metadata = methods[(directory, receiver, "Metadata")]
        name = type_name(metadata, provider_name)
        schema_path, schema_method = methods[(directory, receiver, "Schema")]
        descriptions = [
            n for n in walk(schema_method.child_by_field_name("body"))
            if n.type == "call_expression"
            and text(n.child_by_field_name("function")).endswith(".FormatDesc")
        ]
        description, service, url = "", "", ""
        if len(descriptions) == 1:
            args = descriptions[0].child_by_field_name("arguments").named_children
            description, service, url = [string_value(n) for n in args if n.type != "comment"]
        return {
            "type": name, "description": description, "service": service,
            "service_url": url, "module": directory.name,
            "source_file": schema_path.relative_to(root).as_posix(),
            "source_line": schema_method.start_point.row + 1,
        }

    resources, data_sources, registered = [], [], set()
    for section, destination in (("Resources", resources), ("DataSources", data_sources)):
        names = set()
        for alias, constructor in registered_constructors(provider_source, section):
            directory, receiver = resolve_constructor(alias, constructor)
            item = resource_metadata(directory, receiver)
            if item["type"] in names:
                raise CatalogError(f"Duplicate Terraform type: {item['type']}")
            names.add(item["type"])
            item["constructor"] = alias + "." + constructor
            document_folder = "resources" if section == "Resources" else "data-sources"
            document = root / "docs" / document_folder / (item["type"].removeprefix(provider_name + "_") + ".md")
            item["document_file"] = document.relative_to(root).as_posix()
            item["document_exists"] = document.is_file()
            if section == "Resources":
                registered.add((directory, receiver))
                schema_path, _ = methods[(directory, receiver, "Schema")]
                item.update(extract_schema(files[schema_path][0], receiver, item["source_file"]))
                item["import_state_implemented"] = (directory, receiver, "ImportState") in methods
                item["audit"] = audit_document(item, document.read_text(encoding="utf-8-sig") if document.is_file() else "")
                example = root / "examples" / "resources" / item["type"] / "resource.tf"
                item["example_file"] = example.relative_to(root).as_posix() if example.is_file() else ""
                if example.is_file():
                    example_audit = audit_document(
                        item, "## Example\n```terraform\n" + example.read_text(encoding="utf-8-sig") + "\n```\n"
                    )
                    item["source_example_audit"] = {k: v for k, v in example_audit.items() if k.startswith("example_")}
            destination.append(item)
        destination.sort(key=lambda item: item["type"])
    unregistered = []
    for (directory, receiver, name), (path, node) in methods.items():
        if name != "Schema" or not path.name.startswith("resource") or (directory, receiver) in registered:
            continue
        unregistered.append(resource_metadata(directory, receiver))
    main_tree = parse_go((root / "main.go").read_text(encoding="utf-8-sig"))
    versions = [
        n for n in walk(main_tree) if n.type == "var_spec"
        and text(n.child_by_field_name("name")) == "version"
    ]
    if len(versions) != 1:
        raise CatalogError("Cannot determine provider version from main.go")
    provider = extract_schema(provider_source, provider_receiver, provider_file.relative_to(root).as_posix())
    provider["source_file"] = provider_file.relative_to(root).as_posix()
    source_files = {root / "main.go", root / "go.mod", *files}
    for folder in ("business", "extend", "utils", "common"):
        source_files.update(p for p in (root / "internal" / folder).rglob("*.go") if not p.name.endswith("_test.go"))
    digest = hashlib.sha256()
    for path in sorted(source_files):
        digest.update(path.relative_to(root).as_posix().encode() + b"\0" + path.read_bytes() + b"\0")
    return {
        "format_version": 1, "provider_name": provider_name,
        "provider_version": string_value(versions[0].child_by_field_name("value").named_children[0]),
        "extraction_method": "Go AST: registered constructors -> Metadata -> static Schema; no provider execution",
        "source_sha256": digest.hexdigest(),
        "source_files_hashed": len(source_files),
        "provider": provider, "resources": resources, "data_sources": data_sources,
        "unregistered": sorted(unregistered, key=lambda item: item["type"]),
        "unregistered_documents": sorted(
            provider_name + "_" + p.stem for p in (root / "docs" / "resources").glob("*.md")
            if provider_name + "_" + p.stem not in {r["type"] for r in resources}
        ),
    }
