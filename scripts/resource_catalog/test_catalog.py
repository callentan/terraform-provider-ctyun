import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

import hcl2

import catalog


SCHEMA = r'''
package fixture

func (r *Example) Schema(ctx context.Context, req resource.SchemaRequest, resp *resource.SchemaResponse) {
    resp.Schema = schema.Schema{
        MarkdownDescription: utils.FormatDesc("Manage example", "Example service", "https://example.test"),
        Attributes: map[string]schema.Attribute{
            "id": schema.StringAttribute{Computed: true, Description: "Identifier"},
            "name": schema.StringAttribute{Required: true, Description: "Name"},
            "size": schema.Int64Attribute{
                Optional: true, Computed: true, Description: "Size",
                Default: int64default.StaticInt64(10),
                Validators: []validator.Int64{int64validator.Between(1, 100)},
                PlanModifiers: []planmodifier.Int64{int64planmodifier.RequiresReplace()},
            },
            "password": schema.StringAttribute{Optional: true, Sensitive: true},
            "labels": schema.ListNestedAttribute{
                Optional: true,
                NestedObject: schema.NestedAttributeObject{
                    Attributes: map[string]schema.Attribute{
                        "key": schema.StringAttribute{Required: true},
                        "value": schema.StringAttribute{Optional: true, Computed: true},
                        "server_id": schema.StringAttribute{Computed: true},
                    },
                },
            },
            "observed": schema.SingleNestedAttribute{
                Computed: true,
                Attributes: map[string]schema.Attribute{
                    "status": schema.StringAttribute{Computed: true},
                },
            },
        },
    }
}
'''


def fixture_resource():
    return {
        "type": "ctyun_test",
        "description": "Manage example",
        "service": "Example service",
        "source_file": "fixture.go",
        "attributes": catalog.extract_schema(SCHEMA, "Example", "fixture.go")["attributes"],
    }


class SourceTests(unittest.TestCase):
    def test_extracts_nested_attributes_and_optional_computed(self):
        result = catalog.extract_schema(SCHEMA, "Example", "fixture.go")
        attrs = {a["path"]: a for a in catalog.flatten(result["attributes"])}
        self.assertEqual(
            set(attrs),
            {"id", "name", "size", "password", "labels", "labels[].key",
             "labels[].value", "labels[].server_id", "observed", "observed.status"},
        )
        self.assertTrue(attrs["size"]["optional"])
        self.assertTrue(attrs["size"]["computed"])
        self.assertTrue(attrs["size"]["configurable"])
        self.assertFalse(attrs["labels[].server_id"]["configurable"])
        self.assertFalse(attrs["observed.status"]["configurable"])
        self.assertEqual(attrs["size"]["default_expression"], "int64default.StaticInt64(10)")
        self.assertEqual(attrs["size"]["validators"], ["int64validator.Between(1, 100)"])
        self.assertEqual(attrs["size"]["plan_modifiers"], ["int64planmodifier.RequiresReplace()"])
        self.assertEqual(result["service"], "Example service")
        self.assertGreater(attrs["labels[].key"]["source_line"], attrs["labels"]["source_line"])

    def test_registry_excludes_comments_and_data_sources(self):
        source = '''
package service
func (p *Provider) Resources(ctx context.Context) []func() resource.Resource {
    return p.buildResource(
        vpc.NewVpc(),
        // vpc.NewDisabled(),
        ecs.NewEcs(),
    )
}
func (p *Provider) DataSources(ctx context.Context) []func() datasource.DataSource {
    return p.buildDataSource(vpc.NewVpcs())
}
'''
        self.assertEqual(
            catalog.registered_constructors(source, "Resources"),
            [("vpc", "NewVpc"), ("ecs", "NewEcs")],
        )
        self.assertEqual(
            catalog.registered_constructors(source, "DataSources"), [("vpc", "NewVpcs")]
        )

    def test_rejects_dynamic_schema_instead_of_silently_omitting_it(self):
        dynamic = '''
package fixture
func (r *Example) Schema(ctx context.Context, req resource.SchemaRequest, resp *resource.SchemaResponse) {
    resp.Schema.Attributes = makeAttributes()
}
'''
        with self.assertRaisesRegex(catalog.CatalogError, "Attributes"):
            catalog.extract_schema(dynamic, "Example", "fixture.go")

    def test_rejects_unknown_attribute_types(self):
        with self.assertRaisesRegex(catalog.CatalogError, "UnsupportedAttribute"):
            catalog.extract_schema(
                SCHEMA.replace("schema.Int64Attribute", "schema.UnsupportedAttribute"),
                "Example", "fixture.go",
            )

    def test_ignores_attribute_like_text_in_comments(self):
        source = SCHEMA.replace(
            '"id": schema.StringAttribute',
            '// "fake": schema.StringAttribute{Required: true},\n"id": schema.StringAttribute',
        )
        paths = {a["path"] for a in catalog.flatten(
            catalog.extract_schema(source, "Example", "fixture.go")["attributes"]
        )}
        self.assertNotIn("fake", paths)

    def test_rejects_schema_mutation_after_the_literal(self):
        source = SCHEMA.rsplit("\n}", 1)[0] + '''
    resp.Schema.Attributes["hidden"] = schema.StringAttribute{Optional: true}
}
'''
        with self.assertRaisesRegex(catalog.CatalogError, "mutation"):
            catalog.extract_schema(source, "Example", "fixture.go")

    def test_rejects_replacement_of_the_literal_attributes_map(self):
        source = SCHEMA.rsplit("\n}", 1)[0] + '''
    resp.Schema.Attributes = map[string]schema.Attribute{
        "hidden": schema.StringAttribute{Optional: true},
    }
}
'''
        with self.assertRaisesRegex(catalog.CatalogError, "mutation"):
            catalog.extract_schema(source, "Example", "fixture.go")

    def test_rejects_helper_calls_that_can_mutate_the_schema(self):
        source = SCHEMA.rsplit("\n}", 1)[0] + '''
    addAttributes(&resp.Schema)
}
'''
        with self.assertRaisesRegex(catalog.CatalogError, "mutation"):
            catalog.extract_schema(source, "Example", "fixture.go")

    def test_rejects_constant_attribute_keys_instead_of_inventing_a_name(self):
        source = SCHEMA.replace(
            "package fixture", 'package fixture\nconst attributeName = "name"'
        ).replace('"name": schema.StringAttribute', "attributeName: schema.StringAttribute")
        with self.assertRaisesRegex(catalog.CatalogError, "attribute key"):
            catalog.extract_schema(source, "Example", "fixture.go")


