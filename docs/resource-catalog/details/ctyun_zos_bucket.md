# ctyun_zos_bucket

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_zos_bucket.tf) · [源码](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L76) · [原文档](../../../docs/resources/zos_bucket.md)

**产品分类：** 对象存储（CT-ZOS，Zettabyte Object Storage）。**用途：** 管理对象存储桶。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 14 / 4；递归展开后可配置 15，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>acl</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L141) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.ZosAclPrivate)</code> | 桶权限，可选值为'private'、'public-read'、'public-read-write'，分别表示私有、公共读、公共读写，默认为'private'，支持更新 |
| [<code>az_policy</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L257) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.ZosAzPolicySingle)</code> | az策略，可选值为single-az、multi-az，分别表示单az、多az，默认为single-az |
| [<code>bucket</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L118) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 桶名称，不可为空。长度3-63个字符内（含）字符只能有大小写字母、数字以及中划线（-）。禁止两个中划线（-）相邻。禁止中划线（-）作为开头或结尾。 |
| [<code>is_encrypted</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L236) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 加密状态，默认false |
| [<code>log_bucket</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L169) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 日志存储桶，当log_enabled为true时必填，可以让日志传递到拥有的任何桶（包括当前桶），支持更新 |
| [<code>log_enabled</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L163) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否启用日志转存策略，默认不启用。支持更新 |
| [<code>log_prefix</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L183) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 日志生成的目录+前缀，如log/logfile，当log_enabled为true时必填，支持更新 |
| [<code>project_id</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L106) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L94) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>retention_day</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L211) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 合规保留天数，支持1-1000，当retention_mode不为空时，retention_day与retention_year只能填写其中之一，支持更新 |
| [<code>retention_mode</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L197) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 合规保留模式，创建后不支持修改。默认为空，表示不开启合规保留，若填写，目前只支持为COMPLIANCE，且version_enabled必须为true |
| [<code>retention_year</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L220) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 合规保留年数，支持1-60，当retention_mode不为空时，retention_day与retention_year只能填写其中之一，支持更新 |
| [<code>storage_type</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L245) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.ZosStorageTypeStandard)</code> | 存储类型，可选的值STANDARD、STANDARD_IA、GLACIER，分别表示标准、低频、归档，默认STANDARD |
| [<code>tags</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L129) | <code>map(string)</code><br><code>MapAttribute</code> | O+C | 否 | — | 标签，对标aws s3中桶标签，支持更新 |
| [<code>version_enabled</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L150) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否启用版本控制，默认不启用。若启用后暂停，将无法在桶内创建新的历史版本，之前创建的历史版本会保留，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cmk_uuid</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L229) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 密钥管理服务中创建的密钥ID，当is_encrypted为true时，会自动创建密钥 |
| [<code>create_time</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L269) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L80) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>name</code>](../../../internal/service/zos/resource_ctyun_zos_bucket.go#L87) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 名称 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>acl</code> | <code>stringvalidator.OneOf(business.ZosAclPrivate, business.ZosAclPublicRead, business.ZosAclPublicReadWrite)</code> | — |
| <code>az_policy</code> | <code>stringvalidator.OneOf(business.ZosAzPolicySingle, business.ZosAzPolicyMulti)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>bucket</code> | <code>stringvalidator.LengthBetween(3, 63)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z0-9&#93;(?:&#91;a-zA-Z0-9&#93;&#124;&#91;-&#93;&#91;a-zA-Z0-9&#93;)+$"), "桶名称不符合规则")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>cmk_uuid</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>is_encrypted</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>log_bucket</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("log_enabled"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("log_enabled"),<br>						types.BoolValue(false),<br>					)</code> | — |
| <code>log_prefix</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("log_enabled"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("log_enabled"),<br>						types.BoolValue(false),<br>					)</code> | — |
| <code>name</code> | — | <code>explanmodifier.UseDependencyForUnknown(path.Root("bucket"))</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retention_day</code> | <code>int64validator.AlsoRequires(path.MatchRoot("retention_mode"))</code><br><code>int64validator.ConflictsWith(path.MatchRoot("retention_year"))</code><br><code>int64validator.Between(1, 1000)</code> | — |
| <code>retention_mode</code> | <code>stringvalidator.OneOf("COMPLIANCE")</code><br><code>stringvalidator.Any(<br>						stringvalidator.AlsoRequires(path.MatchRoot("retention_year")),<br>						stringvalidator.AlsoRequires(path.MatchRoot("retention_day")),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retention_year</code> | <code>int64validator.AlsoRequires(path.MatchRoot("retention_mode"))</code><br><code>int64validator.ConflictsWith(path.MatchRoot("retention_day"))</code><br><code>int64validator.Between(1, 60)</code> | — |
| <code>storage_type</code> | <code>stringvalidator.OneOf(business.ZosStorageTypeStandard, business.ZosStorageTypeStandardIA, business.ZosStorageTypeGlacier)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>tags</code> | <code>mapvalidator.SizeAtMost(10)</code> | <code>mapplanmodifier.UseStateForUnknown()</code> |
| <code>version_enabled</code> | <code>validator2.CrossFieldBool(<br>						path.MatchRoot("retention_mode"),<br>						&#91;&#93;any{"COMPLIANCE"},<br>						&#91;&#93;bool{true},<br>					)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 15 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_policy</code>、<code>is_encrypted</code>、<code>log_bucket</code>、<code>log_enabled</code>、<code>log_prefix</code>、<code>project_id</code>、<code>region_id</code>、<code>retention_day</code>、<code>retention_mode</code>、<code>retention_year</code>、<code>tags</code>、<code>version_enabled</code>。

**examples 源文件：** [examples/resources/ctyun_zos_bucket/resource.tf](../../../examples/resources/ctyun_zos_bucket/resource.tf)；未完整展示，显式展示 3 / 15。

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
  description = "Complete configurable shape for ctyun_zos_bucket; consult constraints before use."
  nullable    = false
  type = object({
    acl             = optional(string)
    az_policy       = optional(string)
    bucket          = string
    is_encrypted    = optional(bool)
    log_bucket      = optional(string)
    log_enabled     = optional(bool)
    log_prefix      = optional(string)
    project_id      = optional(string)
    region_id       = optional(string)
    retention_day   = optional(number)
    retention_mode  = optional(string)
    retention_year  = optional(number)
    storage_type    = optional(string)
    tags            = optional(map(string))
    version_enabled = optional(bool)
  })
}

resource "ctyun_zos_bucket" "example" {
  acl             = var.config.acl
  az_policy       = var.config.az_policy
  bucket          = var.config.bucket
  is_encrypted    = var.config.is_encrypted
  log_bucket      = var.config.log_bucket
  log_enabled     = var.config.log_enabled
  log_prefix      = var.config.log_prefix
  project_id      = var.config.project_id
  region_id       = var.config.region_id
  retention_day   = var.config.retention_day
  retention_mode  = var.config.retention_mode
  retention_year  = var.config.retention_year
  storage_type    = var.config.storage_type
  tags            = var.config.tags
  version_enabled = var.config.version_enabled
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_zos_bucket.example.cmk_uuid : string
# ctyun_zos_bucket.example.create_time : string
# ctyun_zos_bucket.example.id : string
# ctyun_zos_bucket.example.name : string
```

</details>
