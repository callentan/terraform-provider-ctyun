# ctyun_ecs_backup_policy

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ecs_backup_policy.tf) · [源码](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L82) · [原文档](../../../docs/resources/ecs_backup_policy.md)

**产品分类：** 弹性云主机（CT-ECS，Elastic Cloud Server）。**用途：** 管理云主机备份策略。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 11 / 3；递归展开后可配置 18，只读 5（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>adv_retention</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L229) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | 高级保留策略内容，只有retentionType为num且advRetentionStatus为true才生效。支持更新 |
| [<code>adv_retention.adv_day</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L232) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 保留n天内，每天最新的一个备份，n为输入的数字。单位为天，取值范围：&#91;0, 100&#93;，默认值0 支持更新 |
| [<code>adv_retention.adv_month</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L246) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 保留n月内，每月最新的一个备份，n为输入的数字。单位为月，取值范围：&#91;0, 100&#93;，默认值0 支持更新 |
| [<code>adv_retention.adv_week</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L239) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 保留n周内，每周最新的一个备份，n为输入的数字。单位为周，取值范围：&#91;0, 100&#93;，默认值0 支持更新 |
| [<code>adv_retention.adv_year</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L253) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 保留n年内，每年最新的一个备份，n为输入的数字。单位为年，取值范围：&#91;0, 100&#93;，默认值0 支持更新 |
| [<code>adv_retention_status</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L203) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否开启高级保留策略，false（不启用），true(启用)，默认值为false。需校验云主机备份保留类型（retentionType），若保留类型为按数量保存（num），可开启高级保留策略；若保留类型为date（按时间保存）或all（永久保存），不可开启高级保留策略。支持更新 |
| [<code>cycle_day</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L135) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 备份周期（天），取值范围：&#91;1, 30&#93;，默认值为1。注：只有cycleType为day时有效。支持更新 |
| [<code>cycle_type</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L128) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机备份周期类型，取值范围：day（按天备份）week（按星期备份）。支持更新 |
| [<code>cycle_week</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L142) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 备份周期（星期），星期取值范围：0~6（代表周几，其中0为周日），默认值是0。注：只有cycleType为week时有效；如果一周有多天备份，以逗号隔开（如周日周三进行快照，则填写"0,3"）。支持更新 |
| [<code>full_backup_interval</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L192) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 是否启用周期性全量备份。-1代表不开启，默认为-1；取值范围为&#91;-1,100&#93;，即每执行n次增量备份后，执行一次全量备份；若传入为0，代表每一次均为全量备份。支持更新 |
| [<code>name</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L117) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机备份策略名称。满足以下规则：只能由数字、英文字母、中划线-、下划线_、点.组成，长度为2-64字符。注：在所有资源池不可重复。支持更新 |
| [<code>project_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L105) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，企业项目管理服务提供统一的云资源按企业项目管理，以及企业项目内的资源管理，成员管理。您可以通过查看创建企业项目了解如何创建企业项目。注：默认值为"0" |
| [<code>region_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L93) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>retention_day</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L178) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 云主机备份保留天数，单位为天，取值范围：&#91;1, 99999&#93; ，默认值1。注：只有retentionType为date时有效。支持更新 |
| [<code>retention_num</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L185) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 云主机备份保留数量，取值范围：&#91;1, 99999&#93;，默认值1。注：只有retentionType为num时有效。支持更新 |
| [<code>retention_type</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L171) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机备份保留类型，取值范围：date（按时间保存），num（按数量保存），all（永久保存）。支持更新 |
| [<code>status</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L160) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 备份策略状态，是否启用，取值范围：0（不启用），1（启用）。注：默认值0（不启用）。支持更新 |
| [<code>time</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L149) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 备份整点时间，时间取值范围：0~23。注：如果一天内多个时间节点备份，以逗号隔开（如11点15点进行快照，则填写"11,15"），默认值12 。支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L86) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机备份策略id |
| [<code>repository_list</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L213) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | 策略已绑定的云主机备份库列表 |
| [<code>repository_list&#91;&#93;.repository_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L217) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机备份库ID |
| [<code>repository_list&#91;&#93;.repository_name</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L221) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机备份库名称 |
| [<code>resource_ids</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_policy.go#L209) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 策略已绑定的云主机ID，以逗号分隔 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>adv_retention.adv_day</code> | <code>int64validator.Between(0, 100)</code> | — |
| <code>adv_retention.adv_month</code> | <code>int64validator.Between(0, 100)</code> | — |
| <code>adv_retention.adv_week</code> | <code>int64validator.Between(0, 100)</code> | — |
| <code>adv_retention.adv_year</code> | <code>int64validator.Between(0, 100)</code> | — |
| <code>cycle_day</code> | <code>int64validator.Between(1, 30)</code> | — |
| <code>cycle_type</code> | <code>stringvalidator.OneOf("day", "week")</code> | — |
| <code>cycle_week</code> | <code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;0-6&#93;(,&#91;0-6&#93;)*$`), "星期取值范围：0~6，多个星期以逗号分隔")</code> | — |
| <code>full_backup_interval</code> | <code>int32validator.Between(-1, 100)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 64)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;0-9a-zA-Z\-_\.&#93;+$`),<br>						"只能由数字、英文字母、中划线-、下划线_、点.组成",<br>					)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>planmodifier2.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retention_day</code> | <code>int64validator.Between(1, 99999)</code> | — |
| <code>retention_num</code> | <code>int64validator.Between(1, 99999)</code> | — |
| <code>retention_type</code> | <code>stringvalidator.OneOf("date", "num", "all")</code> | — |
| <code>status</code> | <code>int64validator.OneOf(0, 1)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>time</code> | <code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;0-9&#93;&#124;1&#91;0-9&#93;&#124;2&#91;0-3&#93;(,&#91;0-9&#93;&#124;1&#91;0-9&#93;&#124;2&#91;0-3&#93;)*$`), "时间取值范围：0~23，多个时间点以逗号分隔")</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 11 / 18 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>adv_retention.adv_month</code>、<code>adv_retention.adv_week</code>、<code>adv_retention.adv_year</code>、<code>cycle_day</code>、<code>project_id</code>、<code>region_id</code>、<code>retention_day</code>。

**examples 源文件：** [examples/resources/ctyun_ecs_backup_policy/resource.tf](../../../examples/resources/ctyun_ecs_backup_policy/resource.tf)；未完整展示，显式展示 11 / 18。

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
  description = "Complete configurable shape for ctyun_ecs_backup_policy; consult constraints before use."
  nullable    = false
  type = object({
    adv_retention = optional(object({
      adv_day   = optional(number)
      adv_month = optional(number)
      adv_week  = optional(number)
      adv_year  = optional(number)
    }))
    adv_retention_status = optional(bool)
    cycle_day            = optional(number)
    cycle_type           = string
    cycle_week           = optional(string)
    full_backup_interval = optional(number)
    name                 = string
    project_id           = optional(string)
    region_id            = optional(string)
    retention_day        = optional(number)
    retention_num        = optional(number)
    retention_type       = string
    status               = optional(number)
    time                 = optional(string)
  })
}

resource "ctyun_ecs_backup_policy" "example" {
  adv_retention        = var.config.adv_retention
  adv_retention_status = var.config.adv_retention_status
  cycle_day            = var.config.cycle_day
  cycle_type           = var.config.cycle_type
  cycle_week           = var.config.cycle_week
  full_backup_interval = var.config.full_backup_interval
  name                 = var.config.name
  project_id           = var.config.project_id
  region_id            = var.config.region_id
  retention_day        = var.config.retention_day
  retention_num        = var.config.retention_num
  retention_type       = var.config.retention_type
  status               = var.config.status
  time                 = var.config.time
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_backup_policy.example.id : string
# ctyun_ecs_backup_policy.example.repository_list : list(object)
# ctyun_ecs_backup_policy.example.repository_list[*].repository_id : string
# ctyun_ecs_backup_policy.example.repository_list[*].repository_name : string
# ctyun_ecs_backup_policy.example.resource_ids : string
```

</details>
