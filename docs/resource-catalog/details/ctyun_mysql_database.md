# ctyun_mysql_database

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mysql_database.tf) · [源码](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L98) · [原文档](../../../docs/resources/mysql_database.md)

**产品分类：** 关系数据库MySQL版。**用途：** 管理MySQL实例的数据库。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 2；递归展开后可配置 6，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>charset_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L151) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 字符集 |
| [<code>description</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L140) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 备注，支持更新 |
| [<code>instance_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L102) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | mysql实例id |
| [<code>name</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L129) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 数据库名称，mysql库名限制建议:以小写字母开头，且以小写字母或数字结尾，可包含数字或下划线，不含其他特殊字符 |
| [<code>project_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L112) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L117) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L184) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 数据库id |
| [<code>user_grant_privilege</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L161) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | — |
| [<code>user_grant_privilege&#91;&#93;.account_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L165) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 数据库用户名 |
| [<code>user_grant_privilege&#91;&#93;.insert_priv</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L177) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 写入权限 |
| [<code>user_grant_privilege&#91;&#93;.read_only</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L169) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户读写权限 |
| [<code>user_grant_privilege&#91;&#93;.select_priv</code>](../../../internal/service/mysql/resource_ctyun_mysql_database.go#L173) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 查询权限 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>charset_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>validator2.Desc()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.LengthBetween(32, 32)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code><br><code>validator2.MysqlDatabaseName()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_mysql_database/resource.tf](../../../examples/resources/ctyun_mysql_database/resource.tf)；未完整展示，显式展示 3 / 6。

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
  description = "Complete configurable shape for ctyun_mysql_database; consult constraints before use."
  nullable    = false
  type = object({
    charset_name = string
    description  = optional(string)
    instance_id  = string
    name         = string
    project_id   = optional(string)
    region_id    = optional(string)
  })
}

resource "ctyun_mysql_database" "example" {
  charset_name = var.config.charset_name
  description  = var.config.description
  instance_id  = var.config.instance_id
  name         = var.config.name
  project_id   = var.config.project_id
  region_id    = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_database.example.id : string
# ctyun_mysql_database.example.user_grant_privilege : list(object)
# ctyun_mysql_database.example.user_grant_privilege[*].account_name : string
# ctyun_mysql_database.example.user_grant_privilege[*].insert_priv : bool
# ctyun_mysql_database.example.user_grant_privilege[*].read_only : bool
# ctyun_mysql_database.example.user_grant_privilege[*].select_priv : bool
```

</details>
