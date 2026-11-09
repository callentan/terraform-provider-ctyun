# ctyun_image_from_ecs

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_image_from_ecs.tf) · [源码](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L54) · [原文档](../../../docs/resources/image_from_ecs.md)

**产品分类：** 镜像服务（CT-IMS，Image Management Service）。**用途：** 管理私有镜像（从云主机创建）。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 9 / 1；递归展开后可配置 14，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>data_disk_id</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L224) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 数据盘ID，仅数据盘创建方式必填，需挂载于指定云主机。 |
| [<code>description</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L90) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 镜像描述。长度1~128字符，不能以空格开头或结尾。 支持更新 |
| [<code>enable_image_integrity_check</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L172) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否启用镜像完整性校验，仅资源池支持时生效。 |
| [<code>image_name</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L67) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 镜像名称。长度2~32字符，仅数字、字母、-组成，不能以数字或-开头/结尾，且不与已有私有镜像重名。支持更新 |
| [<code>image_type</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L79) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 镜像类型，可选值：system_disk（系统盘镜像）、data_disk（数据盘镜像）、entire_machine（整机镜像） |
| [<code>instance_id</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L183) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机ID，系统盘、数据盘、整机创建方式必填。 |
| [<code>labels</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L129) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O | 否 | — | 标签列表。最多10个标签，标签键不可重复，键值长度1~32字符，不能换行或以空格开头/结尾。 |
| [<code>labels&#91;&#93;.label_key</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L137) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 标签键。 |
| [<code>labels&#91;&#93;.label_value</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L151) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 标签值。 |
| [<code>maximum_ram</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L209) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 最大内存限制（GiB），仅系统盘、快照创建方式支持，需≥最小内存。 支持更新 |
| [<code>minimum_ram</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L196) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 最小内存限制（GiB），仅系统盘、快照创建方式支持，取值0/1/2/4/8/16/32/64/128/256/512。支持更新 |
| [<code>project_id</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L105) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L117) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>repository_id</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L238) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云主机备份存储库ID，仅整机创建方式在非多可用区资源池时必填。 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/image/resource_ctyun_image_from_ecs.go#L59) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 私有镜像唯一标识（镜像ID） |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>data_disk_id</code> | <code>stringvalidator.LengthBetween(1, 64)</code> | <code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(1, 128)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;^\\s&#93;.*&#91;^\\s&#93;$&#124;^&#91;^\\s&#93;$`),<br>						"描述不能以空格开头或结尾。",<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>enable_image_integrity_check</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>image_name</code> | <code>stringvalidator.LengthBetween(2, 32)</code><br><code>stringvalidator.RegexMatches(<br>						regexp.MustCompile(`^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9-&#93;*&#91;a-zA-Z0-9&#93;$`),<br>						"镜像名称格式错误：需2~32字符，仅数字、字母、-组成，不以数字或-开头/结尾。",<br>					)</code> | — |
| <code>image_type</code> | <code>stringvalidator.OneOf("system_disk", "data_disk", "entire_machine")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>instance_id</code> | <code>stringvalidator.LengthBetween(1, 64)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>labels</code> | <code>setvalidator.SizeAtMost(10)</code> | <code>explanmodifier.NullIgnoreSet()</code> |
| <code>labels&#91;&#93;.label_key</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>labels&#91;&#93;.label_value</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>maximum_ram</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("image_type"),<br>						types.StringValue("system_disk"),<br>					)</code><br><code>int64validator.OneOf(0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512)</code> | — |
| <code>minimum_ram</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("image_type"),<br>						types.StringValue("system_disk"),<br>					)</code><br><code>int64validator.OneOf(0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>repository_id</code> | <code>stringvalidator.LengthBetween(1, 64)</code> | <code>explanmodifier.NullIgnoreString()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 3 个有效 HCL 目标块合并后，显式展示 12 / 14 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>、<code>repository_id</code>。

**examples 源文件：** [examples/resources/ctyun_image_from_ecs/resource.tf](../../../examples/resources/ctyun_image_from_ecs/resource.tf)；未完整展示，显式展示 12 / 14。

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
  description = "Complete configurable shape for ctyun_image_from_ecs; consult constraints before use."
  nullable    = false
  type = object({
    data_disk_id                 = optional(string)
    description                  = optional(string)
    enable_image_integrity_check = optional(bool)
    image_name                   = string
    image_type                   = string
    instance_id                  = string
    labels = optional(set(object({
      label_key   = optional(string)
      label_value = optional(string)
    })))
    maximum_ram   = optional(number)
    minimum_ram   = optional(number)
    project_id    = optional(string)
    region_id     = optional(string)
    repository_id = optional(string)
  })
}

resource "ctyun_image_from_ecs" "example" {
  data_disk_id                 = var.config.data_disk_id
  description                  = var.config.description
  enable_image_integrity_check = var.config.enable_image_integrity_check
  image_name                   = var.config.image_name
  image_type                   = var.config.image_type
  instance_id                  = var.config.instance_id
  labels                       = var.config.labels
  maximum_ram                  = var.config.maximum_ram
  minimum_ram                  = var.config.minimum_ram
  project_id                   = var.config.project_id
  region_id                    = var.config.region_id
  repository_id                = var.config.repository_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_image_from_ecs.example.id : string
```

</details>
