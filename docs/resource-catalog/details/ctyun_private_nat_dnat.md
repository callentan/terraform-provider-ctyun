# ctyun_private_nat_dnat

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_private_nat_dnat.tf) · [源码](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L46) · [原文档](../../../docs/resources/private_nat_dnat.md)

**产品分类：** NAT网关（CT-NAT Gateway）。**用途：** 管理私网NAT网关dnat规则。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 4 / 6；递归展开后可配置 9，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L138) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | DNAT描述支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·！@#￥%……&amp;*（） —— -+={}\&#124;《》？：“”【】、；‘'，。、，不能以 http: / https: 开头，长度 0 - 128，支持更新 |
| [<code>external_ip</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L86) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 中转IP 支持更新 |
| [<code>external_port</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L93) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 对外的端口（1-65535） 支持更新 |
| [<code>internal_ip</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L107) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 对应的内部IP(和port_id二选一) 支持更新 |
| [<code>internal_port</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L100) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 对应的内部端口（1-65535）支持更新 |
| [<code>nat_gateway_id</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L76) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | NAT网关Id |
| [<code>port_id</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L119) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 对应的网卡ID(和internal_ip二选一) 支持更新 |
| [<code>protocol</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L131) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议: tcp, udp 支持更新 |
| [<code>region_id</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L64) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L158) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>device_id</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L171) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>dnat_id</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L57) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | PrivateDnat规则的id |
| [<code>id</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L50) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID，同dnat_id |
| [<code>port_name</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L165) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |
| [<code>state</code>](../../../internal/service/nat/resource_ctyun_private_nat_dnat.go#L151) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 运行状态: running代表运行中, freeze代表已冻结, expired代表已到期 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 128)</code><br><code>validator2.Desc()</code><br><code>validator2.DescNotStartWithHttp()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>dnat_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>external_ip</code> | <code>validator2.Ip()</code> | — |
| <code>external_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>internal_ip</code> | <code>stringvalidator.ExactlyOneOf(path.MatchRoot("port_id"))</code><br><code>stringvalidator.ConflictsWith(path.MatchRoot("port_id"))</code> | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("port_id"))</code> |
| <code>internal_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>nat_gateway_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>port_id</code> | <code>stringvalidator.ExactlyOneOf(path.MatchRoot("internal_ip"))</code><br><code>stringvalidator.ConflictsWith(path.MatchRoot("internal_ip"))</code> | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("internal_ip"))</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf("tcp", "udp")</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>state</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 6 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>port_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_private_nat_dnat/resource.tf](../../../examples/resources/ctyun_private_nat_dnat/resource.tf)；未完整展示，显式展示 6 / 9。

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
  description = "Complete configurable shape for ctyun_private_nat_dnat; consult constraints before use."
  nullable    = false
  type = object({
    description    = optional(string)
    external_ip    = string
    external_port  = number
    internal_ip    = optional(string)
    internal_port  = number
    nat_gateway_id = string
    port_id        = optional(string)
    protocol       = string
    region_id      = optional(string)
  })
}

resource "ctyun_private_nat_dnat" "example" {
  description    = var.config.description
  external_ip    = var.config.external_ip
  external_port  = var.config.external_port
  internal_ip    = var.config.internal_ip
  internal_port  = var.config.internal_port
  nat_gateway_id = var.config.nat_gateway_id
  port_id        = var.config.port_id
  protocol       = var.config.protocol
  region_id      = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_nat_dnat.example.create_time : string
# ctyun_private_nat_dnat.example.device_id : string
# ctyun_private_nat_dnat.example.dnat_id : string
# ctyun_private_nat_dnat.example.id : string
# ctyun_private_nat_dnat.example.port_name : string
# ctyun_private_nat_dnat.example.state : string
```

</details>
