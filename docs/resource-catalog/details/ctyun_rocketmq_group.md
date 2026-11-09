# ctyun_rocketmq_group

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_rocketmq_group.tf) · [源码](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L65) · [原文档](../../../docs/resources/rocketmq_group.md)

**产品分类：** 分布式消息服务RocketMQ。**用途：** 管理 RocketMQ 订阅组。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 7 / 1；递归展开后可配置 10，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>broker_names</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L169) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 关联的 Broker 节点名称列表，需填写实际部署的 Broker 节点名称，不可为空数组 |
| [<code>consume_broadcast_enable</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L113) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | 是否开启广播消费，true 表示开启广播消费，false 表示关闭广播消费，默认 true |
| [<code>consume_enable</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L107) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | 是否允许消费，true 表示允许消费，false 表示禁止消费，默认 true 支持更新 |
| [<code>first_consume_mechanism</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L122) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(1)</code> | 首次消费机制，0:从最小位点开始消费，1:从最新位点开始消费，默认 0 |
| [<code>instance_id</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L97) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | RocketMQ 实例 ID |
| [<code>name</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L74) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订阅组名称，需符合 MQ 订阅组命名规范（字母、数字、下划线组合，长度 1-64 字符），不可重复 |
| [<code>pull_mechanism</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L134) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(1)</code> | 拉取机制，0:服务器主动推送，1:客户端拉取，默认 1 |
| [<code>region_id</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L85) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID，如果不填则默认使用 provider ctyun 中的 region_id 或环境变量中的 CTYUN_REGION_ID |
| [<code>remark</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L158) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 备注信息 |
| [<code>retry_max_times</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L146) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(16)</code> | 最大重试次数，消费失败后最多重试次数，默认 16 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/rocketmq/resource_ctyun_rocketmq_group.go#L69) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订阅组 ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>broker_names</code> | — | <code>setplanmodifier.RequiresReplace()</code> |
| <code>consume_broadcast_enable</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>first_consume_mechanism</code> | <code>int32validator.OneOf(1, 2, 3)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(1, 64)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;0-9a-zA-Z_-&#93;+$`), "订阅组名称不符合规则")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>pull_mechanism</code> | <code>int32validator.OneOf(1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>remark</code> | <code>stringvalidator.LengthAtMost(256)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retry_max_times</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 10 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>consume_broadcast_enable</code>、<code>first_consume_mechanism</code>、<code>pull_mechanism</code>。

**examples 源文件：** [examples/resources/ctyun_rocketmq_group/resource.tf](../../../examples/resources/ctyun_rocketmq_group/resource.tf)；未完整展示，显式展示 7 / 10。

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
  description = "Complete configurable shape for ctyun_rocketmq_group; consult constraints before use."
  nullable    = false
  type = object({
    broker_names             = set(string)
    consume_broadcast_enable = optional(bool)
    consume_enable           = optional(bool)
    first_consume_mechanism  = optional(number)
    instance_id              = string
    name                     = string
    pull_mechanism           = optional(number)
    region_id                = optional(string)
    remark                   = optional(string)
    retry_max_times          = optional(number)
  })
}

resource "ctyun_rocketmq_group" "example" {
  broker_names             = var.config.broker_names
  consume_broadcast_enable = var.config.consume_broadcast_enable
  consume_enable           = var.config.consume_enable
  first_consume_mechanism  = var.config.first_consume_mechanism
  instance_id              = var.config.instance_id
  name                     = var.config.name
  pull_mechanism           = var.config.pull_mechanism
  region_id                = var.config.region_id
  remark                   = var.config.remark
  retry_max_times          = var.config.retry_max_times
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rocketmq_group.example.id : string
```

</details>
