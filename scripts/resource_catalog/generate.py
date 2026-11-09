"""Render the resource inventory as linked Markdown, Terraform, JSON and CSV."""

import argparse
import csv
import hashlib
import html
import io
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
from tempfile import TemporaryDirectory

import hcl2

import catalog


STATUS = {
    "complete": "字段展示完整", "partial": "未完整展示", "no_target": "缺少目标资源块",
    "invalid": "存在不支持的参数/块", "error": "示例无法解析",
}


def cell(value):
    value = str(value).replace("\r\n", "\n").replace("\r", "\n")
    return (html.escape(value, quote=False).replace("|", "&#124;")
            .replace("[", "&#91;").replace("]", "&#93;").replace("\n", "<br>"))


def code(value):
    return "<code>" + cell(value) + "</code>" if value else "—"


def table(headers, rows):
    return "\n".join([
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
        *("| " + " | ".join(str(value) for value in row) + " |" for row in rows),
    ]) + "\n"


def mode(attribute):
    return "+".join(label for key, label in (
        ("required", "R"), ("optional", "O"), ("computed", "C")
    ) if attribute[key])


def counts(resource):
    attributes = catalog.flatten(resource["attributes"])
    return {
        "top_required": sum(a["required"] for a in resource["attributes"]),
        "top_optional": sum(a["optional"] for a in resource["attributes"]),
        "top_readonly": sum(not a["configurable"] for a in resource["attributes"]),
        "all_configurable": sum(a["configurable"] for a in attributes),
        "all_readonly": sum(not a["configurable"] for a in attributes),
        "all_attributes": len(attributes),
    }


def schema_matches(audit):
    return not any(audit[key] for key in (
        "schema_missing", "schema_extra", "schema_mode_mismatches", "schema_type_mismatches"
    ))


def attribute_table(attributes, prefix):
    rows = []
    for attribute in attributes:
        link = f'{prefix}{attribute["source_file"]}#L{attribute["source_line"]}'
        description = attribute["description"]
        if attribute["deprecated"]:
            description += "\n已弃用：" + attribute["deprecated"]
        rows.append([
            f'[{code(attribute["path"])}]({link})',
            code(attribute["type"]) + "<br>" + code(attribute["schema_type"].split(".")[-1]),
            mode(attribute), "是" if attribute["effective_sensitive"] else "否",
            code(attribute["default_expression"]), cell(description) or "—",
        ])
    return table(["属性路径（源码）", "类型", "模式", "敏感", "默认值表达式", "说明"], rows) if rows else "无。\n"


