# ctyun_elb_listener

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_listener.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_listener.go#L63) · [原文档](../../../docs/resources/elb_listener.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡监听器。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 18 / 3；递归展开后可配置 25，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>access_control_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L176) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 访问控制ID，当access_control_type=White或者Black，必填。支持更新 |
| [<code>access_control_type</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L195) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 访问控制类型。取值范围：Close（未启用）、White（白名单）、Black（黑名单），支持更新 |
| [<code>ca_enabled</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L150) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否开启双向认证。true（开启），false（不开启），支持更新 |
| [<code>certificate_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L130) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 证书ID。当protocol为HTTPS时，此参数必填，支持更新 |
| [<code>client_certificate_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L158) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 双向认证的证书ID，当ca_enabled=ture，必填。支持更新 |
| [<code>default_action_type</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L221) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 默认规则动作类型。取值范围：forward、redirect，支持更新 |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L97) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·！@#￥%……&amp;*（） —— -+={}\&#124;《》？：“”【】、；‘'，。、，不能以 http: / https: 开头，长度 0 - 128，支持更新 |
| [<code>enable_nat_64</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L267) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否开启nat64，elb需要支持ipv6能力，支持更新 |
| [<code>establish_timeout</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L290) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 建立连接超时时间，单位秒，取值范围：1 - 1800。仅支持协议为 TCP 的监听器，支持更新 |
| [<code>forwarded_for_enabled</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L206) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | x-forward-for功能。false（未开启）、true（开启），支持更新 |
| [<code>idle_timeout</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L307) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 链接空闲断开超时时间，单位秒，取值范围：1 - 300，仅支持协议为 HTTP / HTTPS 的监听器，支持更新，支持更新 |
| [<code>listener_cps</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L339) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | cps大小，仅支持协议为 TCP / UDP 的监听器。支持更新 |
| [<code>listener_qps</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L275) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | qps 大小，仅支持协议为 HTTP / HTTPS 的监听器，支持更新 |
| [<code>loadbalancer_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L79) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 负载均衡实例ID |
| [<code>name</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L89) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 监听器名称。支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32，支持更新 |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L262) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>protocol</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L110) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 监听协议。取值范围：TCP、UDP、HTTP、HTTPS |
| [<code>protocol_port</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L120) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 负载均衡实例监听端口。取值：1-65535，protocol_port。不支持更新 |
| [<code>redirect_listener_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L228) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 重定向监听器ID，当default_action_type为redirect时，此字段必填。支持更新 |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L67) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>response_timeout</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L323) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 响应超时，单位秒，取值范围：1 - 300。仅支持协议为 HTTP / HTTPS 的监听器，支持更新 |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L242) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.ElbRuleStatusACTIVE)</code> | 监听器状态: DOWN/ACTIVE，可以控制监听器开关。支持更新 |
| [<code>target_groups</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L354) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 后端服务组，最多只支持添加一个后端服务组。当default_action_type=forward时，target_groups不能为空。支持更新 |
| [<code>target_groups&#91;&#93;.target_group_id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L359) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 后端服务组ID，支持更新 |
| [<code>target_groups&#91;&#93;.weight</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L366) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(100)</code> | 后端主机权重，取值范围：1-256。默认为100，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L251) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L214) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 监听器ID |
| [<code>update_time</code>](../../../internal/service/elb/resource_ctyun_elb_listener.go#L258) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>access_control_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("access_control_type"),<br>						types.StringValue(business.ListenerAccessControlTypeWhite),<br>						types.StringValue(business.ListenerAccessControlTypeBlack),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("access_control_type"),<br>						types.StringValue(business.ListenerAccessControlTypeClose),<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>access_control_type</code> | <code>stringvalidator.OneOf(business.ListenerAccessControlTypes...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ca_enabled</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>certificate_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolHTTPS),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolHTTP),<br>						types.StringValue(business.ListenerProtocolTCP),<br>						types.StringValue(business.ListenerProtocolUDP),<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>client_certificate_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("ca_enabled"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("ca_enabled"),<br>						types.BoolValue(false),<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>default_action_type</code> | <code>stringvalidator.OneOf(business.ListenerDefaultActionTypes...)</code> | — |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 128)</code><br><code>validator2.Desc()</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^(&#91;^h&#93;&#124;h&#91;^t&#93;&#124;ht&#91;^t&#93;&#124;htt&#91;^p&#93;&#124;http&#91;^s&#93;&#124;https.).*$`), "不能以http:或https:开头")</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>enable_nat_64</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>establish_timeout</code> | <code>int32validator.Between(1, 1800)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolHTTP),<br>						types.StringValue(business.ListenerProtocolHTTPS),<br>						types.StringValue(business.ListenerProtocolUDP),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>forwarded_for_enabled</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>idle_timeout</code> | <code>int32validator.Between(1, 300)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolTCP),<br>						types.StringValue(business.ListenerProtocolUDP),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>listener_cps</code> | <code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolHTTP),<br>						types.StringValue(business.ListenerProtocolHTTPS),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>listener_qps</code> | <code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolTCP),<br>						types.StringValue(business.ListenerProtocolUDP),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>loadbalancer_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 32)</code><br><code>validator2.AclName()</code> | — |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.ListenerProtocols...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>protocol_port</code> | <code>int32validator.Between(1, 65535)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>redirect_listener_id</code> | <code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("default_action_type"),<br>						types.StringValue(business.ListenerDefaultActionTypeForward),<br>					)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("default_action_type"),<br>						types.StringValue(business.ListenerDefaultActionTypeRedirect),<br>					)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>response_timeout</code> | <code>int32validator.Between(1, 300)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.ListenerProtocolTCP),<br>						types.StringValue(business.ListenerProtocolUDP),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>status</code> | <code>stringvalidator.OneOf(business.ElbRuleStatus...)</code> | — |
| <code>target_groups</code> | <code>validator2.AlsoRequiresEqualList(<br>						path.MatchRoot("default_action_type"),<br>						types.StringValue(business.ListenerDefaultActionTypeForward),<br>					)</code><br><code>listvalidator.SizeAtMost(1)</code> | <code>listplanmodifier.RequiresReplace()</code> |
| <code>target_groups&#91;&#93;.target_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>target_groups&#91;&#93;.weight</code> | <code>int32validator.Between(1, 256)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 9 / 25 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>access_control_id</code>、<code>access_control_type</code>、<code>ca_enabled</code>、<code>certificate_id</code>、<code>client_certificate_id</code>、<code>description</code>、<code>enable_nat_64</code>、<code>forwarded_for_enabled</code>、<code>idle_timeout</code>、<code>listener_qps</code>、<code>project_id</code>、<code>redirect_listener_id</code>、<code>region_id</code>、<code>response_timeout</code>、<code>status</code>、<code>target_groups&#91;&#93;.weight</code>。

**examples 源文件：** [examples/resources/ctyun_elb_listener/resource.tf](../../../examples/resources/ctyun_elb_listener/resource.tf)；未完整展示，显式展示 9 / 25。

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
  description = "Complete configurable shape for ctyun_elb_listener; consult constraints before use."
  nullable    = false
  type = object({
    access_control_id     = optional(string)
    access_control_type   = optional(string)
    ca_enabled            = optional(bool)
    certificate_id        = optional(string)
    client_certificate_id = optional(string)
    default_action_type   = string
    description           = optional(string)
    enable_nat_64         = optional(bool)
    establish_timeout     = optional(number)
    forwarded_for_enabled = optional(bool)
    idle_timeout          = optional(number)
    listener_cps          = optional(number)
    listener_qps          = optional(number)
    loadbalancer_id       = string
    name                  = string
    project_id            = optional(string)
    protocol              = string
    protocol_port         = number
    redirect_listener_id  = optional(string)
    region_id             = optional(string)
    response_timeout      = optional(number)
    status                = optional(string)
    target_groups = optional(list(object({
      target_group_id = string
      weight          = optional(number)
    })))
  })
}

resource "ctyun_elb_listener" "example" {
  access_control_id     = var.config.access_control_id
  access_control_type   = var.config.access_control_type
  ca_enabled            = var.config.ca_enabled
  certificate_id        = var.config.certificate_id
  client_certificate_id = var.config.client_certificate_id
  default_action_type   = var.config.default_action_type
  description           = var.config.description
  enable_nat_64         = var.config.enable_nat_64
  establish_timeout     = var.config.establish_timeout
  forwarded_for_enabled = var.config.forwarded_for_enabled
  idle_timeout          = var.config.idle_timeout
  listener_cps          = var.config.listener_cps
  listener_qps          = var.config.listener_qps
  loadbalancer_id       = var.config.loadbalancer_id
  name                  = var.config.name
  project_id            = var.config.project_id
  protocol              = var.config.protocol
  protocol_port         = var.config.protocol_port
  redirect_listener_id  = var.config.redirect_listener_id
  region_id             = var.config.region_id
  response_timeout      = var.config.response_timeout
  status                = var.config.status
  target_groups         = var.config.target_groups
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_listener.example.create_time : string
# ctyun_elb_listener.example.id : string
# ctyun_elb_listener.example.update_time : string
```

</details>
