# ctyun_postgresql_database

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_postgresql_database.tf) · [源码](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L97) · [原文档](../../../docs/resources/postgresql_database.md)

**产品分类：** 关系数据库PostgreSQL版。**用途：** 管理PostgreSQL实例的数据库。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 6 / 1；递归展开后可配置 9，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>charset_collate</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L157) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 字符串排序规则，charset_name为utf8不传，其他的字符集必须传入 |
| [<code>charset_name</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L147) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 字符集 |
| [<code>charset_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L171) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 字符分类，charset_name为utf8不传，其他的字符集必须传入 |
| [<code>description</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L139) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 数据库描述，支持更新。长度为2~256个字符。以中文、英文字母开头，可以包含数字、中文、英文、下划线（_）、短横线（-） |
| [<code>instance_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L101) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | pgsql实例id |
| [<code>name</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L128) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 数据库名称,mysql库名限制建议:长度为2~63个字符，以字母开头，以字母或数字结尾，由小写字母、数字、下划线或中划线组成，数据库名称在实例内必须是唯一的，禁用关键字 |
| [<code>owner</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L185) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 数据库所有者 |
| [<code>project_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L111) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L116) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_database.go#L196) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | postgresql实例数据库id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>charset_collate</code> | <code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("charset_name"),<br>						types.StringValue("utf8"),<br>					)</code> | <code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>charset_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>charset_type</code> | <code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("charset_name"),<br>						types.StringValue("utf8"),<br>					)</code> | <code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthBetween(2, 256)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.LengthBetween(32, 32)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 63)</code><br><code>validator2.PgsqlDatabaseName()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>owner</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 8 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_postgresql_database/resource.tf](../../../examples/resources/ctyun_postgresql_database/resource.tf)；未完整展示，显式展示 8 / 9。

## 全属性 TF 模板

完整输入结构位于 `variable.config.type`，resource 逐项引用顶层字段；嵌套对象中的可配置子字段全部展开。省略不需要的 `optional(...)` 成员，不能把互斥字段全部赋值。只读字段在尾部注释列出。使用方法与限制见[总览](../README.md#模板使用方式)。

<details>
<summary>展开完整 Terraform 模板</summary>

```terraform
# Generated from registered Go Schema; see the linked resource detail.
# Complete input shape, not a deployment scenario or a set of valid sample values.
# Required members need real values. Omit optional members you do not need.
# Do not set conflicting options together. Optional+Computed is configurable.
# This file is a standalone module; do not apply the whole templates directory.
terraform {
  required_version = ">= 1.5.7"
  required_providers {
    ctyun = {
      source = "ctyun-it/ctyun"
    }
  }
}

# Configure credentials/region using CTYUN_* environment variables.
provider "ctyun" {}

variable "config" {
  description = "Complete configurable shape for ctyun_postgresql_database; consult constraints before use."
  nullable    = false
  type = object({
    charset_collate = optional(string)
    charset_name    = string
    charset_type    = optional(string)
    description     = optional(string)
    instance_id     = string
    name            = string
    owner           = optional(string)
    project_id      = optional(string)
    region_id       = optional(string)
  })
}

resource "ctyun_postgresql_database" "example" {
  charset_collate = var.config.charset_collate
  charset_name    = var.config.charset_name
  charset_type    = var.config.charset_type
  description     = var.config.description
  instance_id     = var.config.instance_id
  name            = var.config.name
  owner           = var.config.owner
  project_id      = var.config.project_id
  region_id       = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_database.example.id : string
```

</details>