class TemplateTests(unittest.TestCase):
    def test_template_includes_all_inputs_without_assigning_computed_fields(self):
        text = catalog.render_template(fixture_resource())
        parsed = hcl2.loads(text)
        self.assertIn("resource", parsed, "The template must contain a resource block")
        resource = parsed["resource"][0]["ctyun_test"]["example"]
        self.assertEqual(set(resource), {"name", "size", "password", "labels"})
        self.assertEqual(resource["size"], "${var.config.size}")
        self.assertEqual(parsed["variable"][0]["config"]["sensitive"], True)
        self.assertEqual(
            catalog.template_input_paths(text),
            {"name", "size", "password", "labels", "labels[].key", "labels[].value"},
        )

    def test_template_preserves_types_and_nested_optional_flags(self):
        self.assertEqual(
            catalog.template_input_fields(catalog.render_template(fixture_resource())),
            {
                "name": ("string", False), "size": ("number", True),
                "password": ("string", True), "labels": ("list(object)", True),
                "labels[].key": ("string", False), "labels[].value": ("string", True),
            },
        )


class AuditTests(unittest.TestCase):
    def test_example_audit_ignores_related_resources_and_commented_arguments(self):
        resource = fixture_resource()
        text = '''
## Example
```terraform
resource "ctyun_related" "other" {
  password = "not-a-test-password"
}
resource "ctyun_test" "example" {
  name = "example"
  # password = "not-configured"
  labels = [{key = "team", value = "example"}]
}
```
## Schema
### Required
- `name` (String) Name
### Optional
- `labels` (Attributes List) Labels
- `size` (Number) Size
### Read-Only
- `id` (String) Identifier
<a id="nestedatt--labels"></a>
### Nested Schema for `labels`
Required:
- `key` (String) Key
Optional:
- `value` (String) Value
Read-Only:
- `server_id` (String) Server ID
'''
        audit = catalog.audit_document(resource, text)
        self.assertEqual(audit["example_present"], ["labels", "labels[].key", "labels[].value", "name"])
        self.assertEqual(audit["example_missing"], ["password", "size"])
        self.assertEqual(audit["schema_missing"], ["observed", "observed.status", "password"])
        self.assertEqual(audit["schema_extra"], [])

    def test_dynamic_nested_expression_is_recorded_as_unexpanded(self):
        audit = catalog.audit_document(fixture_resource(), '''
## Example
```hcl
resource "ctyun_test" "example" {
  name = var.name
  labels = var.labels
}
```
''')
        self.assertEqual(audit["example_unexpanded"], ["labels"])
        self.assertIn("labels[].key", audit["example_missing"])

    def test_invalid_example_is_not_reported_as_complete(self):
        audit = catalog.audit_document(fixture_resource(), '''
## Example
```terraform
resource "ctyun_test" "example" {
  invalid =
}
```
''')
        self.assertTrue(audit["example_errors"])
        self.assertNotEqual(audit["example_status"], "complete")

    def test_example_reports_unknown_and_readonly_arguments(self):
        audit = catalog.audit_document(fixture_resource(), '''
## Example
```terraform
resource "ctyun_test" "example" {
  name = "example"
  id = "readonly"
  labels = [{key = "example", unknown = "bad"}]
}
```
''')
        self.assertEqual(audit["example_unknown"], ["labels[].unknown"])
        self.assertEqual(audit["example_readonly"], ["id"])

    def test_doc_audit_detects_type_and_requiredness_drift(self):
        audit = catalog.audit_document(fixture_resource(), '''
## Schema
### Optional
- `name` (String) Name
- `size` (String) Wrong type
''')
        self.assertEqual(
            audit["schema_mode_mismatches"],
            [{"path": "name", "source": "Required", "document": "Optional"}],
        )
        self.assertEqual(
            audit["schema_type_mismatches"],
            [{"path": "size", "source": "Number", "document": "String"}],
        )