def render_detail(resource, template):
    name, audit, stats = resource["type"], resource["audit"], counts(resource)
    attributes = catalog.flatten(resource["attributes"])
    lines = [
        f"# {name}", "",
        "[返回汇总](../README.md) · [下载 TF 模板](../templates/" + name + ".tf) · "
        + f'[源码](../../../{resource["source_file"]}#L{resource["source_line"]})'
        + (f' · [原文档](../../../{resource["document_file"]})' if resource["document_exists"] else ""),
        "", f'**产品分类：** {cell(resource["service"])}。**用途：** {cell(resource["description"])}。',
        "", f'**属性数：** 顶层必填 / 可选 / 只读为 {stats["top_required"]} / {stats["top_optional"]} / {stats["top_readonly"]}；'
        f'递归展开后可配置 {stats["all_configurable"]}，只读 {stats["all_readonly"]}（包含容器属性本身）。',
        "", "**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。"
        "默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。",
        "", "## 可配置属性", "",
        attribute_table([a for a in attributes if a["configurable"]], "../../../"),
        "## 只读属性", "",
        "这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。", "",
        attribute_table([a for a in attributes if not a["configurable"]], "../../../"),
        "## 校验器与计划修饰器", "",
        "以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。"
        "RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。", "",
        table(["属性", "Validators（源码）", "PlanModifiers（源码）"], [
            [code(a["path"]), "<br>".join(code(v) for v in a["validators"]) or "—",
             "<br>".join(code(v) for v in a["plan_modifiers"]) or "—"]
            for a in attributes if a["validators"] or a["plan_modifiers"]
        ]),
        "## 原文档与示例核对", "",
        f'**Schema 清单：** {"属性路径、类型及 R/O/C 类别与源码一致" if schema_matches(audit) else "存在差异，见下列记录"}。',
        "", f'**docs 示例：** {STATUS[audit["example_status"]]}；同类型的 {audit["example_target_blocks"]} 个有效 HCL 目标块'
        f'合并后，显式展示 {len(audit["example_present"])} / {stats["all_configurable"]} 个可配置属性路径。'
        "注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。",
    ]
    labels = {
        "example_missing": "未显式展示的可配置属性",
        "example_unknown": "示例中的不支持参数/块",
        "example_readonly": "示例错误赋值的只读属性",
        "example_unexpanded": "嵌套值来自表达式，不能静态展开",
        "schema_missing": "文档 Schema 缺少",
        "schema_extra": "文档 Schema 多出",
    }
    for key, label in labels.items():
        if audit[key]:
            lines.extend(["", f"**{label}：** " + "、".join(code(p) for p in audit[key]) + "。"])
    for key, label in (("schema_mode_mismatches", "模式差异"), ("schema_type_mismatches", "类型差异")):
        if audit[key]:
            lines.extend(["", f"**{label}：**", "", table(
                ["属性", "源码", "文档"], [[code(v["path"]), cell(v["source"]), cell(v["document"])] for v in audit[key]]
            )])
    if audit["example_errors"]:
        lines.extend(["", "**解析错误：**", "", "```text", "\n".join(audit["example_errors"]), "```"])
    if resource["example_file"]:
        other = resource["source_example_audit"]
        lines.extend(["", f'**examples 源文件：** [{resource["example_file"]}](../../../{resource["example_file"]})；'
                      f'{STATUS[other["example_status"]]}，显式展示 {len(other["example_present"])} / {stats["all_configurable"]}。'])
        if other["example_unknown"]:
            lines.append("不支持参数/块：" + "、".join(code(p) for p in other["example_unknown"]) + "。")
    lines.extend([
        "", "## 全属性 TF 模板", "",
        "完整输入结构位于 `variable.config.type`，resource 逐项引用顶层字段；"
        "嵌套对象中的可配置子字段全部展开。省略不需要的 `optional(...)` 成员，不能把互斥字段全部赋值。"
        "只读字段在尾部注释列出。使用方法与限制见[总览](../README.md#模板使用方式)。",
        "", "<details>", "<summary>展开完整 Terraform 模板</summary>", "",
        "```terraform", template.rstrip(), "```", "", "</details>", "",
    ])
    return "\n".join(lines)


def summary_rows(resources):
    rows = []
    for resource in resources:
        stats = counts(resource)
        name, audit = resource["type"], resource["audit"]
        rows.append([
            f'[`{name}`](details/{name}.md)', cell(resource["description"]),
            f'{stats["top_required"]} / {stats["top_optional"]} / {stats["top_readonly"]}',
            f'{stats["all_configurable"]} / {stats["all_readonly"]}',
            f'{len(audit["example_present"])}/{stats["all_configurable"]} · {STATUS[audit["example_status"]]}',
            f'[.tf](templates/{name}.tf)',
        ])
    return rows


