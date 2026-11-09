# ctyun_ipv6_bandwidth

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ipv6_bandwidth.tf) · [源码](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L69) · [原文档](../../../docs/resources/ipv6_bandwidth.md)

**产品分类：** 弹性IP（Elastic IP，EIP）。**用途：** 管理IPv6带宽。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 8；递归展开后可配置 6，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>bandwidth</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L99) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 带宽大小，取值范围1～300Mbps |
| [<code>cycle_count</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L116) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-3年，支持更新 |
| [<code>cycle_type</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L106) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年，on_demand：按需 |
| [<code>name</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L92) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | IPV6带宽实例名称 |
| [<code>pay_voucher_price</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L134) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 代金券金额，只适用于预付费客户自动支付，若代金券支付金额传0或者控制符，则不适用代金券支付（小数会只保留2位，非负） |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L80) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L158) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间 |
| [<code>expire_time</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L163) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 过期时间 |
| [<code>expired</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L178) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否过期 |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L73) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | IPv6带宽ID |
| [<code>ip_address</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L168) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | IP地址 |
| [<code>ipv6_gateway_id</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L173) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | IPv6网关 |
| [<code>resource_spec</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L151) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 独享/共享模式 |
| [<code>status</code>](../../../internal/service/vpc/resource_ctyun_ipv6_bandwidth.go#L144) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | IPv6带宽状态，ACTIVE（正常） / EXPIRED（过期） / FREEZING（冻结） /CREATEING（创建中） |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>bandwidth</code> | <code>int64validator.Between(1, 300)</code> | — |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>expired</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ip_address</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ipv6_gateway_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>pay_voucher_price</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>resource_spec</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>pay_voucher_price</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ipv6_bandwidth/resource.tf](../../../examples/resources/ctyun_ipv6_bandwidth/resource.tf)；未完整展示，显式展示 4 / 6。

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
  description = "Complete configurable shape for ctyun_ipv6_bandwidth; consult constraints before use."
  nullable    = false
  type = object({
    bandwidth         = number
    cycle_count       = optional(number)
    cycle_type        = string
    name              = string
    pay_voucher_price = optional(string)
    region_id         = optional(string)
  })
}

resource "ctyun_ipv6_bandwidth" "example" {
  bandwidth         = var.config.bandwidth
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  region_id         = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ipv6_bandwidth.example.create_time : string
# ctyun_ipv6_bandwidth.example.expire_time : string
# ctyun_ipv6_bandwidth.example.expired : bool
# ctyun_ipv6_bandwidth.example.id : string
# ctyun_ipv6_bandwidth.example.ip_address : string
# ctyun_ipv6_bandwidth.example.ipv6_gateway_id : string
# ctyun_ipv6_bandwidth.example.resource_spec : string
# ctyun_ipv6_bandwidth.example.status : string
```

</details>
