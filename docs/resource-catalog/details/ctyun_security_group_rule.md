# ctyun_security_group_rule

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_security_group_rule.tf) · [源码](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L52) · [原文档](../../../docs/resources/security_group_rule.md)

**产品分类：** 虚拟私有云（Virtual Private Cloud，VPC）。**用途：** 管理安全组规则。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 5 / 1；递归展开后可配置 10，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>action</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L83) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 拒绝策略，accept：允许，drop：拒绝 |
| [<code>description</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L137) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述，长度1-128，支持更新 |
| [<code>dest_cidr_ip</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L125) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("0.0.0.0/0")</code> | 远端地址，为cidr地址格式，如果不填默认为0.0.0.0/0 |
| [<code>direction</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L73) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 规则方向，egress：出方向，ingress：入方向 |
| [<code>ether_type</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L115) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | IP类型：ipv4、ipv6 |
| [<code>priority</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L93) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | <code>int64default.StaticInt64(1)</code> | 优先级：1~100，取值越小优先级越大，默认优先级为50 |
| [<code>protocol</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L105) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议类型: tcp、udp、icmp、any，当此值填写any或icmp时，range的值不能设置 |
| [<code>range</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L148) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 安全组开放的传输层协议相关的源端端口范围，格式如：8000-9000，如果仅开放单一端口则直接填写，如：22，中间不能有空格以及其他特殊字符；如果protocol的值为any，请保证此值留空，如果protocol的值为tcp或udp，此值必填 |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L170) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>security_group_id</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L63) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_security_group_rule.go#L56) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>action</code> | <code>stringvalidator.OneOf(business.SecurityGroupRuleActions...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(128)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>dest_cidr_ip</code> | <code>validator2.Cidr()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>direction</code> | <code>stringvalidator.OneOf(business.SecurityGroupRuleDirections...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>ether_type</code> | <code>stringvalidator.OneOf(business.SecurityGroupRuleEtherTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>priority</code> | <code>int64validator.Between(1, 100)</code> | <code>int64planmodifier.RequiresReplace()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.SecurityGroupRuleProtocols...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>range</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.SecurityGroupRuleProtocolTcp),<br>						types.StringValue(business.SecurityGroupRuleProtocolUdp),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.SecurityGroupRuleProtocolAny),<br>						types.StringValue(business.SecurityGroupRuleProtocolIcmp),<br>					)</code><br><code>validator2.Range("-", 1, 65535)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_id</code> | <code>validator2.SecurityGroupValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 9 / 10 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_security_group_rule/resource.tf](../../../examples/resources/ctyun_security_group_rule/resource.tf)；未完整展示，显式展示 9 / 10。

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
  description = "Complete configurable shape for ctyun_security_group_rule; consult constraints before use."
  nullable    = false
  type = object({
    action            = string
    description       = optional(string)
    dest_cidr_ip      = optional(string)
    direction         = string
    ether_type        = string
    priority          = optional(number)
    protocol          = string
    range             = optional(string)
    region_id         = optional(string)
    security_group_id = string
  })
}

resource "ctyun_security_group_rule" "example" {
  action            = var.config.action
  description       = var.config.description
  dest_cidr_ip      = var.config.dest_cidr_ip
  direction         = var.config.direction
  ether_type        = var.config.ether_type
  priority          = var.config.priority
  protocol          = var.config.protocol
  range             = var.config.range
  region_id         = var.config.region_id
  security_group_id = var.config.security_group_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_security_group_rule.example.id : string
```

</details>
