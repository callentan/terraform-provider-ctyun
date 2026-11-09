# ctyun_vpc_peer_connection

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_vpc_peer_connection.tf) · [源码](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L111) · [原文档](../../../docs/resources/vpc_peer_connection.md)

**产品分类：** 对等连接（VPC peering connection）。**用途：** 管理对等连接。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 5 / 8；递归展开后可配置 10，只读 9（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>accept_email</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L177) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 对端vpc账户的邮箱，当建立跨帐号的对等连接，需要对端同意。可调用ctyun_vpc_peer_connection_attch实现 |
| [<code>accept_vpc_id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L167) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 对端的vpc id |
| [<code>description</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L187) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 对等连接描述，支持更新 |
| [<code>name</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L150) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 对等连接名称，支持更新。要求：支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32。注：当status=pending时，在控制台上修改name会导致资源state丢失！ |
| [<code>project_id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L138) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L126) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>request_vpc_id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L157) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 本端vpc id |
| [<code>tags</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L230) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O | 否 | — | 标签，支持更新 |
| [<code>tags&#91;&#93;.key</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L235) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | key，支持更新 |
| [<code>tags&#91;&#93;.value</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L242) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | value，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>accept_vpc_cidr</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L212) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>accept_vpc_name</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L206) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L115) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对等连接id |
| [<code>instance_id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L122) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对等连接实例id，跨账号情况下使用。如果该字段为空，说明status=pending，需要调用ctyun_vpc_peer_connection_attch同意 |
| [<code>request_vpc_cidr</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L200) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>request_vpc_name</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L194) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>status</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L218) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对等连接状态，agree(已连接)/pending(等待审核) |
| [<code>tags&#91;&#93;.id</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L249) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 标签id |
| [<code>user_type</code>](../../../internal/service/peer-connection/resource_ctyun_vpc_peer_connection.go#L223) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对等连接类型：current(同一个租户) / other(不同租户) |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>accept_email</code> | <code>validator2.Email()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>accept_vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>validator2.Desc()</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>request_vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>tags&#91;&#93;.key</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>tags&#91;&#93;.value</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>user_type</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 2 个有效 HCL 目标块合并后，显式展示 6 / 10 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>、<code>tags</code>、<code>tags&#91;&#93;.key</code>、<code>tags&#91;&#93;.value</code>。

**examples 源文件：** [examples/resources/ctyun_vpc_peer_connection/resource.tf](../../../examples/resources/ctyun_vpc_peer_connection/resource.tf)；未完整展示，显式展示 6 / 10。

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
  description = "Complete configurable shape for ctyun_vpc_peer_connection; consult constraints before use."
  nullable    = false
  type = object({
    accept_email   = optional(string)
    accept_vpc_id  = string
    description    = optional(string)
    name           = string
    project_id     = optional(string)
    region_id      = optional(string)
    request_vpc_id = string
    tags = optional(set(object({
      key   = string
      value = string
    })))
  })
}

resource "ctyun_vpc_peer_connection" "example" {
  accept_email   = var.config.accept_email
  accept_vpc_id  = var.config.accept_vpc_id
  description    = var.config.description
  name           = var.config.name
  project_id     = var.config.project_id
  region_id      = var.config.region_id
  request_vpc_id = var.config.request_vpc_id
  tags           = var.config.tags
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_peer_connection.example.accept_vpc_cidr : string
# ctyun_vpc_peer_connection.example.accept_vpc_name : string
# ctyun_vpc_peer_connection.example.id : string
# ctyun_vpc_peer_connection.example.instance_id : string
# ctyun_vpc_peer_connection.example.request_vpc_cidr : string
# ctyun_vpc_peer_connection.example.request_vpc_name : string
# ctyun_vpc_peer_connection.example.status : string
# ctyun_vpc_peer_connection.example.tags[*].id : string
# ctyun_vpc_peer_connection.example.user_type : string
```

</details>