def render_index(inventory):
    resources = inventory["resources"]
    groups = {}
    for resource in resources:
        groups.setdefault(resource["service"], []).append(resource)
    configurable = sum(counts(r)["all_configurable"] for r in resources)
    readonly = sum(counts(r)["all_readonly"] for r in resources)
    complete = sum(r["audit"]["example_status"] == "complete" for r in resources)
    consistent = sum(schema_matches(r["audit"]) for r in resources)
    lines = [
        "# 天翼云 Terraform 资源全属性目录", "",
        f'**范围：{len(resources)} 种已注册 resource，{len(groups)} 个源码产品分类，'
        f'{len(inventory["data_sources"])} 种 data source（另列索引）。** '
        f'递归展开共有 {configurable + readonly} 个属性路径，其中可配置 {configurable}、只读 {readonly}。', "",
        f'**核对结论：** {consistent}/{len(resources)} 份原文档的 Schema 清单在属性路径、类型、必填/可选/只读分类上与源码一致；'
        f'但只有 {complete}/{len(resources)} 份 docs 示例显式覆盖全部可配置属性。'
        "文档 Schema 清单与 Example 是两件事，不能用示例替代完整属性说明。"
        "具体缺项和不支持参数见[审计报告](AUDIT.md)及每个资源的详情页。", "",
        "## 阅读入口", "",
        table(["内容", "入口"], [
            ["按云产品分类的资源汇总", "[下方分类汇总](#产品分类汇总)"],
            ["每个 resource 的全属性表、约束、源码行与 TF 模板", "点击汇总表中的资源名或 `.tf`"],
            ["现有 docs / examples 覆盖核对", "[AUDIT.md](AUDIT.md)"],
            ["Provider 全局属性和凭据配置", "[PROVIDER.md](PROVIDER.md)"],
            ["查询型 data source 索引（不混入 resource）", "[DATA_SOURCES.md](DATA_SOURCES.md)"],
            ["Excel / 数据处理用资源汇总", "[resources.csv](resources.csv)"],
            ["逐属性清单（含嵌套、默认值、校验器、源码定位）", "[attributes.csv](attributes.csv)"],
            ["Azure 对照起始表（未预设等价关系）", "[azure-mapping-template.csv](azure-mapping-template.csv)"],
            ["完整机器可读源码快照", "[catalog.json](catalog.json)"],
        ]),
        "## 范围与依据", "",
        f'- Provider 源码自报版本：`{inventory["provider_version"]}`；相关源码最近提交：`{inventory["source_commit"]}`；'
        f'相关源码工作区{"有未提交变化" if inventory["source_dirty"] else "无未提交变化"}。',
        f'- 源码指纹（SHA-256）：`{inventory["source_sha256"]}`。',
        "- 以 `CtyunProvider.Resources()` 的实际注册、构造函数返回类型、`Metadata` 名称和 `Schema` 为依据，"
        "通过 Go AST 解析排除注释代码，不按文件名或 SDK API 数量推算。资源包装器的 `Schema` 仅转发目标 Schema。",
        "- 属性数包含父容器和嵌套子属性；`labels[].key` 中 `[]` 表示 list/set 元素，`{}` 表示 map 任意键。"
        "任意 map 的用户自定义键不是额外 Schema 属性。R=Required，O=Optional，C=Computed，O+C 是可配置输入。",
        "- 本目录是本地源码静态契约核对，不是云 API 探测、运行时 provider schema 导出或 CRUD 兼容性认证。"
        "默认值/校验器保留源码表达式；Schema 之外的业务条件、远端限制、区域可用性需进一步确认。"
        "源码版本号不保证与 Registry 同名版本内容完全一致。",
        "- Terraform `resource` 也可能代表绑定、配置、恢复或重启等动作，并非每一项都是独立的云实例。"
        "Terraform 自带的 `count`、`for_each`、`depends_on`、`lifecycle` 等 meta-arguments 不属于 provider 属性，不计入。",
        "",
        "## 模板使用方式", "",
        "每个 `.tf` 是一个独立模块模板，包含 provider 声明、完整的 `variable \"config\"` 对象类型、resource 赋值"
        "及只读属性引用注释。**它不是已填入合法值的可直接部署样例。**", "",
        "将选定的一个模板复制到独立目录并命名为 `main.tf`；依据详情页的约束，"
        "在该目录的 `terraform.tfvars` 中为 `config = { ... }` 填入真实必填值及所需可选值。"
        "嵌套对象类型内没有 `optional(...)` 的成员，在提供父对象或元素时必须填写。"
        "不需要的可选成员直接省略，provider 会按其自身规则处理 `null`。", "",
        "**不要**把全部模板放进同一 Terraform 根模块运行：模板复用了 `config` 和 `example`，并包含重复的 provider 声明。"
        "组合多个资源时应合并 provider 声明、重命名变量/资源标签并显式建立依赖引用。", "",
        "凭据优先通过 `CTYUN_AK` / `CTYUN_SK` 等环境变量注入；不要把秘密写入 TF 文件或映射表。"
        "含敏感输入的模板把整个 `config` 标记为 sensitive；这不会加密 Terraform state。"
        "模板不写死 Registry 版本，实际使用时必须选定与目标源码契约一致的 provider 版本并保留依赖锁文件。", "",
        "以 ECS 为例，`flavor_id` 与 `flavor_name` 需二选一，`password` 与 `key_pair_name` 互斥，"
        "`cycle_count` 是否必填取决于 `cycle_type`；“覆盖全部属性”并不意味着同时给所有字段赋非空值。"
        "普通输入和只读输出分开，避免不可配置字段导致错误。",
        "",
        "## 后续与 Azure 对照", "",
        "先固定 Azure 的接口层与版本（例如 `azurerm` 或 `azapi`），再复制 `azure-mapping-template.csv` 到一个手工维护的文件。"
        "**不要直接编辑生成文件**，重新生成会覆盖它们。以 `(ctyun_resource_type, ctyun_attribute_path)` 作为稳定关联键，"
        "从 `attributes.csv` 补充源侧类型、R/O/C、默认值、敏感性、枚举/约束和更新行为。", "",
        "映射表预留 Azure provider、版本、资源类型、属性路径、变换说明和备注。"
        "`mapping_status` 初始为 `unassessed`，可改为 `direct`、`transform`、`split`、`unsupported`；"
        "这些标签需要人工证据，不应仅凭名称相似推断等价。默认值/空值、计费、单位、地域/AZ、标识符、嵌套集合及重建语义都要对照。", "",
        "## 产品分类汇总", "",
    ]
    group_rows = []
    for service, members in sorted(groups.items()):
        anchor = "service-" + hashlib.sha256(service.encode()).hexdigest()[:10]
        group_rows.append([
            f'[{cell(service)}](#{anchor})', len(members),
            sum(counts(r)["all_configurable"] for r in members),
            sum(counts(r)["all_readonly"] for r in members),
        ])
    lines.append(table(["产品分类（源码原称）", "resource 数", "可配置属性路径", "只读属性路径"], group_rows))
    for service, members in sorted(groups.items()):
        anchor = "service-" + hashlib.sha256(service.encode()).hexdigest()[:10]
        lines.extend([
            f'<a id="{anchor}"></a>', f"### {service}", "",
            table(["Resource / 详情", "用途", "顶层 必 / 选 / 只读", "全层级 输入 / 只读", "原 docs 示例覆盖", "模板"], summary_rows(members)),
        ])
    lines.extend([
        "## 更新目录", "",
        "生成器位于 [`scripts/resource_catalog`](../../scripts/resource_catalog/README.md)。"
        "它会重新核对注册、递归属性、示例以及全部模板的输入路径/类型/可选标记，并格式化 TF。"
        "不支持的动态 Schema 结构会显式报错，不会静默漏掉属性。",
        "",
    ])
    return "\n".join(lines)


