# ctyun_elb_target_group

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_target_group.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L59) · [原文档](../../../docs/resources/elb_target_group.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡后端服务组。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 10 / 4；递归展开后可配置 13，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>algorithm</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L125) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 调度算法。取值范围：wrr（带权重轮询）、lc（最少连接）、sh（源IP哈希），支持更新 |
| [<code>cookie_expire</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L160) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | cookie过期时间。INSERT模式必填，支持更新 |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L92) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述，支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:'{},./;'&#91;,&#93;·！@#￥%……&amp;*（） —— -+={},，支持更新 |
| [<code>health_check_id</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L114) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 需要关联的健康检查Id，支持更新 |
| [<code>name</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L85) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 后端主机组名称，唯一。支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32，支持更新 |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L141) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>protocol</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L75) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 创建时建议填写，否则后续某些功能无法开启。支持TCP/UDP/HTTP/HTTPS，该字段不支持更新。当protocol=HTTP/HTTPS时，target_group.session_sticky_mode仅支持INSERT/REWRITE |
| [<code>proxy_protocol</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L132) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(0)</code> | 1 开启，0 关闭，当protocol=tcp时必填，其他协议默认关闭。 |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L63) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>rewrite_cookie_name</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L180) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | cookie重写名称，REWRITE模式必填，支持更新 |
| [<code>session_sticky_mode</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L146) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("CLOSE")</code> | 会话保持模式，支持取值：CLOSE（关闭）、INSERT（插入）、REWRITE（重写）、SOURCE_IP（源IP）。当 algorithm 为 lc / sh 时，sessionStickyMode无需填写，默认为 CLOSE，支持更新 |
| [<code>source_ip_timeout</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L200) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 源IP会话保持超时时间。SOURCE_IP模式必填，支持更新 |
| [<code>vpc_id</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L104) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 需要创建后端主机组的 VPC 的 ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L231) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L220) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 后端服务组ID |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L227) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 状态: ACTIVE / DOWN |
| [<code>update_time</code>](../../../internal/service/elb/resource_ctyun_elb_target_group.go#L238) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>algorithm</code> | <code>stringvalidator.OneOf(business.TargetGroupAlgorithms...)</code> | — |
| <code>cookie_expire</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("session_sticky_mode"),<br>						types.StringValue(business.TargetGroupSessionStickyModeINSERT),<br>					)</code><br><code>validator2.ConflictsWithEqualInt64(<br>						path.MatchRoot("session_sticky_mode"),<br>						types.StringValue(business.TargetGroupSessionStickyModeREWRITE),<br>						types.StringValue(business.TargetGroupSessionStickyModeSourceIP),<br>						types.StringValue(business.TargetGroupSessionStickyModeCLOSE),<br>					)</code> | <code>planmodifier2.SetStateNullIfDependencyChangeInt64(path.Root("session_sticky_mode"))</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>validator2.Desc()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>health_check_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 32)</code> | — |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.ListenerProtocols...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>proxy_protocol</code> | <code>int32validator.Between(0, 1)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rewrite_cookie_name</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("session_sticky_mode"),<br>						types.StringValue(business.TargetGroupSessionStickyModeREWRITE),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("session_sticky_mode"),<br>						types.StringValue(business.TargetGroupSessionStickyModeCLOSE),<br>						types.StringValue(business.TargetGroupSessionStickyModeSourceIP),<br>						types.StringValue(business.TargetGroupSessionStickyModeINSERT),<br>					)</code> | <code>planmodifier2.SetStateNullIfDependencyChangeString(path.Root("session_sticky_mode"))</code> |
| <code>session_sticky_mode</code> | <code>stringvalidator.OneOf(business.TargetGroupSessionStickyModes...)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("algorithm"),<br>						types.StringValue(business.TargetGroupAlgorithmLC),<br>						types.StringValue(business.TargetGroupAlgorithmSH),<br>					)</code> | — |
| <code>source_ip_timeout</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("session_sticky_mode"),<br>						types.StringValue(business.TargetGroupSessionStickyModeSourceIP),<br>					)</code><br><code>validator2.ConflictsWithEqualInt64(<br>						path.MatchRoot("session_sticky_mode"),<br>						types.StringValue(business.TargetGroupSessionStickyModeCLOSE),<br>						types.StringValue(business.TargetGroupSessionStickyModeREWRITE),<br>						types.StringValue(business.TargetGroupSessionStickyModeINSERT),<br>					)</code> | <code>planmodifier2.SetStateNullIfDependencyChangeInt64(path.Root("session_sticky_mode"))</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 8 / 13 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>cookie_expire</code>、<code>description</code>、<code>project_id</code>、<code>region_id</code>、<code>rewrite_cookie_name</code>。

**examples 源文件：** [examples/resources/ctyun_elb_target_group/resource.tf](../../../examples/resources/ctyun_elb_target_group/resource.tf)；未完整展示，显式展示 8 / 13。

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
  description = "Complete configurable shape for ctyun_elb_target_group; consult constraints before use."
  nullable    = false
  type = object({
    algorithm           = string
    cookie_expire       = optional(number)
    description         = optional(string)
    health_check_id     = optional(string)
    name                = string
    project_id          = optional(string)
    protocol            = optional(string)
    proxy_protocol      = optional(number)
    region_id           = optional(string)
    rewrite_cookie_name = optional(string)
    session_sticky_mode = optional(string)
    source_ip_timeout   = optional(number)
    vpc_id              = string
  })
}

resource "ctyun_elb_target_group" "example" {
  algorithm           = var.config.algorithm
  cookie_expire       = var.config.cookie_expire
  description         = var.config.description
  health_check_id     = var.config.health_check_id
  name                = var.config.name
  project_id          = var.config.project_id
  protocol            = var.config.protocol
  proxy_protocol      = var.config.proxy_protocol
  region_id           = var.config.region_id
  rewrite_cookie_name = var.config.rewrite_cookie_name
  session_sticky_mode = var.config.session_sticky_mode
  source_ip_timeout   = var.config.source_ip_timeout
  vpc_id              = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_target_group.example.create_time : string
# ctyun_elb_target_group.example.id : string
# ctyun_elb_target_group.example.status : string
# ctyun_elb_target_group.example.update_time : string
```

</details>
