# ctyun_private_zone

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_private_zone.tf) · [源码](../../../internal/service/dns/resource_ctyun_private_zone.go#L103) · [原文档](../../../docs/resources/private_zone.md)

**产品分类：** 内网DNS（Intranet Domain Name Service，CT-IDNS）。**用途：** 管理内网DNS。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 6 / 3；递归展开后可配置 10，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L150) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 内网DNS描述，支持更新 |
| [<code>name</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L139) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 内网DNS名称。要求：由多个以点分隔的字符串组成，可包含字母、数字中划线、中划线不能在开头或末尾，单个字符串不超过63个字符，域名总长度不超过254个字符 |
| [<code>project_id</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L119) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>proxy_pattern</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L161) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("zone")</code> | 可选值：zone：当前可用区不进行递归解析，record：不完全劫持，进行递归解析代理，大小写不敏感。默认值zone，支持更新。 |
| [<code>region_id</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L107) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>tags</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L197) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O+C | 否 | — | 标签 |
| [<code>tags&#91;&#93;.key</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L207) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签key，支持更新。 |
| [<code>tags&#91;&#93;.value</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L214) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签value，支持更新。 |
| [<code>ttl</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L170) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(300)</code> | zone ttl, 单位秒。默认300，取值范围300-2147483647。支持更新 |
| [<code>vpc_id_list</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L131) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 关联的vpc，最多同时支持5个VPC。支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L186) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L179) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | zone id |
| [<code>tags&#91;&#93;.tag_id</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L203) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 标签id |
| [<code>update_time</code>](../../../internal/service/dns/resource_ctyun_private_zone.go#L193) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>validator2.Desc()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(1, 254)</code><br><code>validator2.DnsName()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>proxy_pattern</code> | <code>stringvalidator.OneOf("zone", "record")</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>tags</code> | <code>setvalidator.SizeAtMost(10)</code> | <code>setplanmodifier.UseStateForUnknown()</code> |
| <code>tags&#91;&#93;.key</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>tags&#91;&#93;.value</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>ttl</code> | <code>int32validator.Between(300, 2147483647)</code> | — |
| <code>vpc_id_list</code> | <code>setvalidator.SizeBetween(1, 5)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 5 / 10 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>project_id</code>、<code>region_id</code>、<code>tags</code>、<code>tags&#91;&#93;.key</code>、<code>tags&#91;&#93;.value</code>。

**examples 源文件：** [examples/resources/ctyun_private_zone/resource.tf](../../../examples/resources/ctyun_private_zone/resource.tf)；未完整展示，显式展示 5 / 10。

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
  description = "Complete configurable shape for ctyun_private_zone; consult constraints before use."
  nullable    = false
  type = object({
    description   = optional(string)
    name          = string
    project_id    = optional(string)
    proxy_pattern = optional(string)
    region_id     = optional(string)
    tags = optional(set(object({
      key   = string
      value = string
    })))
    ttl         = optional(number)
    vpc_id_list = set(string)
  })
}

resource "ctyun_private_zone" "example" {
  description   = var.config.description
  name          = var.config.name
  project_id    = var.config.project_id
  proxy_pattern = var.config.proxy_pattern
  region_id     = var.config.region_id
  tags          = var.config.tags
  ttl           = var.config.ttl
  vpc_id_list   = var.config.vpc_id_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_zone.example.create_time : string
# ctyun_private_zone.example.id : string
# ctyun_private_zone.example.tags[*].tag_id : string
# ctyun_private_zone.example.update_time : string
```

</details>
