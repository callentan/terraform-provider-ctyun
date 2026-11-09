# ctyun_ec_route

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ec_route.tf) · [源码](../../../internal/service/ec/resource_ctyun_ec_route.go#L97) · [原文档](../../../docs/resources/ec_route.md)

**产品分类：** 云间高速（标准版）（CT-EC, Express Connect Standard）。**用途：** 管理云间高速路由。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 4 / 2；递归展开后可配置 9，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cgw_id</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L111) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云网关id |
| [<code>cidr</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L143) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网信息 |
| [<code>description</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L188) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 路由描述信息 |
| [<code>ec_id</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L101) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云间高速id |
| [<code>ip_version</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L198) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网类型。取值范围:ipv4和ipv6 |
| [<code>is_black_hole_route</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L208) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否是黑洞路由, 如果选择true，next_hop_type、next_hop_id字段可不填写 |
| [<code>next_hop_id</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L171) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 目的实例ID/跨域连接ID，如不是黑洞路由则必填 |
| [<code>next_hop_type</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L153) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 下一跳实例的类型，如不是黑洞路由则必填。取值范围：vpc-虚拟私有云，cda-云专线，vpn-vpn网关，cross-跨域连接 |
| [<code>rtb_id</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L121) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 路由表id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L224) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/ec/resource_ctyun_ec_route.go#L217) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 路由规则id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cgw_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>cidr</code> | <code>validator2.Cidr()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>validator2.Desc()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>ec_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ip_version</code> | <code>stringvalidator.OneOf(business.EcIpVersionIpv4, business.EcIpVersionIpv6)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>is_black_hole_route</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>next_hop_id</code> | — | <code>explanmodifier.NullIgnoreString()</code> |
| <code>next_hop_type</code> | <code>stringvalidator.OneOf(business.EcNextHopTypeVPC, business.EcNextHopCDA, business.EcNextHopVPN, business.EcNextHopBlackCross)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("is_black_hole_route"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("is_black_hole_route"),<br>						types.BoolValue(false),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rtb_id</code> | <code>stringvalidator.UTF8LengthBetween(36, 36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 1 个有效 HCL 目标块合并后，显式展示 9 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_ec_route/resource.tf](../../../examples/resources/ctyun_ec_route/resource.tf)；字段展示完整，显式展示 9 / 9。

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
  description = "Complete configurable shape for ctyun_ec_route; consult constraints before use."
  nullable    = false
  type = object({
    cgw_id              = string
    cidr                = string
    description         = optional(string)
    ec_id               = string
    ip_version          = string
    is_black_hole_route = optional(bool)
    next_hop_id         = optional(string)
    next_hop_type       = optional(string)
    rtb_id              = string
  })
}

resource "ctyun_ec_route" "example" {
  cgw_id              = var.config.cgw_id
  cidr                = var.config.cidr
  description         = var.config.description
  ec_id               = var.config.ec_id
  ip_version          = var.config.ip_version
  is_black_hole_route = var.config.is_black_hole_route
  next_hop_id         = var.config.next_hop_id
  next_hop_type       = var.config.next_hop_type
  rtb_id              = var.config.rtb_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_route.example.create_time : string
# ctyun_ec_route.example.id : string
```

</details>