def render_audit(inventory):
    resources = inventory["resources"]
    status_counts = {status: sum(r["audit"]["example_status"] == status for r in resources) for status in STATUS}
    lines = [
        "# 现有资源文档与示例审计", "", "[返回资源汇总](README.md)", "",
        "对照依据为当前源码中已注册 resource 的 Schema，包括嵌套属性；不把 data source、SDK 字段或注释掉的定义算作支持。"
        "Schema 表核对路径、类型与 Required/Optional/Read-Only 类别；不会把描述文本相同当作属性契约一致的依据。", "",
        table(["指标", "数量"], [
            ["已注册 resource", len(resources)],
            ["原文档 Schema 三项核对一致", sum(schema_matches(r["audit"]) for r in resources)],
            *[[STATUS[status], count] for status, count in status_counts.items()],
        ]),
        "## 需要注意的示例", "",
        table(["资源详情", "问题", "不支持参数/块"], [
            [f'[{r["type"]}](details/{r["type"]}.md)', STATUS[r["audit"]["example_status"]],
             "、".join(code(p) for p in r["audit"]["example_unknown"]) or "—"]
            for r in resources if r["audit"]["example_status"] in {"invalid", "no_target", "error"}
        ]),
        "以上仅记录原有示例的问题，不改写原文档/示例；新模板依据源码生成。"
        "参数已在 SDK 或结构体中出现、但未在 resource Schema 暴露，仍不能写入 Terraform 配置。", "",
        "## 统计口径", "",
        "只统计 `docs/resources` 中 Example 区域实际生效的 `terraform` / `hcl` 代码块；"
        "同类型多个 resource 示例合并计算展示覆盖，配套创建的其他类型资源不计入当前资源。"
        "被注释的备选场景不计入。`examples/resources/<type>/resource.tf` 另行核对，结果保存在详情页与 JSON 中。", "",
        "缺少可选字段通常不是示例错误，只说明它不是全属性模板；Required/Optional+Computed 字段仍属于输入。"
        "嵌套字段若通过变量/表达式传入，会标为“未静态展开”，不能据此认定实际模块缺字段。"
        "“展示完整”只说明字段名覆盖，不证明必填值、依赖关系、敏感处理或云端部署正确。", "",
        "## 全量审计表", "",
        table(["资源详情", "文档 Schema", "docs 输入覆盖", "docs 结果", "examples 输入覆盖"], [
            [f'[{r["type"]}](details/{r["type"]}.md)', "一致" if schema_matches(r["audit"]) else "有差异",
             f'{len(r["audit"]["example_present"])}/{counts(r)["all_configurable"]}', STATUS[r["audit"]["example_status"]],
             f'{len(r["source_example_audit"]["example_present"])}/{counts(r)["all_configurable"]}'
             if "source_example_audit" in r else "无源示例"]
            for r in resources
        ]),
        "## 注册边界", "",
        "源码存在但未注册的有效 resource 定义："
        + ("、".join(code(r["type"]) for r in inventory["unregistered"]) or "无") + "。", "",
        "docs 中存在但未注册的 resource 文档："
        + ("、".join(code(n) for n in inventory["unregistered_documents"]) or "无") + "。",
        "注册列表中的注释行（例如 CCSE 模板实例、SD-WAN ACL）不计入支持清单。", "",
        "## 核对限制", "",
        "使用 Go AST 静态提取和 HCL 解析；未执行 provider、云端认证或任何 plan/apply/destroy。"
        "本地缺少 Go 工具链，未能进行编译后的 `terraform providers schema -json` 交叉验证。"
        "属性范围已经与全部显式注册的静态 Schema 逐项对应，但业务方法或远端 API 的行为不能由此推出。", "",
    ]
    return "\n".join(lines)


