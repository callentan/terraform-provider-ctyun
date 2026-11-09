# ctyun_port

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_port.tf) · [源码](../../../internal/service/vpc/resource_ctyun_port.go#L71) · [原文档](../../../docs/resources/port.md)

**产品分类：** 弹性网卡（Elastic Network Interface）。**用途：** 管理弹性网卡。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 9 / 6；递归展开后可配置 10，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/vpc/resource_ctyun_port.go#L90) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 弹性网卡描述。支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·~！@#￥%……&amp;*（） —— -+={}&#124;《》？：“”【】、；‘'，。、，不能以http:/https:开头，长度0-128 支持更新 |
| [<code>ipv6_address_count</code>](../../../internal/service/vpc/resource_ctyun_port.go#L174) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | IPv6地址数量，指定IPv6地址数量，让系统为您自动创建IPv6地址，最多支持10个 |
| [<code>ipv6_addresses</code>](../../../internal/service/vpc/resource_ctyun_port.go#L185) | <code>list(string)</code><br><code>ListAttribute</code> | O+C | 否 | — | IPv6地址列表，指定IPv6地址，不能和ipv6_address_count同时指定，最多支持10个 |
| [<code>name</code>](../../../internal/service/vpc/resource_ctyun_port.go#L82) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 弹性网卡名称。支持拉丁字母、中文、数字，下划线，连字符，中文/英文字母开头，不能以http:/https:开头，长度2-32  支持更新 |
| [<code>primary_ip_address</code>](../../../internal/service/vpc/resource_ctyun_port.go#L125) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 主私有IP地址，如果不指定则自动分配 |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_port.go#L102) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>secondary_private_ip_count</code>](../../../internal/service/vpc/resource_ctyun_port.go#L150) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 辅助私有IP地址数量，指定私有IP地址数量，让系统为您自动创建IP地址，最多支持10个 |
| [<code>secondary_private_ips</code>](../../../internal/service/vpc/resource_ctyun_port.go#L161) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | — | 辅助私有IP地址列表，指定私有IP地址，不能和secondary_private_ip_count同时指定，最多支持10个 |
| [<code>security_group_ids</code>](../../../internal/service/vpc/resource_ctyun_port.go#L137) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | — | 安全组ID列表，最多支持10个 |
| [<code>subnet_id</code>](../../../internal/service/vpc/resource_ctyun_port.go#L114) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_port.go#L75) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 网卡ID |
| [<code>instance_id</code>](../../../internal/service/vpc/resource_ctyun_port.go#L212) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 绑定的实例ID |
| [<code>instance_type</code>](../../../internal/service/vpc/resource_ctyun_port.go#L219) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实例类型 |
| [<code>mac_address</code>](../../../internal/service/vpc/resource_ctyun_port.go#L205) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | MAC地址 |
| [<code>port_id</code>](../../../internal/service/vpc/resource_ctyun_port.go#L198) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 网卡ID |
| [<code>status</code>](../../../internal/service/vpc/resource_ctyun_port.go#L226) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 网卡状态 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>description</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_type</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ipv6_address_count</code> | <code>int32validator.AtLeast(0)</code><br><code>int32validator.AtMost(10)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>ipv6_addresses</code> | <code>listvalidator.SizeAtMost(10)</code> | <code>listplanmodifier.RequiresReplace()</code><br><code>listplanmodifier.UseStateForUnknown()</code> |
| <code>mac_address</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z\u4e00-\u9fa5&#93;&#91;0-9a-zA-Z_\u4e00-\u9fa5-&#93;*&#91;0-9a-zA-Z_\u4e00-\u9fa5&#93;$"), "弹性网卡名称不符合规则")</code> | — |
| <code>port_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>primary_ip_address</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.RequiresReplace()</code><br><code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>secondary_private_ip_count</code> | <code>int32validator.AtLeast(0)</code><br><code>int32validator.AtMost(10)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>secondary_private_ips</code> | <code>setvalidator.SizeAtMost(10)</code> | <code>setplanmodifier.RequiresReplace()</code><br><code>setplanmodifier.UseStateForUnknown()</code> |
| <code>security_group_ids</code> | <code>setvalidator.SizeAtMost(10)</code> | <code>setplanmodifier.RequiresReplace()</code><br><code>setplanmodifier.UseStateForUnknown()</code> |
| <code>status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>subnet_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 5 / 10 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>ipv6_address_count</code>、<code>ipv6_addresses</code>、<code>primary_ip_address</code>、<code>region_id</code>、<code>secondary_private_ips</code>。

**examples 源文件：** [examples/resources/ctyun_port/resource.tf](../../../examples/resources/ctyun_port/resource.tf)；未完整展示，显式展示 5 / 10。

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
  description = "Complete configurable shape for ctyun_port; consult constraints before use."
  nullable    = false
  type = object({
    description                = optional(string)
    ipv6_address_count         = optional(number)
    ipv6_addresses             = optional(list(string))
    name                       = optional(string)
    primary_ip_address         = optional(string)
    region_id                  = optional(string)
    secondary_private_ip_count = optional(number)
    secondary_private_ips      = optional(set(string))
    security_group_ids         = optional(set(string))
    subnet_id                  = string
  })
}

resource "ctyun_port" "example" {
  description                = var.config.description
  ipv6_address_count         = var.config.ipv6_address_count
  ipv6_addresses             = var.config.ipv6_addresses
  name                       = var.config.name
  primary_ip_address         = var.config.primary_ip_address
  region_id                  = var.config.region_id
  secondary_private_ip_count = var.config.secondary_private_ip_count
  secondary_private_ips      = var.config.secondary_private_ips
  security_group_ids         = var.config.security_group_ids
  subnet_id                  = var.config.subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_port.example.id : string
# ctyun_port.example.instance_id : string
# ctyun_port.example.instance_type : string
# ctyun_port.example.mac_address : string
# ctyun_port.example.port_id : string
# ctyun_port.example.status : string
```

</details>
