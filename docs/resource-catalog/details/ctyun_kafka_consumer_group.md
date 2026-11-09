# ctyun_kafka_consumer_group

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_kafka_consumer_group.tf) · [源码](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L71) · [原文档](../../../docs/resources/kafka_consumer_group.md)

**产品分类：** 分布式消息服务Kafka。**用途：** 管理KAFKA的消费组。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 3 / 4；递归展开后可配置 11，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L106) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述，规则如下：不能以+,-,@,= 特殊字符开头。长度不能大于200。支持更新 |
| [<code>instance_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L96) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例ID |
| [<code>name</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L82) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 消费组名称，规则如下：以英文字母、数字、下划线开头，且只能由英文字母、数字、句点、中划线、下划线组成 长度3-64。 名称不可重复 |
| [<code>region_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L121) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>reset_config</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L149) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | 重置消费点配置 |
| [<code>reset_config.partition_shift_list</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L175) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 位点重置列表，当type为3时必填 支持更新 |
| [<code>reset_config.partition_shift_list&#91;&#93;.partition</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L180) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 主题分区号 支持更新 |
| [<code>reset_config.partition_shift_list&#91;&#93;.shift_by</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L187) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 主题分区消费位点向左或向右移动的相对位置，例如当前offset是1000，当shiftBy=-10重置后offset=990，当shiftBy=10重置后offset=1010。支持更新 |
| [<code>reset_config.timestamp</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L168) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 重置时间点毫秒时间戳，type=1时必填 支持更新 |
| [<code>reset_config.topic_name</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L154) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主题名称 支持更新 |
| [<code>reset_config.type</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L161) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 类型，0：重置到latest；1：按时间重置；2：重置到earliest；3：按位点重置，此类型参数partitionShiftList为必填 支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>coordinator_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L144) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 协调器编号 |
| [<code>create_time</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L133) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L75) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | ID |
| [<code>state</code>](../../../internal/service/kafka/resource_ctyun_kafka_consumer_group.go#L140) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 消费组状态 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 200)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;^+\-@=&#93;.*$`),<br>						"不能以+,-,@,=特殊字符开头",<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(3, 64)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;a-zA-Z0-9_&#93;&#91;a-zA-Z0-9_.-&#93;*$`),<br>						"必须以英文字母、数字、下划线开头，只能包含英文字母、数字、句点、中划线、下划线",<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>reset_config.partition_shift_list&#91;&#93;.partition</code> | <code>int32validator.AtLeast(1)</code> | — |
| <code>reset_config.partition_shift_list&#91;&#93;.shift_by</code> | <code>int64validator.AtLeast(1)</code> | — |
| <code>reset_config.timestamp</code> | <code>int64validator.AtLeast(1)</code> | — |
| <code>reset_config.topic_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>reset_config.type</code> | <code>int32validator.Between(0, 3)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>、<code>reset_config</code>、<code>reset_config.partition_shift_list</code>、<code>reset_config.partition_shift_list&#91;&#93;.partition</code>、<code>reset_config.partition_shift_list&#91;&#93;.shift_by</code>、<code>reset_config.timestamp</code>、<code>reset_config.topic_name</code>、<code>reset_config.type</code>。

**examples 源文件：** [examples/resources/ctyun_kafka_consumer_group/resource.tf](../../../examples/resources/ctyun_kafka_consumer_group/resource.tf)；未完整展示，显式展示 3 / 11。

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
  description = "Complete configurable shape for ctyun_kafka_consumer_group; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    instance_id = string
    name        = string
    region_id   = optional(string)
    reset_config = optional(object({
      partition_shift_list = optional(list(object({
        partition = optional(number)
        shift_by  = optional(number)
      })))
      timestamp  = optional(number)
      topic_name = string
      type       = number
    }))
  })
}

resource "ctyun_kafka_consumer_group" "example" {
  description  = var.config.description
  instance_id  = var.config.instance_id
  name         = var.config.name
  region_id    = var.config.region_id
  reset_config = var.config.reset_config
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_consumer_group.example.coordinator_id : number
# ctyun_kafka_consumer_group.example.create_time : string
# ctyun_kafka_consumer_group.example.id : number
# ctyun_kafka_consumer_group.example.state : string
```

</details>
