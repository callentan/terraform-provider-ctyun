# ctyun_postgresql_account

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_postgresql_account.tf) · [源码](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L98) · [原文档](../../../docs/resources/postgresql_account.md)

**产品分类：** 关系数据库PostgreSQL版。**用途：** 管理PostgreSQL实例的账户。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 7 / 8；递归展开后可配置 11，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L147) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 备注，支持更新 |
| [<code>instance_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L114) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | MySQL实例ID |
| [<code>is_lock</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L164) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 判断账号是否需要锁定，取值范围：true-锁定账号，false-解锁账号。默认为false。支持更新 |
| [<code>name</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L129) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 数据库账号名称，,格式限制: 1.名称唯一；2. 以字母开头，以字母或数字结尾；3.由小写字母、数字或下划线组成；4. 长度：2~63个字符 |
| [<code>password</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L139) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 数据库账号密码，创建时必填 。支持更新，导入时不填。由大写字母、小写字母、特殊字符、数字中三种或者三种以上组成(特殊字符：@!#$%^&amp;*()_-=) |
| [<code>project_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L124) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L102) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>schema_privilege_list</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L168) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O | 否 | — | 账号需要授权的数据库列表 |
| [<code>schema_privilege_list&#91;&#93;.grant_schema</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L173) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 需要授权的数据库名称，支持更新 |
| [<code>schema_privilege_list&#91;&#93;.privilege</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L180) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 授权数据库的权限，取值范围：readwrite-读写，readonly-只读，支持更新 |
| [<code>user_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L154) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 账号类型，取值范围：normal-普通账号，advanced-高权限账号。默认为普通账号 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L190) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实例账户id |
| [<code>rol_by_pass_rls</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L218) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户是否绕过每个行级安全策略 |
| [<code>rol_can_login</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L210) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户是否可以登录数据库 |
| [<code>rol_conn_limit</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L214) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 用户连接实例的最大并发连接数。-1表示没有限制 |
| [<code>rol_create_db</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L206) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户是否可以创建数据库 |
| [<code>rol_create_role</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L202) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户是否支持创建其他子用户 |
| [<code>rol_inherit</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L198) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户是否自动继承其所属角色的权限 |
| [<code>rol_super</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_account.go#L194) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 用户是否具有超级用户权限 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>description</code> | <code>validator2.Desc()</code> | — |
| <code>instance_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 63)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>password</code> | <code>stringvalidator.LengthBetween(8, 32)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>schema_privilege_list&#91;&#93;.grant_schema</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>schema_privilege_list&#91;&#93;.privilege</code> | <code>stringvalidator.OneOf("readwrite", "readonly")</code> | — |
| <code>user_type</code> | <code>stringvalidator.OneOf(business.PgsqlAccountTypes...)</code> | <code>explanmodifier.NullIgnoreString()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 5 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>is_lock</code>、<code>project_id</code>、<code>region_id</code>、<code>schema_privilege_list</code>、<code>schema_privilege_list&#91;&#93;.grant_schema</code>、<code>schema_privilege_list&#91;&#93;.privilege</code>。

**examples 源文件：** [examples/resources/ctyun_postgresql_account/resource.tf](../../../examples/resources/ctyun_postgresql_account/resource.tf)；未完整展示，显式展示 5 / 11。

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
  description = "Complete configurable shape for ctyun_postgresql_account; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    description = optional(string)
    instance_id = string
    is_lock     = optional(bool)
    name        = string
    password    = optional(string)
    project_id  = optional(string)
    region_id   = optional(string)
    schema_privilege_list = optional(set(object({
      grant_schema = string
      privilege    = string
    })))
    user_type = optional(string)
  })
}

resource "ctyun_postgresql_account" "example" {
  description           = var.config.description
  instance_id           = var.config.instance_id
  is_lock               = var.config.is_lock
  name                  = var.config.name
  password              = var.config.password
  project_id            = var.config.project_id
  region_id             = var.config.region_id
  schema_privilege_list = var.config.schema_privilege_list
  user_type             = var.config.user_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_account.example.id : string
# ctyun_postgresql_account.example.rol_by_pass_rls : bool
# ctyun_postgresql_account.example.rol_can_login : bool
# ctyun_postgresql_account.example.rol_conn_limit : number
# ctyun_postgresql_account.example.rol_create_db : bool
# ctyun_postgresql_account.example.rol_create_role : bool
# ctyun_postgresql_account.example.rol_inherit : bool
# ctyun_postgresql_account.example.rol_super : bool
```

</details>
