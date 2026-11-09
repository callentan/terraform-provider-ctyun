# ctyun_function_trigger

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_function_trigger.tf) · [源码](../../../internal/service/faas/resource_ctyun_function_trigger.go#L61) · [原文档](../../../docs/resources/function_trigger.md)

**产品分类：** 函数计算（FaaS）。**用途：** 管理函数触发器。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 3 / 4；递归展开后可配置 7，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>enable</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L116) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | 是否启用触发器。true：启用，false：禁用 支持更新 |
| [<code>event_data</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L103) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 触发器事件配置，JSON 格式字符串。不同触发器类型配置不同。 支持更新 |
| [<code>function_name</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L72) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 函数名称 |
| [<code>region_id</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L122) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID，如果不填则默认使用 provider ctyun 中的 region_id 或环境变量中的 CTYUN_REGION_ID |
| [<code>trigger_name</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L82) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 触发器名称。只能包含字母、数字和中划线。只能字母开头，字母数字结尾。长度在 3-63 之间 |
| [<code>trigger_type</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L93) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 触发器类型。schedule: 定时触发器，http: Http 触发器 |
| [<code>version</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L110) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("LATEST")</code> | 版本或别名，版本包括 1,2,...这样的普通版本，和特殊版本 LATEST 支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>created_at</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L138) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间 |
| [<code>id</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L65) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识 |
| [<code>status</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L134) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 触发器状态。1：启用；2：禁用；3：系统禁用 |
| [<code>updated_at</code>](../../../internal/service/faas/resource_ctyun_function_trigger.go#L142) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>event_data</code> | <code>validator2.StringIsJson()</code> | — |
| <code>function_name</code> | <code>stringvalidator.UTF8LengthBetween(2, 64)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>trigger_name</code> | <code>stringvalidator.UTF8LengthBetween(3, 63)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9-&#93;*&#91;a-zA-Z0-9&#93;$"), "触发器名称必须以字母开头，字母或数字结尾，只能包含字母、数字和中划线")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>trigger_type</code> | <code>stringvalidator.OneOf("schedule", "http")</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 缺少目标资源块；同类型的 0 个有效 HCL 目标块合并后，显式展示 0 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>enable</code>、<code>event_data</code>、<code>function_name</code>、<code>region_id</code>、<code>trigger_name</code>、<code>trigger_type</code>、<code>version</code>。

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
  description = "Complete configurable shape for ctyun_function_trigger; consult constraints before use."
  nullable    = false
  type = object({
    enable        = optional(bool)
    event_data    = string
    function_name = string
    region_id     = optional(string)
    trigger_name  = string
    trigger_type  = string
    version       = optional(string)
  })
}

resource "ctyun_function_trigger" "example" {
  enable        = var.config.enable
  event_data    = var.config.event_data
  function_name = var.config.function_name
  region_id     = var.config.region_id
  trigger_name  = var.config.trigger_name
  trigger_type  = var.config.trigger_type
  version       = var.config.version
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function_trigger.example.created_at : string
# ctyun_function_trigger.example.id : string
# ctyun_function_trigger.example.status : number
# ctyun_function_trigger.example.updated_at : string
```

</details>
