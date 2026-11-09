# ctyun_scaling_policy

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_scaling_policy.tf) · [源码](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L118) · [原文档](../../../docs/resources/scaling_policy.md)

**产品分类：** 弹性伸缩服务（CT-AS，Auto Scaling）。**用途：** 管理弹性伸缩策略。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 25 / 1；递归展开后可配置 28，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>action</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L186) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 执行动作: increase-增加, decrease-减少, set-设置为，当status=disable时，支持更新 |
| [<code>cooldown</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L254) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 冷却/预热时间 (单位: 秒)，当status=disable时，支持更新 |
| [<code>cycle</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L199) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 循环方式: monthly-按月循环, weekly-按周循环, daily-按天循环，当status=disable时，支持更新 |
| [<code>day</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L210) | <code>set(number)</code><br><code>SetAttribute</code> | O | 否 | — | 执行日期，当cycle=monthly时，取值范围为&#91;1,31&#93;，担当cycle=weekly时，取值范围为&#91;1,7&#93;，当status=disable时，支持更新 |
| [<code>effective_from</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L223) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 周期策略生效开始时间 (格式: 2006-01-02 15:04:05)，当status=disable时，支持更新 |
| [<code>effective_till</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L233) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 周期策略生效截止时间 (格式: 2006-01-02 15:04:05)，当status=disable时，支持更新 |
| [<code>execution_time</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L243) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 执行时间 (格式: 2006-01-02 15:04:05)，当status=disable时，支持更新 |
| [<code>group_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L134) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 伸缩组ID |
| [<code>is_execute</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L416) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 控制是否需要执行弹性伸缩策略，true表示执行，false表示不执行。默认为false，支持更新 |
| [<code>name</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L144) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 伸缩策略名称，当status=disable时，支持更新 |
| [<code>operate_count</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L174) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 调整值，当status=disable时，支持更新 |
| [<code>operate_unit</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L161) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 操作单位: count-个数, percent-百分比，当status=disable时，支持更新 |
| [<code>policy_type</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L151) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 策略类型: alert-告警策略, regular-定时策略, period-周期策略, target-目标追踪策略 |
| [<code>region_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L122) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID |
| [<code>status</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L427) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 告警规则状态：enable：启用。disable：停用，支持更新 |
| [<code>target_disable_scale_in</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L406) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否禁用缩容，当status=disable时，支持更新。默认为false。 |
| [<code>target_metric_name</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L348) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 监控指标名称，取值范围：cpu_util-CPU使用率，network_incoming_bytes_rate_inband-网络流入速率，network_outing_bytes_rate_inband-网络流出速率，当status=disable时，支持更新 |
| [<code>target_operate_range</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L395) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 缩容波动范围 (范围: 10-20)，，当status=disable时，支持更新 |
| [<code>target_scale_in_evaluation_count</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L384) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 缩容连续告警次数 (范围: 1-100)，当status=disable时，支持更新 |
| [<code>target_scale_out_evaluation_count</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L373) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 扩容连续告警次数 (范围: 1-100)，支持更新 |
| [<code>target_value</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L363) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 追踪目标值，当status=disable时，支持更新 |
| [<code>trigger_comparison_operator</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L306) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 比较符: ge-大于等于, le-小于等于, gt-大于, lt-小于，当status=disable时，支持更新 |
| [<code>trigger_evaluation_count</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L337) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 连续出现次数，当status=disable时，支持更新 |
| [<code>trigger_metric_name</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L275) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 监控指标名称，取值范围：cpu_util-CPU使用率，mem_util-内存使用率，network_incoming_bytes_rate_inband-网络流入速率，network_outing_bytes_rate_inband-网络流出速率，disk_read_bytes_rate-磁盘读速率，disk_write_bytes_rate-磁盘写速率，disk_read_requests_rate-磁盘读请求速率，disk_write_requests_rate-磁盘写请求速率，当status=disable时，支持更新 |
| [<code>trigger_name</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L265) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 告警规则名称，当status=disable时，支持更新 |
| [<code>trigger_period</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L327) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 监控周期 (如: 5m)，当status=disable时，支持更新 |
| [<code>trigger_statistics</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L295) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 聚合方法: avg-平均值, max-最大值, min-最小值，当status=disable时，支持更新 |
| [<code>trigger_threshold</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L317) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 阈值，当status=disable时，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/scaling/resource_ctyun_scaling_policy.go#L420) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 伸缩策略id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>action</code> | <code>stringvalidator.OneOf(business.Actions...)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>						types.StringValue("regular"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>cooldown</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>cycle</code> | <code>stringvalidator.OneOf(business.Cycles...)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>day</code> | <code>validator2.AlsoRequiresEqualSet(<br>						path.MatchRoot("cycle"),<br>						types.StringValue("monthly"),<br>						types.StringValue("weekly"),<br>					)</code><br><code>validator2.ScalingPolicyDayValidate()</code> | — |
| <code>effective_from</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>effective_till</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>execution_time</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("regular"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>group_id</code> | <code>int64validator.AtLeast(1)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>operate_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>						types.StringValue("regular"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>operate_unit</code> | <code>stringvalidator.OneOf(business.OperateUnits...)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>						types.StringValue("regular"),<br>						types.StringValue("period"),<br>					)</code> | — |
| <code>policy_type</code> | <code>stringvalidator.OneOf(business.ScalingPolicyTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>status</code> | <code>stringvalidator.OneOf(business.ScalingPolicyStatuses...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>target_disable_scale_in</code> | <code>validator2.AlsoRequiresEqualBool(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>target_metric_name</code> | <code>stringvalidator.OneOf(<br>						"cpu_util",<br>						"network_incoming_bytes_rate_inband",<br>						"network_outing_bytes_rate_inband",<br>					)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>target_operate_range</code> | <code>int32validator.Between(10, 20)</code><br><code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>target_scale_in_evaluation_count</code> | <code>int32validator.Between(1, 100)</code><br><code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>target_scale_out_evaluation_count</code> | <code>int32validator.Between(1, 100)</code><br><code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>target_value</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("target"),<br>					)</code> | — |
| <code>trigger_comparison_operator</code> | <code>stringvalidator.OneOf("ge", "le", "gt", "lt")</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |
| <code>trigger_evaluation_count</code> | <code>int32validator.AtLeast(1)</code><br><code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |
| <code>trigger_metric_name</code> | <code>stringvalidator.OneOf(<br>						"cpu_util",<br>						"mem_util",<br>						"network_incoming_bytes_rate_inband",<br>						"network_outing_bytes_rate_inband",<br>						"disk_read_bytes_rate",<br>						"disk_write_bytes_rate",<br>						"disk_read_requests_rate",<br>						"disk_write_requests_rate",<br>					)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |
| <code>trigger_name</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |
| <code>trigger_period</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |
| <code>trigger_statistics</code> | <code>stringvalidator.OneOf("avg", "max", "min")</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |
| <code>trigger_threshold</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("policy_type"),<br>						types.StringValue("alert"),<br>					)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 14 / 28 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>cycle</code>、<code>day</code>、<code>effective_from</code>、<code>effective_till</code>、<code>execution_time</code>、<code>is_execute</code>、<code>region_id</code>、<code>status</code>、<code>target_disable_scale_in</code>、<code>target_metric_name</code>、<code>target_operate_range</code>、<code>target_scale_in_evaluation_count</code>、<code>target_scale_out_evaluation_count</code>、<code>target_value</code>。

**examples 源文件：** [examples/resources/ctyun_scaling_policy/resource.tf](../../../examples/resources/ctyun_scaling_policy/resource.tf)；未完整展示，显式展示 14 / 28。

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
  description = "Complete configurable shape for ctyun_scaling_policy; consult constraints before use."
  nullable    = false
  type = object({
    action                            = optional(string)
    cooldown                          = optional(number)
    cycle                             = optional(string)
    day                               = optional(set(number))
    effective_from                    = optional(string)
    effective_till                    = optional(string)
    execution_time                    = optional(string)
    group_id                          = number
    is_execute                        = optional(bool)
    name                              = string
    operate_count                     = optional(number)
    operate_unit                      = optional(string)
    policy_type                       = string
    region_id                         = optional(string)
    status                            = optional(string)
    target_disable_scale_in           = optional(bool)
    target_metric_name                = optional(string)
    target_operate_range              = optional(number)
    target_scale_in_evaluation_count  = optional(number)
    target_scale_out_evaluation_count = optional(number)
    target_value                      = optional(number)
    trigger_comparison_operator       = optional(string)
    trigger_evaluation_count          = optional(number)
    trigger_metric_name               = optional(string)
    trigger_name                      = optional(string)
    trigger_period                    = optional(string)
    trigger_statistics                = optional(string)
    trigger_threshold                 = optional(number)
  })
}

resource "ctyun_scaling_policy" "example" {
  action                            = var.config.action
  cooldown                          = var.config.cooldown
  cycle                             = var.config.cycle
  day                               = var.config.day
  effective_from                    = var.config.effective_from
  effective_till                    = var.config.effective_till
  execution_time                    = var.config.execution_time
  group_id                          = var.config.group_id
  is_execute                        = var.config.is_execute
  name                              = var.config.name
  operate_count                     = var.config.operate_count
  operate_unit                      = var.config.operate_unit
  policy_type                       = var.config.policy_type
  region_id                         = var.config.region_id
  status                            = var.config.status
  target_disable_scale_in           = var.config.target_disable_scale_in
  target_metric_name                = var.config.target_metric_name
  target_operate_range              = var.config.target_operate_range
  target_scale_in_evaluation_count  = var.config.target_scale_in_evaluation_count
  target_scale_out_evaluation_count = var.config.target_scale_out_evaluation_count
  target_value                      = var.config.target_value
  trigger_comparison_operator       = var.config.trigger_comparison_operator
  trigger_evaluation_count          = var.config.trigger_evaluation_count
  trigger_metric_name               = var.config.trigger_metric_name
  trigger_name                      = var.config.trigger_name
  trigger_period                    = var.config.trigger_period
  trigger_statistics                = var.config.trigger_statistics
  trigger_threshold                 = var.config.trigger_threshold
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_scaling_policy.example.id : number
```

</details>