def csv_text(headers, rows):
    output = io.StringIO(newline="")
    writer = csv.writer(output, lineterminator="\n")
    writer.writerow(headers)
    writer.writerows(rows)
    return "\ufeff" + output.getvalue()


def render_provider(inventory):
    provider = inventory["provider"]
    attributes = catalog.flatten(provider["attributes"])
    lines = [
        "# Provider 全局配置", "", "[返回资源汇总](README.md)", "",
        "此处为 provider Schema 的全量配置属性，不计入云资源类型数量。"
        "resource/data source 的区域、AZ、项目等字段通常优先于 provider 配置；provider 显式值优先于环境变量。"
        "每个资源的实际继承规则以其默认值/修饰器及业务代码为准。", "",
        attribute_table(attributes, "../../"),
        "## 环境变量", "",
        table(["Provider 属性", "环境变量"], [
            [code(a["name"]), code("CTYUN_" + a["name"].upper())] for a in provider["attributes"]
        ]),
        "`console_url` 和 `inspect_url_keywords` 属于非生产测试配置；默认不要设置。"
        "Schema 的默认值表与 Configure 中的运行时默认逻辑分开，未声明默认不等于没有默认。", "",
        "## 完整配置结构", "",
        "保留默认空对象即可由环境变量提供凭据；不要把实际 AK/SK 提交到仓库。", "",
        "```terraform", 'variable "ctyun_provider" {',
        "  sensitive = true", "  default   = {}", "  type = object({",
        *("    " + a["name"] + " = " + catalog.input_type(a, 4) for a in provider["attributes"]),
        "  })", "}", "", 'provider "ctyun" {',
        *("  " + a["name"] + " = var.ctyun_provider." + a["name"] for a in provider["attributes"]),
        "}", "```", "",
        "全局校验器：", "",
        table(["属性", "Validators（源码）"], [
            [code(a["path"]), "<br>".join(code(v) for v in a["validators"])]
            for a in attributes if a["validators"]
        ]), "",
    ]
    return "\n".join(lines)


