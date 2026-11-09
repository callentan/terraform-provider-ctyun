# ctyun_elb_rule

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_rule.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_rule.go#L85) · [原文档](../../../docs/resources/elb_rule.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡转发规则。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 5 / 5；递归展开后可配置 14，只读 5（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>action_redirect_listener_id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L217) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 重定向监听器ID，当action_type = redirect时，必填，支持更新 |
| [<code>action_target_groups</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L193) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 后端服务组，支持更新 |
| [<code>action_target_groups&#91;&#93;.target_group_id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L198) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 后端服务组ID，支持更新 |
| [<code>action_target_groups&#91;&#93;.weight</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L205) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(100)</code> | 权重，取值范围：1-256。默认为100，支持更新 |
| [<code>action_type</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L186) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 默认规则动作类型。取值范围：forward、redirect，支持更新 |
| [<code>conditions</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L125) | <code>list(object)</code><br><code>ListNestedAttribute</code> | R | 否 | — | 匹配规则数据，支持更新 |
| [<code>conditions&#91;&#93;.condition_match_type</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L167) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 匹配类型。取值范围：ABSOLUTE，PREFIX，REG，支持更新 |
| [<code>conditions&#91;&#93;.condition_server_name</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L137) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 服务名称,格式为：xxx.xxx结构，不支持下划线'_'。当type = server_name填写，支持更新 |
| [<code>conditions&#91;&#93;.condition_type</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L130) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 匹配规则类型。取值范围：server_name（服务名称）、url_path（匹配路径），支持更新 |
| [<code>conditions&#91;&#93;.condition_url_paths</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L152) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 匹配路径。当type = url_path填写，支持更新 |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L117) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:'{},./;'&#91;,&#93;·~！@#￥%……&amp;*（） —— -+={}，支持更新 |
| [<code>listener_id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L101) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 监听器listener Id |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L111) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L89) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L242) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L228) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 转发规则 ID |
| [<code>load_balancer_id</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L234) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 负载均衡Id |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L238) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 状态: ACTIVE / DOWN |
| [<code>update_time</code>](../../../internal/service/elb/resource_ctyun_elb_rule.go#L246) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>action_redirect_listener_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("action_type"),<br>						types.StringValue(business.ElbRuleActionTypeRedirect),<br>					)</code> | — |
| <code>action_target_groups&#91;&#93;.target_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>action_target_groups&#91;&#93;.weight</code> | <code>int32validator.Between(1, 256)</code> | — |
| <code>action_type</code> | <code>stringvalidator.OneOf(business.ElbRuleActionType...)</code> | — |
| <code>conditions&#91;&#93;.condition_match_type</code> | <code>stringvalidator.OneOf(business.ElbRuleMatchTypes...)</code><br><code>validator2.AlsoRequiresEqualString(<br>									path.MatchRelative().AtParent().AtName("condition_type"),<br>									types.StringValue(business.ElbRuleConditionTypeUrlPath),<br>								)</code><br><code>validator2.ConflictsWithEqualString(<br>									path.MatchRelative().AtParent().AtName("condition_type"),<br>									types.StringValue(business.ElbRuleConditionTypeServerName),<br>								)</code> | — |
| <code>conditions&#91;&#93;.condition_server_name</code> | <code>validator2.AlsoRequiresEqualString(<br>									path.MatchRelative().AtParent().AtName("condition_type"),<br>									types.StringValue(business.ElbRuleConditionTypeServerName),<br>								)</code><br><code>validator2.ConflictsWithEqualString(<br>									path.MatchRelative().AtParent().AtName("condition_type"),<br>									types.StringValue(business.ElbRuleConditionTypeUrlPath),<br>								)</code> | — |
| <code>conditions&#91;&#93;.condition_type</code> | <code>stringvalidator.OneOf(business.ElbRuleConditionTypes...)</code> | — |
| <code>conditions&#91;&#93;.condition_url_paths</code> | <code>validator2.AlsoRequiresEqualString(<br>									path.MatchRelative().AtParent().AtName("condition_type"),<br>									types.StringValue(business.ElbRuleConditionTypeUrlPath),<br>								)</code><br><code>validator2.ConflictsWithEqualString(<br>									path.MatchRelative().AtParent().AtName("condition_type"),<br>									types.StringValue(business.ElbRuleConditionTypeServerName),<br>								)</code> | — |
| <code>description</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>validator2.Desc()</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>listener_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 14 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>action_redirect_listener_id</code>、<code>action_target_groups&#91;&#93;.weight</code>、<code>conditions&#91;&#93;.condition_match_type</code>、<code>conditions&#91;&#93;.condition_url_paths</code>、<code>description</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_elb_rule/resource.tf](../../../examples/resources/ctyun_elb_rule/resource.tf)；未完整展示，显式展示 7 / 14。

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
  description = "Complete configurable shape for ctyun_elb_rule; consult constraints before use."
  nullable    = false
  type = object({
    action_redirect_listener_id = optional(string)
    action_target_groups = optional(list(object({
      target_group_id = string
      weight          = optional(number)
    })))
    action_type = string
    conditions = list(object({
      condition_match_type  = optional(string)
      condition_server_name = optional(string)
      condition_type        = string
      condition_url_paths   = optional(string)
    }))
    description = optional(string)
    listener_id = string
    project_id  = optional(string)
    region_id   = optional(string)
  })
}

resource "ctyun_elb_rule" "example" {
  action_redirect_listener_id = var.config.action_redirect_listener_id
  action_target_groups        = var.config.action_target_groups
  action_type                 = var.config.action_type
  conditions                  = var.config.conditions
  description                 = var.config.description
  listener_id                 = var.config.listener_id
  project_id                  = var.config.project_id
  region_id                   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_rule.example.create_time : string
# ctyun_elb_rule.example.id : string
# ctyun_elb_rule.example.load_balancer_id : string
# ctyun_elb_rule.example.status : string
# ctyun_elb_rule.example.update_time : string
```

</details>
