# ctyun_elb_certificate

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_certificate.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L86) · [原文档](../../../docs/resources/elb_certificate.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡访问证书。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 4 / 4；递归展开后可配置 7，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>certificate</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L149) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | type为Server 该字段表示服务器证书公钥Pem内容;type为Ca 该字段表示Ca证书Pem内容 |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L110) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·！@#￥%……&amp;*（） —— -+={}\&#124;《》？：“”【】、；‘'，。、，不能以 http: / https: 开头，长度 0 - 128，支持更新 |
| [<code>name</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L102) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 证书名称。支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32，支持更新 |
| [<code>private_key</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L132) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 服务器证书私钥，type=Server服务器证书此字段必填 |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L181) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L90) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID |
| [<code>type</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L122) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 证书类型。取值范围：Server（服务器证书）、Ca（Ca证书） |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L170) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L159) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 证书ID |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L166) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 状态: ACTIVE / INACTIVE |
| [<code>update_time</code>](../../../internal/service/elb/resource_ctyun_elb_certificate.go#L177) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>certificate</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 128)</code><br><code>validator2.Desc()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 32)</code><br><code>validator2.AclName()</code> | — |
| <code>private_key</code> | <code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.CertificateTypeCA),<br>					)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(business.CertificateTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_elb_certificate/resource.tf](../../../examples/resources/ctyun_elb_certificate/resource.tf)；未完整展示，显式展示 4 / 7。

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
  description = "Complete configurable shape for ctyun_elb_certificate; consult constraints before use."
  nullable    = false
  type = object({
    certificate = string
    description = optional(string)
    name        = string
    private_key = optional(string)
    project_id  = optional(string)
    region_id   = optional(string)
    type        = string
  })
}

resource "ctyun_elb_certificate" "example" {
  certificate = var.config.certificate
  description = var.config.description
  name        = var.config.name
  private_key = var.config.private_key
  project_id  = var.config.project_id
  region_id   = var.config.region_id
  type        = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_certificate.example.create_time : string
# ctyun_elb_certificate.example.id : string
# ctyun_elb_certificate.example.status : string
# ctyun_elb_certificate.example.update_time : string
```

</details>
