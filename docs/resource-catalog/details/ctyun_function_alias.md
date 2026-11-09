# ctyun_function_alias

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_function_alias.tf) · [源码](../../../internal/service/faas/resource_ctyun_function_alias.go#L61) · [原文档](../../../docs/resources/function_alias.md)

**产品分类：** 函数计算（FaaS）。**用途：** 管理函数别名。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 4 / 2；递归展开后可配置 7，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>alias_name</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L82) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 别名名称。只能包含字母、数字和中划线。只能字母开头，字母数字结尾。长度在 2~44 之间 |
| [<code>description</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L100) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 关于别名的描述 支持更新 |
| [<code>function_name</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L72) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 函数名称，函数必须存在 |
| [<code>gray_version_id</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L119) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 灰度版本 ID 支持更新 |
| [<code>gray_weight</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L131) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 切流的比例。假设值为 5%，函数计算会将 5% 的流量到打到灰度版本，95% 的流量打到主版本。范围是 &#91;0-100&#93; 支持更新 |
| [<code>region_id</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L143) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID，如果不填则默认使用 provider ctyun 中的 region_id 或环境变量中的 CTYUN_REGION_ID |
| [<code>version_id</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L93) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主版本 ID 支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L155) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间 |
| [<code>id</code>](../../../internal/service/faas/resource_ctyun_function_alias.go#L65) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>alias_name</code> | <code>stringvalidator.UTF8LengthBetween(2, 44)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9-&#93;*&#91;a-zA-Z0-9&#93;$&#124;^&#91;a-zA-Z&#93;$`), "别名必须以字母开头，只能包含字母、数字和中划线")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(512)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>function_name</code> | <code>stringvalidator.UTF8LengthBetween(2, 64)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>gray_version_id</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>validators.AlsoRequiresEqualString(path.MatchRoot("gray_weight"))</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>gray_weight</code> | <code>int32validator.Between(0, 100)</code><br><code>validators.AlsoRequiresEqualInt32(path.MatchRoot("gray_version_id"))</code> | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>version_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 存在不支持的参数/块；同类型的 2 个有效 HCL 目标块合并后，显式展示 6 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**示例中的不支持参数/块：** <code>gray_type</code>。

**examples 源文件：** [examples/resources/ctyun_function_alias/resource.tf](../../../examples/resources/ctyun_function_alias/resource.tf)；存在不支持的参数/块，显式展示 6 / 7。
不支持参数/块：<code>gray_type</code>。

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
  description = "Complete configurable shape for ctyun_function_alias; consult constraints before use."
  nullable    = false
  type = object({
    alias_name      = string
    description     = optional(string)
    function_name   = string
    gray_version_id = optional(string)
    gray_weight     = optional(number)
    region_id       = optional(string)
    version_id      = string
  })
}

resource "ctyun_function_alias" "example" {
  alias_name      = var.config.alias_name
  description     = var.config.description
  function_name   = var.config.function_name
  gray_version_id = var.config.gray_version_id
  gray_weight     = var.config.gray_weight
  region_id       = var.config.region_id
  version_id      = var.config.version_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function_alias.example.create_time : string
# ctyun_function_alias.example.id : string
```

</details>
