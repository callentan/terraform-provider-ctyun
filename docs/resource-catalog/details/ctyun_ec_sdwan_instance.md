# ctyun_ec_sdwan_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ec_sdwan_instance.tf) · [源码](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L56) · [原文档](../../../docs/resources/ec_sdwan_instance.md)

**产品分类：** 云间高速（标准版）（CT-EC, Express Connect Standard）。**用途：** 管理云间高速SDWAN网络实例。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 3 / 1；递归展开后可配置 7，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cgw_id</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L77) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云网关ID |
| [<code>ec_id</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L67) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云间高速ID |
| [<code>route_learn</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L114) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 路由学习开关，开启后云网关自动学习网络实例路由，取值范围: 1:学习 0:不学习，默认学习 |
| [<code>route_sync</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L125) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 路由同步开关，开启后云网关路由自动同步到网络实例，取值范围: 1:同步 0:不同步，默认同步 |
| [<code>rtb_id</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L97) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云网关默认路由表ID |
| [<code>sdwan_id</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L87) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | sdwan ID |
| [<code>weights</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L107) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 权重，sdwan默认60，无冗余实例则不传 支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/ec/resource_ctyun_ec_sdwan_instance.go#L60) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 网络实例ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cgw_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>ec_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>route_learn</code> | <code>int64validator.OneOf(0, 1)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>route_sync</code> | <code>int64validator.OneOf(0, 1)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>rtb_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>sdwan_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>weights</code> | <code>int64validator.Between(0, 100)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_ec_sdwan_instance/resource.tf](../../../examples/resources/ctyun_ec_sdwan_instance/resource.tf)；字段展示完整，显式展示 7 / 7。

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
  description = "Complete configurable shape for ctyun_ec_sdwan_instance; consult constraints before use."
  nullable    = false
  type = object({
    cgw_id      = string
    ec_id       = string
    route_learn = optional(number)
    route_sync  = optional(number)
    rtb_id      = string
    sdwan_id    = string
    weights     = optional(number)
  })
}

resource "ctyun_ec_sdwan_instance" "example" {
  cgw_id      = var.config.cgw_id
  ec_id       = var.config.ec_id
  route_learn = var.config.route_learn
  route_sync  = var.config.route_sync
  rtb_id      = var.config.rtb_id
  sdwan_id    = var.config.sdwan_id
  weights     = var.config.weights
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_sdwan_instance.example.id : string
```

</details>
