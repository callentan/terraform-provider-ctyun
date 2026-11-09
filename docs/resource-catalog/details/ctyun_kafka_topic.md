# ctyun_kafka_topic

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_kafka_topic.tf) · [源码](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L110) · [原文档](../../../docs/resources/kafka_topic.md)

**产品分类：** 分布式消息服务Kafka。**用途：** 管理KAFKA的主题。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 15 / 3；递归展开后可配置 18，只读 17（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cleanup_policy</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L258) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 日志保留策略，支持delete和compact，默认delete，支持更新 |
| [<code>description</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L243) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述，规则如下：不能以+,-,@,= 特殊字符开头。长度不能大于200。支持更新 |
| [<code>factor_num</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L162) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 副本数，取值范围&#91;1, 3&#93;，单机版默认值1，集群版默认值3。 |
| [<code>instance_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L133) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例ID |
| [<code>local_retention_ms</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L307) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 本地保留时长，单位ms。取值范围&#91;180000, 315360000000&#93;，支持更新 |
| [<code>max_message</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L213) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 最大消息大小，单位字节，取值范围&#91;1, 10485760&#93;， 默认值1048588。支持更新 |
| [<code>min_replicas</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L202) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 最小同步副本数，需小于等于factor_num，单机版默认值1，集群版默认值min(2, factor_num)。支持更新 |
| [<code>name</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L119) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主题名称，英文字母、数字、下划线开头，且只能由英文字母、数字、中划线、下划线组成，长度为3-64个字符。 |
| [<code>need_flush</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L224) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否同步刷盘，默认值false，支持更新 |
| [<code>partition_capacity</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L174) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 分区容量限制，单位GB，取值-1或范围&#91;1, 100&#93;。-1表示无限制，默认值-1。支持更新 |
| [<code>partition_num</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L155) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 分区数，取值范围&#91;1, min(100, 实例剩余分区数量)&#93;，实例剩余分区数量=实例分区上限-所有主题分区数之和。支持更新 |
| [<code>region_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L143) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>remote_storage_enable</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L299) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否开启对象存储，默认false，支持更新 |
| [<code>retention_time</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L188) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 消息保留时长，单位毫秒，取值-1或范围&#91;36000, 315360000000&#93;，单位毫秒，-1表示永久保留。 默认值259200000。支持更新 |
| [<code>segment_bytes</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L288) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 分片大小，单位byte。取值范围&#91;268435456, 10737418240&#93;，默认值：1073741824，支持更新 |
| [<code>segment_ms</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L277) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 日志滚动时间，单位ms。取值范围&#91;86400000, 7776000000&#93;，默认值：259200000，支持更新 |
| [<code>timestamp_type</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L232) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 消息时间戳类型。支持CreateTime和LogAppendTime，默认值CreateTime，支持更新 |
| [<code>unclean_leader_election_enable</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L269) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否允许不同步的副本参与leader选举，默认false，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>group_subscribed</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L314) | <code>list(string)</code><br><code>ListAttribute</code> | C | 否 | — | 订阅该主题的消费组名称列表 |
| [<code>id</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L114) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识符 |
| [<code>partition_list</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L319) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | 分区详情列表 |
| [<code>partition_list&#91;&#93;.offsets</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L332) | <code>object</code><br><code>SingleNestedAttribute</code> | C | 否 | — | 分区偏移量信息 |
| [<code>partition_list&#91;&#93;.offsets.begin</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L340) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 分区leader副本的最大偏移量 |
| [<code>partition_list&#91;&#93;.offsets.end</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L344) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 分区leader副本的最小偏移量 |
| [<code>partition_list&#91;&#93;.offsets.hw</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L352) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 分区消息高水位线，所有副本均已确认写入的最大偏移量 |
| [<code>partition_list&#91;&#93;.offsets.total</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L336) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 分区消息总数 |
| [<code>partition_list&#91;&#93;.offsets.update_timestamp</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L348) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 分区最近写入消息的毫秒时间戳 |
| [<code>partition_list&#91;&#93;.partition_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L328) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 分区ID |
| [<code>partition_list&#91;&#93;.replicas</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L358) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | 副本信息 |
| [<code>partition_list&#91;&#93;.replicas&#91;&#93;.broker_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L363) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | Broker节点ID |
| [<code>partition_list&#91;&#93;.replicas&#91;&#93;.in_sync</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L371) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 副本是否处于同步状态 |
| [<code>partition_list&#91;&#93;.replicas&#91;&#93;.is_leader</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L367) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否是主副本 |
| [<code>partition_list&#91;&#93;.replicas&#91;&#93;.lag</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L379) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 该副本当前落后hw的消息数 |
| [<code>partition_list&#91;&#93;.replicas&#91;&#93;.size</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L375) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 副本消息大小，单位字节 |
| [<code>partition_list&#91;&#93;.topic_name</code>](../../../internal/service/kafka/resource_ctyun_kafka_topic.go#L324) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主题名称 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cleanup_policy</code> | <code>stringvalidator.OneOf("delete", "compact")</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 200)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;^+\-@=&#93;.*$`),<br>						"不能以+,-,@,=特殊字符开头",<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>factor_num</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.RequiresReplace()</code><br><code>int32planmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>local_retention_ms</code> | <code>int64validator.Between(180000, 315360000000)</code> | — |
| <code>max_message</code> | <code>int32validator.Between(1, 10485760)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>min_replicas</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(3, 64)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;a-zA-Z0-9_&#93;&#91;a-zA-Z0-9_.-&#93;*$`),<br>						"必须以英文字母、数字、下划线开头，只能包含英文字母、数字、句点、中划线、下划线",<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>need_flush</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>partition_capacity</code> | <code>int32validator.Any(<br>						int32validator.OneOf(-1),<br>						int32validator.Between(1, 100),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>partition_num</code> | <code>int32validator.AtLeast(1)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>remote_storage_enable</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>retention_time</code> | <code>int64validator.Any(<br>						int64validator.OneOf(-1),<br>						int64validator.Between(36000, 315360000000),<br>					)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>segment_bytes</code> | <code>int64validator.Between(268435456, 10737418240)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>segment_ms</code> | <code>int64validator.Between(86400000, 7776000000)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>timestamp_type</code> | <code>stringvalidator.OneOf("CreateTime", "LogAppendTime")</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>unclean_leader_election_enable</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 18 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>cleanup_policy</code>、<code>description</code>、<code>factor_num</code>、<code>local_retention_ms</code>、<code>max_message</code>、<code>min_replicas</code>、<code>need_flush</code>、<code>partition_capacity</code>、<code>region_id</code>、<code>remote_storage_enable</code>、<code>retention_time</code>、<code>segment_bytes</code>、<code>segment_ms</code>、<code>timestamp_type</code>、<code>unclean_leader_election_enable</code>。

**examples 源文件：** [examples/resources/ctyun_kafka_topic/resource.tf](../../../examples/resources/ctyun_kafka_topic/resource.tf)；未完整展示，显式展示 3 / 18。

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
  description = "Complete configurable shape for ctyun_kafka_topic; consult constraints before use."
  nullable    = false
  type = object({
    cleanup_policy                 = optional(string)
    description                    = optional(string)
    factor_num                     = optional(number)
    instance_id                    = string
    local_retention_ms             = optional(number)
    max_message                    = optional(number)
    min_replicas                   = optional(number)
    name                           = string
    need_flush                     = optional(bool)
    partition_capacity             = optional(number)
    partition_num                  = number
    region_id                      = optional(string)
    remote_storage_enable          = optional(bool)
    retention_time                 = optional(number)
    segment_bytes                  = optional(number)
    segment_ms                     = optional(number)
    timestamp_type                 = optional(string)
    unclean_leader_election_enable = optional(bool)
  })
}

resource "ctyun_kafka_topic" "example" {
  cleanup_policy                 = var.config.cleanup_policy
  description                    = var.config.description
  factor_num                     = var.config.factor_num
  instance_id                    = var.config.instance_id
  local_retention_ms             = var.config.local_retention_ms
  max_message                    = var.config.max_message
  min_replicas                   = var.config.min_replicas
  name                           = var.config.name
  need_flush                     = var.config.need_flush
  partition_capacity             = var.config.partition_capacity
  partition_num                  = var.config.partition_num
  region_id                      = var.config.region_id
  remote_storage_enable          = var.config.remote_storage_enable
  retention_time                 = var.config.retention_time
  segment_bytes                  = var.config.segment_bytes
  segment_ms                     = var.config.segment_ms
  timestamp_type                 = var.config.timestamp_type
  unclean_leader_election_enable = var.config.unclean_leader_election_enable
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_topic.example.group_subscribed : list(string)
# ctyun_kafka_topic.example.id : string
# ctyun_kafka_topic.example.partition_list : list(object)
# ctyun_kafka_topic.example.partition_list[*].offsets : object
# ctyun_kafka_topic.example.partition_list[*].offsets.begin : number
# ctyun_kafka_topic.example.partition_list[*].offsets.end : number
# ctyun_kafka_topic.example.partition_list[*].offsets.hw : number
# ctyun_kafka_topic.example.partition_list[*].offsets.total : number
# ctyun_kafka_topic.example.partition_list[*].offsets.update_timestamp : number
# ctyun_kafka_topic.example.partition_list[*].partition_id : number
# ctyun_kafka_topic.example.partition_list[*].replicas : list(object)
# ctyun_kafka_topic.example.partition_list[*].replicas[*].broker_id : number
# ctyun_kafka_topic.example.partition_list[*].replicas[*].in_sync : bool
# ctyun_kafka_topic.example.partition_list[*].replicas[*].is_leader : bool
# ctyun_kafka_topic.example.partition_list[*].replicas[*].lag : number
# ctyun_kafka_topic.example.partition_list[*].replicas[*].size : number
# ctyun_kafka_topic.example.partition_list[*].topic_name : string
```

</details>
