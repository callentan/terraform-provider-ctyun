# ctyun_ec_region_peer

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ec_region_peer.tf) · [源码](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L92) · [原文档](../../../docs/resources/ec_region_peer.md)

**产品分类：** 云间高速（标准版）（CT-EC, Express Connect Standard）。**用途：** 管理云间高速跨域连接。

**属性数：** 顶层必填 / 可选 / 只读为 6 / 1 / 4；递归展开后可配置 7，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>dst_cgw_id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L126) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 对端网关ID |
| [<code>ec_id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L106) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云间高速ID |
| [<code>name</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L96) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 连接名称 |
| [<code>packet_id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L136) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 带宽包ID |
| [<code>rate</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L146) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 带宽值（MB） 支持更新 |
| [<code>route_learn</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L153) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(1)</code> | 是否开启两端云网关路由自动学习，0：不开启，1：开启。默认开启 |
| [<code>src_cgw_id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L116) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 本端网关ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>dst_region_id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L179) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对端资源池ID |
| [<code>id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L165) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 跨域连接ID |
| [<code>src_region_id</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L172) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 本端资源池ID |
| [<code>update_time</code>](../../../internal/service/ec/resource_ctyun_ec_region_peer.go#L186) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>dst_cgw_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>dst_region_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ec_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>packet_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rate</code> | <code>int32validator.AtLeast(1)</code> | — |
| <code>route_learn</code> | <code>int32validator.OneOf(0, 1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>src_cgw_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>src_region_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_ec_region_peer/resource.tf](../../../examples/resources/ctyun_ec_region_peer/resource.tf)；字段展示完整，显式展示 7 / 7。

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
  description = "Complete configurable shape for ctyun_ec_region_peer; consult constraints before use."
  nullable    = false
  type = object({
    dst_cgw_id  = string
    ec_id       = string
    name        = string
    packet_id   = string
    rate        = number
    route_learn = optional(number)
    src_cgw_id  = string
  })
}

resource "ctyun_ec_region_peer" "example" {
  dst_cgw_id  = var.config.dst_cgw_id
  ec_id       = var.config.ec_id
  name        = var.config.name
  packet_id   = var.config.packet_id
  rate        = var.config.rate
  route_learn = var.config.route_learn
  src_cgw_id  = var.config.src_cgw_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_region_peer.example.dst_region_id : string
# ctyun_ec_region_peer.example.id : string
# ctyun_ec_region_peer.example.src_region_id : string
# ctyun_ec_region_peer.example.update_time : string
```

</details>
