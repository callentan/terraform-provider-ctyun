# ctyun_acl_rule

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_acl_rule.tf) · [源码](../../../internal/service/acl/resource_ctyun_acl_rule.go#L118) · [原文档](../../../docs/resources/acl_rule.md)

**产品分类：** 虚拟私有云（Virtual Private Cloud，VPC）。**用途：** 管理访问控制规则。

**属性数：** 顶层必填 / 可选 / 只读为 7 / 7 / 1；递归展开后可配置 14，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>acl_id</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L139) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | acl_id |
| [<code>action</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L231) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 策略，支持更新。取值范围：accept, drop |
| [<code>description</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L244) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | acl规则描述，支持更新 |
| [<code>destination_ip_address</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L224) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 目的地址，支持更新。支持cidr格式 |
| [<code>destination_port</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L179) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 目的地址端口范围，支持更新。示例 8080:8085 |
| [<code>direction</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L149) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | acl类型，支持更新。取值范围：ingress, egress |
| [<code>enabled</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L238) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | acl 规则是否启用，支持更新。默认启用 |
| [<code>ip_version</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L172) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | IP版本，支持更新。取值范围：ipv4, ipv6 |
| [<code>priority</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L156) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(100)</code> | 优先级，支持更新。取值范围： 1 - 32766，不填默认100 |
| [<code>project_id</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L134) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>protocol</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L165) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议，支持更新。取值范围：all, icmp, tcp, udp |
| [<code>region_id</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L122) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>source_ip_address</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L217) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 源地址，支持更新。支持cidr格式 |
| [<code>source_port</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L198) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 源地址端口范围，支持更新。示例： 8080:8085 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/acl/resource_ctyun_acl_rule.go#L255) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | acl 规则id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>acl_id</code> | <code>validator2.AclID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>action</code> | <code>stringvalidator.OneOf(business.AclRuleActionAccept, business.AclRuleActionDrop)</code> | — |
| <code>description</code> | <code>validator2.Desc()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>destination_ip_address</code> | <code>validator2.Cidr()</code> | — |
| <code>destination_port</code> | <code>stringvalidator.RegexMatches(regexp.MustCompile(`^(?:&#91;1-9&#93;\d{0,3}&#124;&#91;1-5&#93;\d{4}&#124;6&#91;0-4&#93;\d{3}&#124;65&#91;0-4&#93;\d{2}&#124;655&#91;0-2&#93;\d&#124;6553&#91;0-5&#93;):(?:&#91;1-9&#93;\d{0,3}&#124;&#91;1-5&#93;\d{4}&#124;6&#91;0-4&#93;\d{3}&#124;65&#91;0-4&#93;\d{2}&#124;655&#91;0-2&#93;\d&#124;6553&#91;0-5&#93;)$`), "输入的端口范围有误!")</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolTCP))</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolUDP))</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolALL))</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolICMP))</code> | — |
| <code>direction</code> | <code>stringvalidator.OneOf(business.AclDirectionIngress, business.AclDirectionEgress)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ip_version</code> | <code>stringvalidator.OneOf("ipv4", "ipv6")</code> | — |
| <code>priority</code> | <code>int32validator.Between(1, 32766)</code> | — |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.AclRuleProtocols...)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>source_ip_address</code> | <code>validator2.Cidr()</code> | — |
| <code>source_port</code> | <code>stringvalidator.RegexMatches(regexp.MustCompile(`^(?:&#91;1-9&#93;\d{0,3}&#124;&#91;1-5&#93;\d{4}&#124;6&#91;0-4&#93;\d{3}&#124;65&#91;0-4&#93;\d{2}&#124;655&#91;0-2&#93;\d&#124;6553&#91;0-5&#93;):(?:&#91;1-9&#93;\d{0,3}&#124;&#91;1-5&#93;\d{4}&#124;6&#91;0-4&#93;\d{3}&#124;65&#91;0-4&#93;\d{2}&#124;655&#91;0-2&#93;\d&#124;6553&#91;0-5&#93;)$`), "输入的端口范围有误!")</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolTCP))</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolUDP))</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolALL))</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.AclRuleProtocolICMP))</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 12 / 14 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_acl_rule/resource.tf](../../../examples/resources/ctyun_acl_rule/resource.tf)；未完整展示，显式展示 12 / 14。

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
  description = "Complete configurable shape for ctyun_acl_rule; consult constraints before use."
  nullable    = false
  type = object({
    acl_id                 = string
    action                 = string
    description            = optional(string)
    destination_ip_address = string
    destination_port       = optional(string)
    direction              = string
    enabled                = optional(bool)
    ip_version             = string
    priority               = optional(number)
    project_id             = optional(string)
    protocol               = string
    region_id              = optional(string)
    source_ip_address      = string
    source_port            = optional(string)
  })
}

resource "ctyun_acl_rule" "example" {
  acl_id                 = var.config.acl_id
  action                 = var.config.action
  description            = var.config.description
  destination_ip_address = var.config.destination_ip_address
  destination_port       = var.config.destination_port
  direction              = var.config.direction
  enabled                = var.config.enabled
  ip_version             = var.config.ip_version
  priority               = var.config.priority
  project_id             = var.config.project_id
  protocol               = var.config.protocol
  region_id              = var.config.region_id
  source_ip_address      = var.config.source_ip_address
  source_port            = var.config.source_port
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_acl_rule.example.id : string
```

</details>
