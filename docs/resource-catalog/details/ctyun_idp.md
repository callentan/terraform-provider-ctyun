# ctyun_idp

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_idp.tf) · [源码](../../../internal/service/iam/resource_ctyun_idp.go#L39) · [原文档](../../../docs/resources/idp.md)

**产品分类：** 统一身份认证（Identity and Access Management，简称IAM）。**用途：** 管理身份认证信息。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 2；递归展开后可配置 6，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/iam/resource_ctyun_idp.go#L100) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 描述，支持更新 |
| [<code>file</code>](../../../internal/service/iam/resource_ctyun_idp.go#L51) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 联邦登录文件，支持更新 |
| [<code>file_name</code>](../../../internal/service/iam/resource_ctyun_idp.go#L58) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 文件名称（需携带后缀），支持更新 |
| [<code>name</code>](../../../internal/service/iam/resource_ctyun_idp.go#L66) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 身份提供商名称 |
| [<code>protocol</code>](../../../internal/service/iam/resource_ctyun_idp.go#L88) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.IdpProtocolSaml)</code> | 协议类型，saml：SAML协议，oidc：OIDC协议，不填默认为SAML协议 |
| [<code>type</code>](../../../internal/service/iam/resource_ctyun_idp.go#L76) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.IdpTypeIam)</code> | 类型，virtual：虚拟用户SSO，iam：IAM用户SSO |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>account_id</code>](../../../internal/service/iam/resource_ctyun_idp.go#L47) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 账号id |
| [<code>id</code>](../../../internal/service/iam/resource_ctyun_idp.go#L43) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>description</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>file</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>file_name</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^.+\..+$`), "文件名需要携带后缀")</code> | — |
| <code>name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.IdpProtocols...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(business.IdpTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 1 个有效 HCL 目标块合并后，显式展示 6 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_idp/resource.tf](../../../examples/resources/ctyun_idp/resource.tf)；字段展示完整，显式展示 6 / 6。

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
  description = "Complete configurable shape for ctyun_idp; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    file        = string
    file_name   = string
    name        = string
    protocol    = optional(string)
    type        = optional(string)
  })
}

resource "ctyun_idp" "example" {
  description = var.config.description
  file        = var.config.file
  file_name   = var.config.file_name
  name        = var.config.name
  protocol    = var.config.protocol
  type        = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_idp.example.account_id : string
# ctyun_idp.example.id : number
```

</details>