def render_files(inventory, templates):
    resources = inventory["resources"]
    files = {
        "README.md": render_index(inventory),
        "AUDIT.md": render_audit(inventory),
        "PROVIDER.md": render_provider(inventory),
        "DATA_SOURCES.md": "# Data source 索引\n\n[返回资源汇总](README.md)\n\n"
        "data source 用于查询，不是受 Terraform 管理生命周期的 resource；此处仅列索引，不提供创建模板。\n\n"
        + table(["Data source", "分类", "用途", "源码"], [
            [(f'[`{r["type"]}`](../../{r["document_file"]})' if r["document_exists"] else code(r["type"])),
             cell(r["service"]), cell(r["description"]),
             f'[Schema](../../{r["source_file"]}#L{r["source_line"]})']
            for r in inventory["data_sources"]
        ]),
        "catalog.json": json.dumps(inventory, ensure_ascii=False, indent=2) + "\n",
    }
    resource_headers = [
        "resource_type", "service", "description", "top_required", "top_optional", "top_readonly",
        "all_configurable", "all_readonly", "all_attributes", "example_covered", "example_status",
        "schema_matches", "detail", "template", "source_file", "source_line",
    ]
    resource_rows, attribute_rows, mapping_rows = [], [], []
    for resource in resources:
        name, stats = resource["type"], counts(resource)
        resource_rows.append([
            name, resource["service"], resource["description"],
            *[stats[k] for k in ("top_required", "top_optional", "top_readonly", "all_configurable", "all_readonly", "all_attributes")],
            len(resource["audit"]["example_present"]), resource["audit"]["example_status"],
            str(schema_matches(resource["audit"])).lower(), f"details/{name}.md", f"templates/{name}.tf",
            resource["source_file"], resource["source_line"],
        ])
        for attribute in catalog.flatten(resource["attributes"]):
            attribute_rows.append([
                name, resource["service"], attribute["path"], attribute["type"], attribute["schema_type"],
                *[str(attribute[k]).lower() for k in ("required", "optional", "computed", "configurable", "sensitive", "effective_sensitive")],
                attribute["default_expression"], attribute["description"], attribute["deprecated"],
                "\n".join(attribute["validators"]), "\n".join(attribute["plan_modifiers"]),
                str(attribute["path"] in resource["audit"]["example_present"]).lower(),
                attribute["source_file"], attribute["source_line"],
            ])
            mapping_rows.append([
                name, attribute["path"], attribute["type"], mode(attribute),
                "", "", "", "", "", "unassessed", "", "",
            ])
        files[f"templates/{name}.tf"] = templates[name]
        files[f"details/{name}.md"] = render_detail(resource, templates[name])
    files["resources.csv"] = csv_text(resource_headers, resource_rows)
    files["attributes.csv"] = csv_text([
        "resource_type", "service", "attribute_path", "terraform_type", "schema_type",
        "required", "optional", "computed", "configurable", "sensitive", "effective_sensitive",
        "default_expression", "description", "deprecated", "validators", "plan_modifiers",
        "explicit_in_docs_example", "source_file", "source_line",
    ], attribute_rows)
    files["azure-mapping-template.csv"] = csv_text([
        "ctyun_resource_type", "ctyun_attribute_path", "ctyun_type", "ctyun_mode",
        "azure_provider", "azure_provider_version", "azure_resource_type", "azure_attribute_path",
        "azure_type", "mapping_status", "transformation", "notes",
    ], mapping_rows)
    return files


def run_command(arguments, cwd, env=None):
    result = subprocess.run(arguments, cwd=cwd, env=env, check=True, capture_output=True, text=True, encoding="utf-8")
    if result.stderr:
        print(result.stderr, file=sys.stderr, end="")
    return result.stdout.strip()


def validate_template(resource, template):
    expected = {
        a["path"]: (a["type"], not a["required"])
        for a in catalog.flatten(resource["attributes"]) if a["configurable"]
    }
    actual = catalog.template_input_fields(template)
    if expected != actual:
        raise catalog.CatalogError(f'{resource["type"]}: template input paths/types/optional flags differ from Schema')
    config = hcl2.loads(template)
    assignments = config["resource"][0][resource["type"]]["example"]
    expected_assignments = {
        a["name"]: "${var.config." + a["name"] + "}"
        for a in resource["attributes"] if a["configurable"]
    }
    if assignments != expected_assignments:
        raise catalog.CatalogError(f'{resource["type"]}: resource assignments differ from configurable Schema')


