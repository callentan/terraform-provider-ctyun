# ctyun_ebs_backup

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ebs_backup.tf) · [源码](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L78) · [原文档](../../../docs/resources/ebs_backup.md)

**产品分类：** 云硬盘（CT-EVS，Elastic Volume Service）。**用途：** 管理云硬盘备份。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 12；递归展开后可配置 6，只读 12（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L119) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云硬盘备份描述 |
| [<code>disk_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L99) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云硬盘ID |
| [<code>full_backup</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L139) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否启用全量备份，如您是第一次备份，或者切换了存储库，则本次备份为全量备份，不受该参数影响。 |
| [<code>name</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L109) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云硬盘备份名称。满足以下规则：长度为2-63字符，头尾不支持输入空格 |
| [<code>region_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L87) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>repository_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L129) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云硬盘备份存储库ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>backup_size</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L157) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 云硬盘备份大小，单位Byte |
| [<code>backup_status</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L149) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘备份状态，该接口会返回creating状态 |
| [<code>disk_size</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L153) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 云硬盘大小，单位GB |
| [<code>disk_type</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L191) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘类型，取值范围为：SATA：普通IO。SAS：高IO。SSD：超高IO。FAST-SSD：极速型SSD。XSSD-0、XSSD-1、XSSD-2：X系列云硬盘 |
| [<code>encrypted</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L184) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 云硬盘是否加密 |
| [<code>freeze</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L177) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 备份是否冻结 |
| [<code>id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L82) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘备份ID |
| [<code>instance_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L205) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘挂载的云主机ID |
| [<code>instance_name</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L219) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘挂载的云主机名称 |
| [<code>paas</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L198) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否支持PAAS |
| [<code>project_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L212) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 企业项目ID，企业项目管理服务提供统一的云资源按企业项目管理，以及企业项目内的资源管理，成员管理。您可以通过查看创建企业项目了解如何创建企业项目。注：默认值为"0" |
| [<code>repository_name</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup.go#L223) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘备份存储库名称 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>description</code> | <code>stringvalidator.LengthAtMost(64)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>disk_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>disk_type</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>encrypted</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>freeze</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>full_backup</code> | — | <code>boolplanmodifier.RequiresReplace()</code><br><code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 63)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>paas</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>project_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>repository_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ebs_backup/resource.tf](../../../examples/resources/ctyun_ebs_backup/resource.tf)；未完整展示，显式展示 4 / 6。

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
  description = "Complete configurable shape for ctyun_ebs_backup; consult constraints before use."
  nullable    = false
  type = object({
    description   = optional(string)
    disk_id       = string
    full_backup   = optional(bool)
    name          = string
    region_id     = optional(string)
    repository_id = string
  })
}

resource "ctyun_ebs_backup" "example" {
  description   = var.config.description
  disk_id       = var.config.disk_id
  full_backup   = var.config.full_backup
  name          = var.config.name
  region_id     = var.config.region_id
  repository_id = var.config.repository_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_backup.example.backup_size : number
# ctyun_ebs_backup.example.backup_status : string
# ctyun_ebs_backup.example.disk_size : number
# ctyun_ebs_backup.example.disk_type : string
# ctyun_ebs_backup.example.encrypted : bool
# ctyun_ebs_backup.example.freeze : bool
# ctyun_ebs_backup.example.id : string
# ctyun_ebs_backup.example.instance_id : string
# ctyun_ebs_backup.example.instance_name : string
# ctyun_ebs_backup.example.paas : bool
# ctyun_ebs_backup.example.project_id : string
# ctyun_ebs_backup.example.repository_name : string
```

</details>
