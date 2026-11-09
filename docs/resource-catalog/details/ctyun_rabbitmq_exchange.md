# ctyun_rabbitmq_exchange

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_rabbitmq_exchange.tf) · [源码](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L64) · [原文档](../../../docs/resources/rabbitmq_exchange.md)

**产品分类：** 分布式消息服务RabbitMQ。**用途：** 管理RabbitMQ实例的交换器。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 6 / 1；递归展开后可配置 10，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>alternate_exchange</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L155) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 备用交换机名称 |
| [<code>auto_delete</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L128) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否自动删除，默认false |
| [<code>durable</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L137) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否持久化，默认false |
| [<code>instance_id</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L98) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | rabbitMq实例ID |
| [<code>internal</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L146) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否内置，默认false |
| [<code>name</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L75) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 交换器名称，只能包含字母，数字，短横线-和下划线_ |
| [<code>region_id</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L86) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>type</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L118) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 交换器类型，支持direct、topic、headers、fanout、x-delayed-message |
| [<code>vhost</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L108) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | vhost名称 |
| [<code>x_delayed_type</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L166) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 当type为x-delayed-message时必填 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/rabbitmq/resource_ctyun_rabbitmq_exchange.go#L68) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>alternate_exchange</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>auto_delete</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>durable</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>internal</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;0-9a-zA-Z_-&#93;+$"), "交换器名称不符合规则")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(business.RabbitMqExchangeTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vhost</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>x_delayed_type</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.RabbitMqExchangeTypeXDelayedMessage),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("type"),<br>						utils.StringArrayToValueArray(business.RabbitMqExchangeXDelayedTypes)...,<br>					)</code><br><code>stringvalidator.OneOf(business.RabbitMqExchangeXDelayedTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 10 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>alternate_exchange</code>、<code>auto_delete</code>、<code>durable</code>、<code>internal</code>、<code>region_id</code>、<code>x_delayed_type</code>。

**examples 源文件：** [examples/resources/ctyun_rabbitmq_exchange/resource.tf](../../../examples/resources/ctyun_rabbitmq_exchange/resource.tf)；未完整展示，显式展示 4 / 10。

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
  description = "Complete configurable shape for ctyun_rabbitmq_exchange; consult constraints before use."
  nullable    = false
  type = object({
    alternate_exchange = optional(string)
    auto_delete        = optional(bool)
    durable            = optional(bool)
    instance_id        = string
    internal           = optional(bool)
    name               = string
    region_id          = optional(string)
    type               = string
    vhost              = string
    x_delayed_type     = optional(string)
  })
}

resource "ctyun_rabbitmq_exchange" "example" {
  alternate_exchange = var.config.alternate_exchange
  auto_delete        = var.config.auto_delete
  durable            = var.config.durable
  instance_id        = var.config.instance_id
  internal           = var.config.internal
  name               = var.config.name
  region_id          = var.config.region_id
  type               = var.config.type
  vhost              = var.config.vhost
  x_delayed_type     = var.config.x_delayed_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rabbitmq_exchange.example.id : string
```

</details>
