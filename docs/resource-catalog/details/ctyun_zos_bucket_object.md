# ctyun_zos_bucket_object

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_zos_bucket_object.tf) · [源码](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L71) · [原文档](../../../docs/resources/zos_bucket_object.md)

**产品分类：** 对象存储（CT-ZOS，Zettabyte Object Storage）。**用途：** 管理对象存储的对象。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 9 / 4；递归展开后可配置 11，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>acl</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L140) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.ZosAclPrivate)</code> | 权限，可选值为'private'、'public-read'、'public-read-write'，分别表示私有、公共读、公共读写，默认为'private'，支持更新 |
| [<code>bucket</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L95) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 桶名称 |
| [<code>cache_control</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L149) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 指定缓存行为，对应S3协议Header中的Cache-Control |
| [<code>content</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L128) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 内容，和source有且只能有一个 |
| [<code>content_encoding</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L168) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 指定已对该对象应用哪些内容编码方式，对应S3协议Header中的Content-Encoding |
| [<code>content_type</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L180) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述对象类型，对应S3协议Header中的Content-Type |
| [<code>key</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L106) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 对象名称，长度1-1024 |
| [<code>region_id</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L83) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>source</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L116) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 文件路径，和content有且只能有一个 |
| [<code>storage_type</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L192) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 存储类型，可选的值STANDARD、STANDARD_IA、GLACIER，分别表示标准、低频、归档，默认使用桶的storage_type |
| [<code>tags</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L204) | <code>map(string)</code><br><code>MapAttribute</code> | O+C | 否 | — | 标签，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>content_disposition</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L161) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 该对象的表示性信息，对应S3协议Header中的Content-Disposition |
| [<code>etag</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L216) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 该对象生成的实体标签（ETag）（即该对象内容的 MD5 哈希值） |
| [<code>id</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L75) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>version_id</code>](../../../internal/service/zos/resource_ctyun_zos_bucket_object.go#L223) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对象版本号 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>acl</code> | <code>stringvalidator.OneOf(business.ZosAclPrivate, business.ZosAclPublicRead, business.ZosAclPublicReadWrite)</code> | — |
| <code>bucket</code> | <code>stringvalidator.LengthBetween(3, 63)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z0-9&#93;(?:&#91;a-zA-Z0-9&#93;&#124;&#91;-&#93;&#91;a-zA-Z0-9&#93;)+$"), "桶名称不符合规则")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>cache_control</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>content</code> | <code>stringvalidator.ConflictsWith(path.Expressions{<br>						path.MatchRoot("source"),<br>					}...)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>content_disposition</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>content_encoding</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>content_type</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>etag</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>key</code> | <code>stringvalidator.LengthBetween(1, 1024)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>source</code> | <code>stringvalidator.ConflictsWith(path.Expressions{<br>						path.MatchRoot("content"),<br>					}...)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>storage_type</code> | <code>stringvalidator.OneOf(business.ZosStorageTypeStandard, business.ZosStorageTypeStandardIA, business.ZosStorageTypeGlacier)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>tags</code> | <code>mapvalidator.SizeAtMost(10)</code> | <code>mapplanmodifier.UseStateForUnknown()</code> |
| <code>version_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>acl</code>、<code>cache_control</code>、<code>content_encoding</code>、<code>content_type</code>、<code>region_id</code>、<code>source</code>、<code>storage_type</code>、<code>tags</code>。

**examples 源文件：** [examples/resources/ctyun_zos_bucket_object/resource.tf](../../../examples/resources/ctyun_zos_bucket_object/resource.tf)；未完整展示，显式展示 3 / 11。

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
  description = "Complete configurable shape for ctyun_zos_bucket_object; consult constraints before use."
  nullable    = false
  type = object({
    acl              = optional(string)
    bucket           = string
    cache_control    = optional(string)
    content          = optional(string)
    content_encoding = optional(string)
    content_type     = optional(string)
    key              = string
    region_id        = optional(string)
    source           = optional(string)
    storage_type     = optional(string)
    tags             = optional(map(string))
  })
}

resource "ctyun_zos_bucket_object" "example" {
  acl              = var.config.acl
  bucket           = var.config.bucket
  cache_control    = var.config.cache_control
  content          = var.config.content
  content_encoding = var.config.content_encoding
  content_type     = var.config.content_type
  key              = var.config.key
  region_id        = var.config.region_id
  source           = var.config.source
  storage_type     = var.config.storage_type
  tags             = var.config.tags
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_zos_bucket_object.example.content_disposition : string
# ctyun_zos_bucket_object.example.etag : string
# ctyun_zos_bucket_object.example.id : string
# ctyun_zos_bucket_object.example.version_id : string
```

</details>