class InventoryTests(unittest.TestCase):
    def test_inventory_uses_registration_not_resource_filenames(self):
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            service = root / "internal" / "service"
            package = service / "example"
            package.mkdir(parents=True)
            (root / "go.mod").write_text("module example.test/provider\n\ngo 1.23.0\n", encoding="utf-8")
            (root / "main.go").write_text('package main\nvar version = "1.2.3"\n', encoding="utf-8")
            (service / "ctyun_provider.go").write_text('''
package service
import ex "example.test/provider/internal/service/example"
func (p *Provider) Metadata(ctx context.Context, req provider.MetadataRequest, resp *provider.MetadataResponse) {
    resp.TypeName = "ctyun"
}
func (p *Provider) Schema(ctx context.Context, req provider.SchemaRequest, resp *provider.SchemaResponse) {
    resp.Schema.Attributes = map[string]schema.Attribute{
        "ak": schema.StringAttribute{Optional: true, Sensitive: true},
    }
}
func (p *Provider) Resources(ctx context.Context) []func() resource.Resource {
    return p.buildResource(ex.NewExample())
}
func (p *Provider) DataSources(ctx context.Context) []func() datasource.DataSource {
    return p.buildDataSource(ex.NewExamples())
}
''', encoding="utf-8")
            (package / "resource_unrelated_filename.go").write_text(
                SCHEMA + '''
func NewExample() resource.Resource { return &Example{} }
func (r *Example) Metadata(ctx context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
    resp.TypeName = req.ProviderTypeName + "_test"
}
''', encoding="utf-8")
            (package / "resource_disabled.go").write_text(
                SCHEMA.replace("Example)", "Disabled)") + '''
func NewDisabled() resource.Resource { return &Disabled{} }
func (r *Disabled) Metadata(ctx context.Context, req resource.MetadataRequest, resp *resource.MetadataResponse) {
    resp.TypeName = req.ProviderTypeName + "_disabled"
}
''', encoding="utf-8")
            (package / "data_source_examples.go").write_text('''
package fixture
func NewExamples() datasource.DataSource { return &Examples{} }
func (r *Examples) Metadata(ctx context.Context, req datasource.MetadataRequest, resp *datasource.MetadataResponse) {
    resp.TypeName = req.ProviderTypeName + "_tests"
}
func (r *Examples) Schema(ctx context.Context, req datasource.SchemaRequest, resp *datasource.SchemaResponse) {
    resp.Schema = schema.Schema{
        MarkdownDescription: utils.FormatDesc("Query examples", "Example service", "https://example.test"),
        Attributes: map[string]schema.Attribute{
            "id": schema.StringAttribute{Computed: true},
        },
    }
}
''', encoding="utf-8")
            inventory = catalog.build_inventory(root)
            self.assertEqual([r["type"] for r in inventory["resources"]], ["ctyun_test"])
            self.assertEqual([r["type"] for r in inventory["data_sources"]], ["ctyun_tests"])
            self.assertEqual([r["type"] for r in inventory["unregistered"]], ["ctyun_disabled"])
            self.assertEqual(inventory["provider_version"], "1.2.3")
            self.assertEqual(inventory["provider"]["attributes"][0]["path"], "ak")
            self.assertFalse(inventory["resources"][0]["document_exists"])
            self.assertEqual(len(inventory["source_sha256"]), 64)


if __name__ == "__main__":
    unittest.main()
