# ctyun_ec_packet

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ec_packet.tf) · [源码](../../../internal/service/ec/resource_ctyun_ec_packet.go#L67) · [原文档](../../../docs/resources/ec_packet.md)

**产品分类：** 云间高速（标准版）（CT-EC, Express Connect Standard）。**用途：** 管理云间高速带宽包。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 4 / 7；递归展开后可配置 9，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>area_a</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L125) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("china")</code> | 区域A类型，取值如下：china: 中国大陆, APAC:亚太，默认china |
| [<code>area_b</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L137) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("china")</code> | 区域B类型，取值如下：china: 中国大陆, APAC:亚太，默认china |
| [<code>bandwidth</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L98) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 带宽，单位MB 支持更新 |
| [<code>cycle_count</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L115) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 订购时长，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-3年 |
| [<code>cycle_type</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L105) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年 |
| [<code>ec_id</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L78) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云间高速ID |
| [<code>name</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L88) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 带宽包名字 |
| [<code>pay_voucher_price</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L149) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 代金券金额，只适用于预付费客户自动支付，若代金券支付金额传0或者控制符，则不适用代金券支付（小数会只保留2位，非负） |
| [<code>resource_id</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L187) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 云间高速带宽包资源ID，用于升配、续订、退订等操作 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L205) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L198) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L71) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源ID |
| [<code>master_order_id</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L159) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单ID。调用方在拿到masterOrderID之后，在若干错误情况下，可以使用materOrderID进一步确认订单状态及资源状态 |
| [<code>master_order_no</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L166) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单号 |
| [<code>master_resource_id</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L173) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主资源ID |
| [<code>master_resource_status</code>](../../../internal/service/ec/resource_ctyun_ec_packet.go#L180) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主资源状态，只有主订单资源会返回 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>area_a</code> | <code>stringvalidator.OneOf("china", "APAC")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>area_b</code> | <code>stringvalidator.OneOf("china", "APAC")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>bandwidth</code> | <code>int64validator.AtLeast(1)</code> | — |
| <code>cycle_count</code> | <code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>int64planmodifier.RequiresReplace()</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypesMY...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>ec_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_no</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_resource_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_resource_status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(1, 64)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>pay_voucher_price</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>resource_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>pay_voucher_price</code>、<code>resource_id</code>。

**examples 源文件：** [examples/resources/ctyun_ec_packet/resource.tf](../../../examples/resources/ctyun_ec_packet/resource.tf)；未完整展示，显式展示 7 / 9。

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
  description = "Complete configurable shape for ctyun_ec_packet; consult constraints before use."
  nullable    = false
  type = object({
    area_a            = optional(string)
    area_b            = optional(string)
    bandwidth         = number
    cycle_count       = number
    cycle_type        = string
    ec_id             = string
    name              = string
    pay_voucher_price = optional(string)
    resource_id       = optional(string)
  })
}

resource "ctyun_ec_packet" "example" {
  area_a            = var.config.area_a
  area_b            = var.config.area_b
  bandwidth         = var.config.bandwidth
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  ec_id             = var.config.ec_id
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  resource_id       = var.config.resource_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_packet.example.create_time : string
# ctyun_ec_packet.example.expire_time : string
# ctyun_ec_packet.example.id : string
# ctyun_ec_packet.example.master_order_id : string
# ctyun_ec_packet.example.master_order_no : string
# ctyun_ec_packet.example.master_resource_id : string
# ctyun_ec_packet.example.master_resource_status : string
```

</details>
