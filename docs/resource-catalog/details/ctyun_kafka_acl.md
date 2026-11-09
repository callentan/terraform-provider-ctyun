# ctyun_kafka_acl

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_kafka_acl.tf) · [源码](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L67) · [原文档](../../../docs/resources/kafka_acl.md)

**产品分类：** 分布式消息服务Kafka。**用途：** 管理KAFKA的访问控制。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 2 / 2；递归展开后可配置 9，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>instance_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L92) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例ID |
| [<code>name</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L78) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 策略名称，规则如下：以英文字母、数字、下划线开头，且只能由英文字母、数字、句点、中划线、下划线组成。长度3-64。名称不可重复。 |
| [<code>region_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L102) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>rules</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L125) | <code>set(object)</code><br><code>SetNestedAttribute</code> | R | 否 | — | ACL规则 |
| [<code>rules&#91;&#93;.ip</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L157) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | ip或网段，多个用半角分号分开，默认*，表示所有ip |
| [<code>rules&#91;&#93;.operation</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L150) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 操作，READ:消费，WRITE:生产 |
| [<code>rules&#91;&#93;.permission</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L136) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 权限，ALLOW:允许，DENY:拒绝 |
| [<code>rules&#91;&#93;.user_name</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L143) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 用户名，必须是已经集群中创建了的用户 |
| [<code>use_new_topic</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L114) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否应用到新增主题，默认不应用，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L71) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识符 |
| [<code>topics</code>](../../../internal/service/kafka/resource_ctyun_kafka_acl.go#L120) | <code>set(string)</code><br><code>SetAttribute</code> | C | 否 | — | 匹配的topic列表 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(3, 64)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;a-zA-Z0-9_&#93;&#91;a-zA-Z0-9_.-&#93;*$`),<br>						"必须以英文字母、数字、下划线开头，只能包含英文字母、数字、句点、中划线、下划线",<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rules</code> | <code>setvalidator.SizeAtLeast(1)</code> | <code>setplanmodifier.RequiresReplace()</code> |
| <code>rules&#91;&#93;.ip</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>rules&#91;&#93;.operation</code> | <code>stringvalidator.OneOf("READ", "WRITE")</code> | — |
| <code>rules&#91;&#93;.permission</code> | <code>stringvalidator.OneOf("ALLOW", "DENY")</code> | — |
| <code>rules&#91;&#93;.user_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>、<code>rules&#91;&#93;.ip</code>。

**examples 源文件：** [examples/resources/ctyun_kafka_acl/resource.tf](../../../examples/resources/ctyun_kafka_acl/resource.tf)；未完整展示，显式展示 7 / 9。

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
  description = "Complete configurable shape for ctyun_kafka_acl; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    name        = string
    region_id   = optional(string)
    rules = set(object({
      ip         = optional(string)
      operation  = string
      permission = string
      user_name  = string
    }))
    use_new_topic = optional(bool)
  })
}

resource "ctyun_kafka_acl" "example" {
  instance_id   = var.config.instance_id
  name          = var.config.name
  region_id     = var.config.region_id
  rules         = var.config.rules
  use_new_topic = var.config.use_new_topic
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_acl.example.id : string
# ctyun_kafka_acl.example.topics : set(string)
```

</details>
