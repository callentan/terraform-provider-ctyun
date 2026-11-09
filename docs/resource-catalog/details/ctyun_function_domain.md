# ctyun_function_domain

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_function_domain.tf) · [源码](../../../internal/service/faas/resource_ctyun_function_domain.go#L73) · [原文档](../../../docs/resources/function_domain.md)

**产品分类：** 函数计算（FaaS）。**用途：** 管理自定义域名。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 14 / 7；递归展开后可配置 15，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auth_jwt_jwks</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L219) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | JWK 字符串 |
| [<code>auth_type</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L215) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 认证类型 |
| [<code>cert_certificate</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L158) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 证书内容 |
| [<code>cert_name</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L150) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 证书名称 |
| [<code>cert_private_key</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L166) | <code>string</code><br><code>StringAttribute</code> | O+C | 是 | — | 私钥内容 |
| [<code>cname_check</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L113) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否检查 CNAME 配置，默认为 false |
| [<code>description</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L104) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("")</code> | 描述，长度最大为 512，支持更新 |
| [<code>domain_name</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L84) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 自定义域名。要求：由多个以点分隔的字符串组成，可包含字母、数字中划线、下划线，单个字符串不超过 63 个字符，域名总长度不超过 254 个字符 支持更新 |
| [<code>protocol</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L95) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("HTTP")</code> | 协议类型，可选值：HTTP、HTTPS。默认为 HTTP 支持更新 |
| [<code>region_id</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L138) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID，如果不填则默认使用 provider ctyun 中的 region_id 或环境变量中的 CTYUN_REGION_ID |
| [<code>route_enable_jwt</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L193) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 是否启用 JWT，0-不启用，1-启用 |
| [<code>route_function_name</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L175) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 函数名称 |
| [<code>route_methods</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L201) | <code>list(string)</code><br><code>ListAttribute</code> | O+C | 否 | — | 请求方法列表 |
| [<code>route_path</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L182) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 请求路径 |
| [<code>route_qualifier</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L189) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 函数版本 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cname_valid</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L122) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | CNAME 是否有效 |
| [<code>created_at</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L130) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间 |
| [<code>domain_status</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L126) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 域名备案状态 |
| [<code>id</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L77) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识 |
| [<code>route_function_id</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L207) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 函数 ID |
| [<code>route_function_unique_name</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L211) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 函数唯一名称 |
| [<code>updated_at</code>](../../../internal/service/faas/resource_ctyun_function_domain.go#L134) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cert_certificate</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>cert_name</code> | <code>stringvalidator.UTF8LengthAtMost(128)</code> | — |
| <code>cert_private_key</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>cname_check</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(512)</code> | — |
| <code>domain_name</code> | <code>stringvalidator.UTF8LengthBetween(1, 254)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z0-9&#93;&#91;-a-zA-Z0-9_&#93;*(\.&#91;a-zA-Z0-9&#93;&#91;-a-zA-Z0-9_&#93;*)*$`), "域名格式不正确")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf("HTTP", "HTTPS")</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>route_enable_jwt</code> | — | <code>int32planmodifier.UseStateForUnknown()</code> |
| <code>route_function_name</code> | <code>stringvalidator.UTF8LengthBetween(2, 64)</code> | — |
| <code>route_path</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 存在不支持的参数/块；同类型的 2 个有效 HCL 目标块合并后，显式展示 4 / 15 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auth_jwt_jwks</code>、<code>auth_type</code>、<code>cert_certificate</code>、<code>cert_name</code>、<code>cert_private_key</code>、<code>region_id</code>、<code>route_enable_jwt</code>、<code>route_function_name</code>、<code>route_methods</code>、<code>route_path</code>、<code>route_qualifier</code>。

**示例中的不支持参数/块：** <code>auth_config</code>、<code>cert_config</code>、<code>route_config</code>。

**examples 源文件：** [examples/resources/ctyun_function_domain/resource.tf](../../../examples/resources/ctyun_function_domain/resource.tf)；存在不支持的参数/块，显式展示 4 / 15。
不支持参数/块：<code>auth_config</code>、<code>cert_config</code>、<code>route_config</code>。

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
  description = "Complete configurable shape for ctyun_function_domain; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auth_jwt_jwks       = optional(string)
    auth_type           = optional(string)
    cert_certificate    = optional(string)
    cert_name           = optional(string)
    cert_private_key    = optional(string)
    cname_check         = optional(bool)
    description         = optional(string)
    domain_name         = string
    protocol            = optional(string)
    region_id           = optional(string)
    route_enable_jwt    = optional(number)
    route_function_name = optional(string)
    route_methods       = optional(list(string))
    route_path          = optional(string)
    route_qualifier     = optional(string)
  })
}

resource "ctyun_function_domain" "example" {
  auth_jwt_jwks       = var.config.auth_jwt_jwks
  auth_type           = var.config.auth_type
  cert_certificate    = var.config.cert_certificate
  cert_name           = var.config.cert_name
  cert_private_key    = var.config.cert_private_key
  cname_check         = var.config.cname_check
  description         = var.config.description
  domain_name         = var.config.domain_name
  protocol            = var.config.protocol
  region_id           = var.config.region_id
  route_enable_jwt    = var.config.route_enable_jwt
  route_function_name = var.config.route_function_name
  route_methods       = var.config.route_methods
  route_path          = var.config.route_path
  route_qualifier     = var.config.route_qualifier
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function_domain.example.cname_valid : bool
# ctyun_function_domain.example.created_at : string
# ctyun_function_domain.example.domain_status : string
# ctyun_function_domain.example.id : string
# ctyun_function_domain.example.route_function_id : number
# ctyun_function_domain.example.route_function_unique_name : string
# ctyun_function_domain.example.updated_at : string
```

</details>
