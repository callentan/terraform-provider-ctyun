# ctyun_eip

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_eip.tf) · [源码](../../../internal/service/vpc/resource_ctyun_eip.go#L71) · [原文档](../../../docs/resources/eip.md)

**产品分类：** 弹性IP（Elastic IP，EIP）。**用途：** 管理弹性IP。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 4 / 9；递归展开后可配置 7，只读 9（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>bandwidth</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L90) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 原始弹性ip的带宽峰值，1-1024Mbps，支持更新 |
| [<code>cycle_count</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L115) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-3年 |
| [<code>cycle_type</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L105) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，与cycle_count配合使用，month：按月，year：按年，on_demand：按需计费类型，当为按需时，demand_billing_type为必填。当此值为month或者year时，cycle_count为必填 |
| [<code>demand_billing_type</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L133) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 按需计费类型，当cycle_type为on_demand时生效，bandwidth：按带宽，upflowc：按流量 |
| [<code>name</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L82) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 弹性ip名称。长度2-32，字母、数字，下划线，连字符，中文/英文字母开头，不能以http:或https:开头，支持更新 |
| [<code>project_id</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L187) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L199) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>address</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L151) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ip地址 |
| [<code>bandwidth_type</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L101) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性ip的类型的带宽类型，standalone：独享，share：共享 |
| [<code>create_time</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L169) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>current_bandwidth</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L97) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 当前实际的带宽大小，如果绑定了共享带宽，此值显示为共享带宽的值，否则此值与bandwidth一致 |
| [<code>expire_time</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L162) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L75) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | id |
| [<code>master_order_id</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L180) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订购的受理单id |
| [<code>status</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L158) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性ip状态，取值范围：active：有效，down：未绑定，error：出错，updating：更新中，banding_or_unbangding：绑定解绑中，deleting：删除中，deleted：已删除，expired：已过期 |
| [<code>update_time</code>](../../../internal/service/vpc/resource_ctyun_eip.go#L176) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>address</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>bandwidth</code> | <code>int32validator.Between(1, 1024)</code> | — |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>demand_billing_type</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code><br><code>stringvalidator.OneOf(business.EipDemandBillingTypes...)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsString(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z\\x{4e00}-\\x{9fa5}&#93;&#91;0-9a-zA-Z_\\x{4e00}-\\x{9fa5}-&#93;+$"), "弹性IP名称不符合规则")</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>demand_billing_type</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_eip/resource.tf](../../../examples/resources/ctyun_eip/resource.tf)；未完整展示，显式展示 4 / 7。

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
  description = "Complete configurable shape for ctyun_eip; consult constraints before use."
  nullable    = false
  type = object({
    bandwidth           = number
    cycle_count         = optional(number)
    cycle_type          = string
    demand_billing_type = optional(string)
    name                = string
    project_id          = optional(string)
    region_id           = optional(string)
  })
}

resource "ctyun_eip" "example" {
  bandwidth           = var.config.bandwidth
  cycle_count         = var.config.cycle_count
  cycle_type          = var.config.cycle_type
  demand_billing_type = var.config.demand_billing_type
  name                = var.config.name
  project_id          = var.config.project_id
  region_id           = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_eip.example.address : string
# ctyun_eip.example.bandwidth_type : string
# ctyun_eip.example.create_time : string
# ctyun_eip.example.current_bandwidth : number
# ctyun_eip.example.expire_time : string
# ctyun_eip.example.id : string
# ctyun_eip.example.master_order_id : string
# ctyun_eip.example.status : string
# ctyun_eip.example.update_time : string
```

</details>
