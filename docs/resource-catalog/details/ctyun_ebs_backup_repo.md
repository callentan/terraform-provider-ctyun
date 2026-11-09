# ctyun_ebs_backup_repo

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ebs_backup_repo.tf) · [源码](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L69) · [原文档](../../../docs/resources/ebs_backup_repo.md)

**产品分类：** 云硬盘（CT-EVS，Elastic Volume Service）。**用途：** 管理云硬盘备份存储库。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 5 / 10；递归展开后可配置 8，只读 10（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew_status</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L136) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 是否自动续订，取值范围：0（不续费），1（自动续费）。注：按月购买，自动续订周期为1个月；按年购买，自动续订周期为1年 |
| [<code>cycle_count</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L109) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 订购时长，该参数需要与cycleType一同使用。注：最长订购周期为60个月（5年） |
| [<code>cycle_type</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L119) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年。最长订购周期为5年  |
| [<code>name</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L102) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云硬盘备份存储库名称，满足以下规则：长度为2-63字符，头尾不支持输入空格。支持更新 |
| [<code>on_demand</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L146) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 是否按需下单，取值范围：true：是，false：否，默认为false |
| [<code>project_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L90) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，企业项目管理服务提供统一的云资源按企业项目管理，以及企业项目内的资源管理，成员管理。您可以通过查看创建企业项目了解如何创建企业项目。注：默认值为"0" |
| [<code>region_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L78) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>size</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L129) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 云硬盘备份存储库容量，单位GB，取值范围：&#91;100-1024000&#93;，默认值100。支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>backup_list</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L191) | <code>list(string)</code><br><code>ListAttribute</code> | C | 否 | — | 存储库下可用的备份ID列表 |
| [<code>create_time</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L174) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L170) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>expired</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L179) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 存储库是否到期 |
| [<code>free_size</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L162) | <code>number</code><br><code>Float64Attribute</code> | C | 否 | — | 云硬盘存储库剩余大小，单位GB(废弃该字段) |
| [<code>freeze</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L183) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否冻结 |
| [<code>id</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L73) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘备份存储库id |
| [<code>paas</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L187) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否支持PAAS |
| [<code>status</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L158) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘存储库状态，expired: 已到期，active: 可用 |
| [<code>used_size</code>](../../../internal/service/ebs/resource_ctyun_ebs_backup_repo.go#L166) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 云硬盘存储库使用大小，单位Byte |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew_status</code> | <code>int64validator.OneOf(0, 1)</code> | <code>int64planmodifier.RequiresReplace()</code> |
| <code>cycle_count</code> | <code>int64validator.Between(1, 60)</code> | <code>int64planmodifier.RequiresReplace()</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypesMY...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 63)</code> | — |
| <code>on_demand</code> | <code>stringvalidator.OneOf("true", "false")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>size</code> | <code>int64validator.Between(100, 1024000)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 8 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew_status</code>、<code>on_demand</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ebs_backup_repo/resource.tf](../../../examples/resources/ctyun_ebs_backup_repo/resource.tf)；未完整展示，显式展示 4 / 8。

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
  description = "Complete configurable shape for ctyun_ebs_backup_repo; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew_status = optional(number)
    cycle_count       = number
    cycle_type        = string
    name              = string
    on_demand         = optional(string)
    project_id        = optional(string)
    region_id         = optional(string)
    size              = optional(number)
  })
}

resource "ctyun_ebs_backup_repo" "example" {
  auto_renew_status = var.config.auto_renew_status
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  name              = var.config.name
  on_demand         = var.config.on_demand
  project_id        = var.config.project_id
  region_id         = var.config.region_id
  size              = var.config.size
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_backup_repo.example.backup_list : list(string)
# ctyun_ebs_backup_repo.example.create_time : string
# ctyun_ebs_backup_repo.example.expire_time : string
# ctyun_ebs_backup_repo.example.expired : bool
# ctyun_ebs_backup_repo.example.free_size : number
# ctyun_ebs_backup_repo.example.freeze : bool
# ctyun_ebs_backup_repo.example.id : string
# ctyun_ebs_backup_repo.example.paas : bool
# ctyun_ebs_backup_repo.example.status : string
# ctyun_ebs_backup_repo.example.used_size : number
```

</details>
