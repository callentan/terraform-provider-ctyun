# ctyun_bandwidth

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_bandwidth.tf) · [源码](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L65) · [原文档](../../../docs/resources/bandwidth.md)

**产品分类：** 共享带宽（Shared Bandwidth）。**用途：** 管理共享带宽。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 4；递归展开后可配置 6，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>bandwidth</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L82) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 共享带宽的带宽峰值（Mbit/s），取值范围5-1000，支持更新 |
| [<code>cycle_count</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L99) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长, 该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-3年 |
| [<code>cycle_type</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L89) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年、on_demand：按需。当此值为month或者year时，cycle_count为必填 |
| [<code>name</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L74) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 共享带宽命名，单账户单资源池下，命名需唯一，长度为2-63个字符，只能由数字、字母、-组成，不能以数字、-开头，且不能以-结尾，支持更新 |
| [<code>project_id</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L138) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L150) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L124) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L117) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L69) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 共享带宽id |
| [<code>status</code>](../../../internal/service/vpc/resource_ctyun_bandwidth.go#L131) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 共享带宽状态: active：有效，expired：已过期，freezing：冻结 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>bandwidth</code> | <code>int32validator.Between(5, 1000)</code> | — |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 63)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z\\x{4e00}-\\x{9fa5}&#93;&#91;0-9a-zA-Z_\\x{4e00}-\\x{9fa5}-&#93;+$"), "共享带宽名称不符合规则")</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 2 个有效 HCL 目标块合并后，显式展示 4 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_bandwidth/resource.tf](../../../examples/resources/ctyun_bandwidth/resource.tf)；未完整展示，显式展示 4 / 6。

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
  description = "Complete configurable shape for ctyun_bandwidth; consult constraints before use."
  nullable    = false
  type = object({
    bandwidth   = number
    cycle_count = optional(number)
    cycle_type  = string
    name        = string
    project_id  = optional(string)
    region_id   = optional(string)
  })
}

resource "ctyun_bandwidth" "example" {
  bandwidth   = var.config.bandwidth
  cycle_count = var.config.cycle_count
  cycle_type  = var.config.cycle_type
  name        = var.config.name
  project_id  = var.config.project_id
  region_id   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_bandwidth.example.create_time : string
# ctyun_bandwidth.example.expire_time : string
# ctyun_bandwidth.example.id : string
# ctyun_bandwidth.example.status : string
```

</details>
