# ctyun_iam_policy

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_iam_policy.tf) · [源码](../../../internal/service/iam/resource_ctyun_iam_policy.go#L45) · [原文档](../../../docs/resources/iam_policy.md)

**产品分类：** 统一身份认证（Identity and Access Management，简称IAM）。**用途：** 管理权限策略。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 2 / 1；递归展开后可配置 9，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>content</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L78) | <code>object</code><br><code>SingleNestedAttribute</code> | R | 否 | — | 权限控制的对象 |
| [<code>content.statement</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L94) | <code>set(object)</code><br><code>SetNestedAttribute</code> | R | 否 | — | 权限控制的对象信息，必填，且数量至少为1 |
| [<code>content.statement&#91;&#93;.action</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L99) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 对应权限点的code，必填，项目至少为1个，详见ctyun_iam_authorities中的code属性，支持更新 |
| [<code>content.statement&#91;&#93;.effect</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L108) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 对应的权限策略动作，allow：允许，deny：拒绝，支持更新 |
| [<code>content.statement&#91;&#93;.resource</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L115) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | <code>setdefault.StaticValue(types.SetValueMust(basetypes.StringType{}, &#91;&#93;attr.Value{types.StringValue("*")}))</code> | 资源池级别的维度，当权限点为资源池级别时候才生效，不填默认写*，支持更新 |
| [<code>content.version</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L82) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("1.1")</code> | 权限控制的版本号，目前只支持为1.1 |
| [<code>description</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L70) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 策略描述，长度最大为128，支持更新 |
| [<code>name</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L54) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 策略的名称，长度最大为64，支持更新 |
| [<code>range</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L61) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.PolicyRangeGlobal)</code> | 策略范围，region：资源池级别，global：全局级别，默认为全局级别global，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/iam/resource_ctyun_iam_policy.go#L49) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 策略ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>content.statement</code> | <code>setvalidator.SizeAtLeast(1)</code> | — |
| <code>content.statement&#91;&#93;.action</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(stringvalidator.UTF8LengthAtMost(128))</code> | — |
| <code>content.statement&#91;&#93;.effect</code> | <code>stringvalidator.OneOf(business.PolicyEffects...)</code> | — |
| <code>content.statement&#91;&#93;.resource</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(stringvalidator.UTF8LengthAtLeast(1))</code> | — |
| <code>content.version</code> | <code>stringvalidator.OneOf("1.1")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(128)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthAtMost(64)</code> | — |
| <code>range</code> | <code>stringvalidator.OneOf(business.PolicyRanges...)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 1 个有效 HCL 目标块合并后，显式展示 9 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_iam_policy/resource.tf](../../../examples/resources/ctyun_iam_policy/resource.tf)；字段展示完整，显式展示 9 / 9。

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
  description = "Complete configurable shape for ctyun_iam_policy; consult constraints before use."
  nullable    = false
  type = object({
    content = object({
      statement = set(object({
        action   = set(string)
        effect   = string
        resource = optional(set(string))
      }))
      version = optional(string)
    })
    description = optional(string)
    name        = string
    range       = optional(string)
  })
}

resource "ctyun_iam_policy" "example" {
  content     = var.config.content
  description = var.config.description
  name        = var.config.name
  range       = var.config.range
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_iam_policy.example.id : string
```

</details>