def verify_links(root, output, files):
    for name, content in files.items():
        if not name.endswith(".md"):
            continue
        for link in re.findall(r"\[[^\]]+\]\(([^)]+)\)", content):
            if link.startswith(("https://", "http://", "#")):
                continue
            relative = link.split("#", 1)[0]
            target = output.joinpath(*name.split("/")).parent.joinpath(*relative.split("/")).resolve()
            try:
                generated = target.relative_to(output).as_posix()
            except ValueError:
                generated = None
            if generated not in files and not target.is_file():
                raise catalog.CatalogError(f"Broken link in {name}: {link}")
            if not target.is_relative_to(root):
                raise catalog.CatalogError(f"Link leaves repository in {name}: {link}")


def changed_files(output, files):
    return [
        name for name, content in files.items()
        if not output.joinpath(*name.split("/")).is_file()
        or output.joinpath(*name.split("/")).read_bytes() != content.encode("utf-8")
    ]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, required=True, help="Repository root")
    parser.add_argument("--check", action="store_true", help="Fail if committed catalog differs; do not write files")
    args = parser.parse_args()
    root = args.root.resolve()
    inventory = catalog.build_inventory(root)
    source_paths = ["main.go", "go.mod", "internal\\service", "internal\\business",
                    "internal\\extend", "internal\\utils", "internal\\common"]
    inventory["source_commit"] = run_command(
        ["git", "--no-pager", "log", "-1", "--format=%H", "--", *source_paths], root
    )
    inventory["source_dirty"] = bool(run_command(["git", "status", "--porcelain", "--", *source_paths], root))
    terraform = shutil.which("terraform")
    if terraform is None:
        raise catalog.CatalogError("terraform is required for HCL formatting; install Terraform >= 1.5.7")
    templates = {}
    with TemporaryDirectory(prefix="ctyun-resource-catalog-") as directory:
        staging = Path(directory)
        cli_config = staging / "format-only.tfrc"
        cli_config.write_text("", encoding="utf-8")
        environment = os.environ.copy()
        environment["TF_CLI_CONFIG_FILE"] = str(cli_config)
        environment["CHECKPOINT_DISABLE"] = "1"
        environment.pop("TF_CLI_ARGS", None)
        environment.pop("TF_CLI_ARGS_fmt", None)
        for resource in inventory["resources"]:
            path = staging / (resource["type"] + ".tf")
            path.write_text(catalog.render_template(resource), encoding="utf-8", newline="\n")
        run_command([terraform, "fmt", "-no-color", "-recursive", str(staging)], root, environment)
        for resource in inventory["resources"]:
            template = (staging / (resource["type"] + ".tf")).read_text(encoding="utf-8")
            validate_template(resource, template)
            templates[resource["type"]] = template
    files = render_files(inventory, templates)
    output = root / "docs" / "resource-catalog"
    verify_links(root, output, files)
    existing = {p.relative_to(output).as_posix() for p in output.rglob("*") if p.is_file()} if output.is_dir() else set()
    extra = existing - files.keys()
    if extra:
        raise catalog.CatalogError(f"Unexpected/stale catalog files; review them manually before regenerating: {sorted(extra)}")
    changed = changed_files(output, files)
    if args.check:
        if changed:
            raise catalog.CatalogError(f"Catalog is out of date ({len(changed)} files): {changed[:10]}")
        print(f"Catalog matches source: {len(inventory['resources'])} resources, {len(files)} files.")
        return
    for name in changed:
        path = output.joinpath(*name.split("/"))
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(files[name], encoding="utf-8", newline="\n")
    print(f"Generated {len(inventory['resources'])} resource details/templates; "
          f"{sum(counts(r)['all_attributes'] for r in inventory['resources'])} attribute paths; "
          f"{len(changed)} files written to {output}")


if __name__ == "__main__":
    try:
        main()
    except catalog.CatalogError as error:
        print(f"Catalog error: {error}", file=sys.stderr)
        sys.exit(1)
    except subprocess.CalledProcessError as error:
        print(error.stdout or "", file=sys.stderr)
        print(error.stderr or "", file=sys.stderr)
        sys.exit(error.returncode)
