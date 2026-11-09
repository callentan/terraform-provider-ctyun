# ctyun_rabbitmq_queue

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_rabbitmq_queue.tf) · [源码](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L69) · [原文档](../../../docs/resources/rabbitmq_queue.md)

**产品分类：** 分布式消息服务RabbitMQ。**用途：** 管理RabbitMQ实例的队列。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 12 / 1；递归展开后可配置 15，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_delete</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L113) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否自动删除，默认false |
| [<code>durable</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L122) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否持久化，默认false |
| [<code>instance_id</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L103) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | rabbitMq实例ID |
| [<code>name</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L80) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 队列名称 |
| [<code>region_id</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L91) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>vhost</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L131) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | vhost名称 |
| [<code>x_dead_letter_exchange</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L160) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 死信交换器名称。消息被拒绝或过期时将重新发布到该交换器 |
| [<code>x_dead_letter_routing_key</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L170) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 死信路由键。死信交换器会发送死信消息到绑定对应路由键的队列上 |
| [<code>x_expires</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L150) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 队列过期时间，过期后队列自动删除，单位为ms |
| [<code>x_max_length</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L190) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 队列最大消息长度 |
| [<code>x_max_length_bytes</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L200) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 队列消息的总字节数上限 |
| [<code>x_max_priority</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L220) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 队列最大优先级，范围为0~255，默认0 |
| [<code>x_message_ttl</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L180) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 消息过期时间，发布到队列的消息在被丢弃之前可以存活的时间，单位为ms |
| [<code>x_overflow</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L210) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 队列消息处理策略。可选值：drop-head（默认，丢弃最早消息）、reject-publish（拒绝接收新消息） |
| [<code>x_queue_mode</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L230) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 队列模式。可选值：default（默认模式）、lazy（惰性模式） |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_queue.go#L73) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_delete</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>durable</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;0-9a-zA-Z_-&#93;+$"), "队列名称不符合规则")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vhost</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>x_dead_letter_exchange</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>x_dead_letter_routing_key</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>x_expires</code> | <code>int64validator.AtLeast(1)</code> | <code>planmodifier2.NullIgnoreInt64()</code> |
| <code>x_max_length</code> | <code>int64validator.AtLeast(1)</code> | <code>planmodifier2.NullIgnoreInt64()</code> |
| <code>x_max_length_bytes</code> | <code>int64validator.AtLeast(1)</code> | <code>planmodifier2.NullIgnoreInt64()</code> |
| <code>x_max_priority</code> | <code>int64validator.Between(0, 255)</code> | <code>planmodifier2.NullIgnoreInt64()</code> |
| <code>x_message_ttl</code> | <code>int64validator.AtLeast(1)</code> | <code>planmodifier2.NullIgnoreInt64()</code> |
| <code>x_overflow</code> | <code>stringvalidator.OneOf("drop-head", "reject-publish")</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>x_queue_mode</code> | <code>stringvalidator.OneOf("default", "lazy")</code> | <code>planmodifier2.NullIgnoreString()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 12 / 15 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>、<code>x_dead_letter_exchange</code>、<code>x_max_length_bytes</code>。

**examples 源文件：** [examples/resources/ctyun_rabbitmq_queue/resource.tf](../../../examples/resources/ctyun_rabbitmq_queue/resource.tf)；未完整展示，显式展示 12 / 15。

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
  description = "Complete configurable shape for ctyun_rabbitmq_queue; consult constraints before use."
  nullable    = false
  type = object({
    auto_delete               = optional(bool)
    durable                   = optional(bool)
    instance_id               = string
    name                      = string
    region_id                 = optional(string)
    vhost                     = string
    x_dead_letter_exchange    = optional(string)
    x_dead_letter_routing_key = optional(string)
    x_expires                 = optional(number)
    x_max_length              = optional(number)
    x_max_length_bytes        = optional(number)
    x_max_priority            = optional(number)
    x_message_ttl             = optional(number)
    x_overflow                = optional(string)
    x_queue_mode              = optional(string)
  })
}

resource "ctyun_rabbitmq_queue" "example" {
  auto_delete               = var.config.auto_delete
  durable                   = var.config.durable
  instance_id               = var.config.instance_id
  name                      = var.config.name
  region_id                 = var.config.region_id
  vhost                     = var.config.vhost
  x_dead_letter_exchange    = var.config.x_dead_letter_exchange
  x_dead_letter_routing_key = var.config.x_dead_letter_routing_key
  x_expires                 = var.config.x_expires
  x_max_length              = var.config.x_max_length
  x_max_length_bytes        = var.config.x_max_length_bytes
  x_max_priority            = var.config.x_max_priority
  x_message_ttl             = var.config.x_message_ttl
  x_overflow                = var.config.x_overflow
  x_queue_mode              = var.config.x_queue_mode
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rabbitmq_queue.example.id : string
```

</details>
