# ctyun_flow_package

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_flow_package.tf) · [源码](../../../internal/service/vpc/resource_ctyun_flow_package.go#L61) · [原文档](../../../docs/resources/flow_package.md)

**产品分类：** 弹性IP（Elastic IP，EIP）。**用途：** 管理共享流量包。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 1 / 7；递归展开后可配置 3，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cycle_type</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L87) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month（1月），year（1年） |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L75) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>spec</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L97) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 规格说明：当 cycleType = month 时，10-10GB,50-50GB,100-100GB,500-500GB,1024-1TB,5120-5TB,10240-10TB,51200-50TB;   **当 cycleType = year 时，120-120GB,512-512GB,8192-8TB,36864-36TB,122880-120TB,614400-600TB,1048576-1PB,2097152-2PB |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>effective_time</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L118) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 生效时间 |
| [<code>expire_time</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L123) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 过期时间 |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L65) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>left_volume</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L133) | <code>number</code><br><code>Float64Attribute</code> | C | 否 | — | 剩余流量 |
| [<code>master_resource_id</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L137) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主资源ID |
| [<code>package_name</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L70) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 套餐名 |
| [<code>total_volume</code>](../../../internal/service/vpc/resource_ctyun_flow_package.go#L128) | <code>number</code><br><code>Float64Attribute</code> | C | 否 | — | 总流量 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypesMY...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>effective_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_resource_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>package_name</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>spec</code> | <code>validator2.CrossFieldInt32(<br>						path.MatchRoot("cycle_type"),<br>						&#91;&#93;any{"month"},<br>						&#91;&#93;int32{10, 50, 100, 500, 1024, 5120, 10240, 51200},<br>					)</code><br><code>validator2.CrossFieldInt32(<br>						path.MatchRoot("cycle_type"),<br>						&#91;&#93;any{"year"},<br>						&#91;&#93;int32{<br>							120, 512, 8192, 36864, 122880, 614400, 1048576, 2097152,<br>						},<br>					)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>total_volume</code> | — | <code>float64planmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 2 / 3 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_flow_package/resource.tf](../../../examples/resources/ctyun_flow_package/resource.tf)；未完整展示，显式展示 2 / 3。

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
  description = "Complete configurable shape for ctyun_flow_package; consult constraints before use."
  nullable    = false
  type = object({
    cycle_type = string
    region_id  = optional(string)
    spec       = number
  })
}

resource "ctyun_flow_package" "example" {
  cycle_type = var.config.cycle_type
  region_id  = var.config.region_id
  spec       = var.config.spec
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_flow_package.example.effective_time : string
# ctyun_flow_package.example.expire_time : string
# ctyun_flow_package.example.id : string
# ctyun_flow_package.example.left_volume : number
# ctyun_flow_package.example.master_resource_id : string
# ctyun_flow_package.example.package_name : string
# ctyun_flow_package.example.total_volume : number
```

</details>
