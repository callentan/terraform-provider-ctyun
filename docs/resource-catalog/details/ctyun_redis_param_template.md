# ctyun_redis_param_template

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_redis_param_template.tf) · [源码](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L70) · [原文档](../../../docs/resources/redis_param_template.md)

**产品分类：** 分布式缓存服务Redis版。**用途：** 管理Redis参数模板。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 4 / 2；递归展开后可配置 8，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cache_mode</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L111) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 适合的实例架构版本 ORIGINAL_67：Redis 6.0/7.0类型 ORIGINAL_5：Redis 5.0类型 CLASSIC：经典版 |
| [<code>description</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L100) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 参数模板描述 支持更新 |
| [<code>name</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L93) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 参数模板名称 支持更新 |
| [<code>params</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L126) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O | 否 | — | 输入的参数列表 |
| [<code>params&#91;&#93;.current_value</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L138) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 目标值 |
| [<code>params&#91;&#93;.param_name</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L131) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 参数名称 |
| [<code>region_id</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L81) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>sys_template</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L121) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否为系统模板<br>已弃用：废弃字段，请不要指定 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L74) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 模板ID |
| [<code>params_return</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L148) | <code>set(object)</code><br><code>SetNestedAttribute</code> | C | 否 | — | 返回的参数列表 |
| [<code>params_return&#91;&#93;.current_value</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L164) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 当前值 |
| [<code>params_return&#91;&#93;.default_value</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L172) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 默认值 |
| [<code>params_return&#91;&#93;.description</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L160) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 参数描述 |
| [<code>params_return&#91;&#93;.need_restart</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L176) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否需要重启 |
| [<code>params_return&#91;&#93;.param_name</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L156) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 参数名称 |
| [<code>params_return&#91;&#93;.value_range</code>](../../../internal/service/redis/resource_ctyun_redis_param_template.go#L168) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 参数范围 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cache_mode</code> | <code>stringvalidator.OneOf("ORIGINAL_67", "ORIGINAL_5", "CLASSIC")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>params&#91;&#93;.current_value</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>params&#91;&#93;.param_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>params_return</code> | — | <code>explanmodifier.UseSetStateIfDependencyUnchanged(path.Root("params"))</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 8 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_redis_param_template/resource.tf](../../../examples/resources/ctyun_redis_param_template/resource.tf)；未完整展示，显式展示 7 / 8。

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
  description = "Complete configurable shape for ctyun_redis_param_template; consult constraints before use."
  nullable    = false
  type = object({
    cache_mode  = string
    description = optional(string)
    name        = string
    params = optional(set(object({
      current_value = string
      param_name    = string
    })))
    region_id    = optional(string)
    sys_template = optional(bool)
  })
}

resource "ctyun_redis_param_template" "example" {
  cache_mode   = var.config.cache_mode
  description  = var.config.description
  name         = var.config.name
  params       = var.config.params
  region_id    = var.config.region_id
  sys_template = var.config.sys_template
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_param_template.example.id : string
# ctyun_redis_param_template.example.params_return : set(object)
# ctyun_redis_param_template.example.params_return[*].current_value : string
# ctyun_redis_param_template.example.params_return[*].default_value : string
# ctyun_redis_param_template.example.params_return[*].description : string
# ctyun_redis_param_template.example.params_return[*].need_restart : bool
# ctyun_redis_param_template.example.params_return[*].param_name : string
# ctyun_redis_param_template.example.params_return[*].value_range : string
```

</details>
