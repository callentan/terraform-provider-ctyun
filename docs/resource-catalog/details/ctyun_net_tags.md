# ctyun_net_tags

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_net_tags.tf) · [源码](../../../internal/service/vpc/resource_ctyun_net_tags.go#L45) · [原文档](../../../docs/resources/net_tags.md)

**产品分类：** 虚拟私有云（Virtual Private Cloud，VPC）。**用途：** 管理网络资源的标签。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 2 / 1；递归展开后可配置 6，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L54) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>resource_id</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L76) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源 ID |
| [<code>resource_type</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L66) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源类型，resourceType only support vpc / subnet / acl / security_group / route_table / havip / port / multicast_domain / vpc_peer / vpce_endpoint / vpce_endpoint_service / ipv6_gateway / elb / private_nat / nat / eip / bandwidth /ipv6_bandwidth |
| [<code>tags</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L86) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O | 否 | — | 标签列表。最多10个标签，标签键不可重复，键值长度1~32字符，不能换行或以空格开头/结尾。 |
| [<code>tags&#91;&#93;.key</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L104) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签键。支持更新 |
| [<code>tags&#91;&#93;.value</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L111) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签值。支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L49) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>tags&#91;&#93;.id</code>](../../../internal/service/vpc/resource_ctyun_net_tags.go#L94) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 标签id。 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>resource_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>resource_type</code> | <code>stringvalidator.OneOf(business.NetResourceTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>tags</code> | <code>setvalidator.SizeAtMost(10)</code> | — |
| <code>tags&#91;&#93;.id</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>tags&#91;&#93;.key</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | — |
| <code>tags&#91;&#93;.value</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 5 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_net_tags/resource.tf](../../../examples/resources/ctyun_net_tags/resource.tf)；未完整展示，显式展示 5 / 6。

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
  description = "Complete configurable shape for ctyun_net_tags; consult constraints before use."
  nullable    = false
  type = object({
    region_id     = optional(string)
    resource_id   = string
    resource_type = string
    tags = optional(set(object({
      key   = string
      value = string
    })))
  })
}

resource "ctyun_net_tags" "example" {
  region_id     = var.config.region_id
  resource_id   = var.config.resource_id
  resource_type = var.config.resource_type
  tags          = var.config.tags
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_net_tags.example.id : string
# ctyun_net_tags.example.tags[*].id : string
```

</details>
