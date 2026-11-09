# ctyun_vpce_service_reverse_rule

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_vpce_service_reverse_rule.tf) · [源码](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L60) · [原文档](../../../docs/resources/vpce_service_reverse_rule.md)

**产品分类：** VPC终端节点（VPC Endpoint）。**用途：** 管理终端节点服务反向规则。

**属性数：** 顶层必填 / 可选 / 只读为 7 / 1 / 3；递归展开后可配置 8，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>endpoint_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L93) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 终端节点ID |
| [<code>endpoint_service_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L83) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 终端节点服务ID |
| [<code>protocol</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L143) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议，TCP:TCP协议,UDP:UDP协议 |
| [<code>region_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L71) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>target_ip</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L123) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 目标IP地址 |
| [<code>target_port</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L133) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 目标端口(1-65535) |
| [<code>transit_ip</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L103) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 中转IP地址 |
| [<code>transit_port</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L113) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 中转端口(1-65535) |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L153) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L64) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 规则ID |
| [<code>update_time</code>](../../../internal/service/vpce/resource_ctyun_vpce_service_reverse_rule.go#L160) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>endpoint_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>endpoint_service_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf("TCP", "UDP")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>target_ip</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>target_port</code> | <code>int32validator.Between(1, 65535)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>transit_ip</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>transit_port</code> | <code>int32validator.Between(1, 65535)</code> | <code>int32planmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 8 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_vpce_service_reverse_rule/resource.tf](../../../examples/resources/ctyun_vpce_service_reverse_rule/resource.tf)；未完整展示，显式展示 7 / 8。

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
  description = "Complete configurable shape for ctyun_vpce_service_reverse_rule; consult constraints before use."
  nullable    = false
  type = object({
    endpoint_id         = string
    endpoint_service_id = string
    protocol            = string
    region_id           = optional(string)
    target_ip           = string
    target_port         = number
    transit_ip          = string
    transit_port        = number
  })
}

resource "ctyun_vpce_service_reverse_rule" "example" {
  endpoint_id         = var.config.endpoint_id
  endpoint_service_id = var.config.endpoint_service_id
  protocol            = var.config.protocol
  region_id           = var.config.region_id
  target_ip           = var.config.target_ip
  target_port         = var.config.target_port
  transit_ip          = var.config.transit_ip
  transit_port        = var.config.transit_port
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpce_service_reverse_rule.example.create_time : string
# ctyun_vpce_service_reverse_rule.example.id : string
# ctyun_vpce_service_reverse_rule.example.update_time : string
```

</details>
