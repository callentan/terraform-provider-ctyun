# ctyun_nat_dnat

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_nat_dnat.tf) · [源码](../../../internal/service/nat/resource_ctyun_dnat.go#L49) · [原文档](../../../docs/resources/nat_dnat.md)

**产品分类：** NAT网关（CT-NAT Gateway）。**用途：** 管理公网NAT网关dnat规则。

**属性数：** 顶层必填 / 可选 / 只读为 6 / 5 / 6；递归展开后可配置 11，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L117) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述，支持更新 |
| [<code>dnat_type</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L128) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | dnat规则类型，支持传递instance或custom，支持更新 |
| [<code>external_id</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L89) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 弹性IP的ID，形如eip-xxxxx，支持更新 |
| [<code>external_port</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L96) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 弹性IP公网端口，1 - 65535，支持更新 |
| [<code>instance_id</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L150) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云主机或物理机实例ID，当且仅当dnat_type为instance时必填，支持更新 |
| [<code>internal_ip</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L164) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 内部IP，当且仅当dnat_type为custom时必填，支持更新 |
| [<code>internal_port</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L103) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 主机内网端口，1 - 65535，支持更新 |
| [<code>nat_gateway_id</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L79) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | NAT网关Id |
| [<code>protocol</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L110) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议：tcp/udp，支持更新 |
| [<code>region_id</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L67) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>server_type</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L135) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 服务器类型，当且仅当dnat_type为instance时必填，支持：VM / BM，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L193) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>dnat_id</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L60) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | Dnat规则的id |
| [<code>external_ip</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L179) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性公网IP地址 |
| [<code>id</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L53) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID，同dnat_id |
| [<code>ip_expire_time</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L200) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>state</code>](../../../internal/service/nat/resource_ctyun_dnat.go#L186) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 运行状态: ACTIVE / FREEZING / CREATING |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>dnat_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>dnat_type</code> | <code>stringvalidator.OneOf("instance", "custom")</code> | — |
| <code>external_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>external_ip</code> | — | <code>planmodifier2.UseStringStateIfDependencyUnchanged(path.Root("external_id"))</code> |
| <code>external_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("dnat_type"),<br>						types.StringValue(business.VirtualMachineTypeCloud),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("dnat_type"),<br>						types.StringValue(business.VirtualMachineTypeCustom),<br>					)</code> | — |
| <code>internal_ip</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("dnat_type"),<br>						types.StringValue(business.VirtualMachineTypeCustom),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("dnat_type"),<br>						types.StringValue(business.VirtualMachineTypeCloud),<br>					)</code><br><code>validator2.Ip()</code> | — |
| <code>internal_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>nat_gateway_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.DNatProtocols...)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>server_type</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("dnat_type"),<br>						types.StringValue(business.VirtualMachineTypeCloud),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("dnat_type"),<br>						types.StringValue(business.VirtualMachineTypeCustom),<br>					)</code><br><code>stringvalidator.OneOf(business.ServerTypeVM, business.ServerTypeBM)</code> | — |
| <code>state</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>instance_id</code>、<code>region_id</code>、<code>server_type</code>。

**examples 源文件：** [examples/resources/ctyun_nat_dnat/resource.tf](../../../examples/resources/ctyun_nat_dnat/resource.tf)；未完整展示，显式展示 7 / 11。

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
  description = "Complete configurable shape for ctyun_nat_dnat; consult constraints before use."
  nullable    = false
  type = object({
    description    = optional(string)
    dnat_type      = string
    external_id    = string
    external_port  = number
    instance_id    = optional(string)
    internal_ip    = optional(string)
    internal_port  = number
    nat_gateway_id = string
    protocol       = string
    region_id      = optional(string)
    server_type    = optional(string)
  })
}

resource "ctyun_nat_dnat" "example" {
  description    = var.config.description
  dnat_type      = var.config.dnat_type
  external_id    = var.config.external_id
  external_port  = var.config.external_port
  instance_id    = var.config.instance_id
  internal_ip    = var.config.internal_ip
  internal_port  = var.config.internal_port
  nat_gateway_id = var.config.nat_gateway_id
  protocol       = var.config.protocol
  region_id      = var.config.region_id
  server_type    = var.config.server_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_nat_dnat.example.create_time : string
# ctyun_nat_dnat.example.dnat_id : string
# ctyun_nat_dnat.example.external_ip : string
# ctyun_nat_dnat.example.id : string
# ctyun_nat_dnat.example.ip_expire_time : string
# ctyun_nat_dnat.example.state : string
```

</details>
