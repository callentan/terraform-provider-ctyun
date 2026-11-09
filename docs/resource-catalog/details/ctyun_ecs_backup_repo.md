# ctyun_ecs_backup_repo

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ecs_backup_repo.tf) · [源码](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L75) · [原文档](../../../docs/resources/ecs_backup_repo.md)

**产品分类：** 弹性云主机（CT-ECS，Elastic Cloud Server）。**用途：** 管理云主机备份存储库。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 5 / 12；递归展开后可配置 8，只读 12（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew_status</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L172) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 是否自动续订，取值范围：0（不续费），1（自动续费）。注：按月购买，自动续订周期为1个月；按年购买，自动续订周期为1年 |
| [<code>cycle_count</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L120) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 订购时长，该参数需要与cycleType一同使用。注：最长订购周期为60个月（5年） |
| [<code>cycle_type</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L130) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年。最长订购周期为5年  |
| [<code>name</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L110) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机备份存储库名称，满足以下规则：长度为2-63字符，头尾不支持输入空格 |
| [<code>pay_voucher_price</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L180) | <code>number</code><br><code>Float64Attribute</code> | O+C | 否 | <code>float64default.StaticFloat64(0.00)</code> | 代金券，满足以下规则：两位小数，不足两位自动补0，超过两位小数无效；不可为负数；注：字段为0时表示不使用代金券，默认不使用代金券。 |
| [<code>project_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L98) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L86) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>size</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L163) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | <code>int64default.StaticInt64(100)</code> | 云主机备份存储库容量，单位GB，取值范围：&#91;100-1024000&#93;，默认值100。支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>backup_count</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L231) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 存储库中备份数量 |
| [<code>backup_list</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L235) | <code>list(string)</code><br><code>ListAttribute</code> | C | 否 | — | 存储库下可用的备份ID列表 |
| [<code>create_time</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L215) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L211) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>expired</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L219) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 存储库是否到期 |
| [<code>free_size</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L199) | <code>number</code><br><code>Float64Attribute</code> | C | 否 | — | 云主机存储库剩余大小，单位GB(废弃该字段) |
| [<code>freeze</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L223) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否冻结 |
| [<code>id</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L79) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机备份存储库id |
| [<code>paas</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L227) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否支持PAAS |
| [<code>remaining_size</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L203) | <code>number</code><br><code>Float64Attribute</code> | C | 否 | — | 云主机存储库剩余大小，单位GB |
| [<code>status</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L195) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机存储库状态，expired: 已到期，active: 可用 |
| [<code>used_size</code>](../../../internal/service/ecs/resource_ctyun_ecs_backup_repo.go#L207) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 云主机存储库使用大小，单位Byte |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew_status</code> | <code>int64validator.OneOf(0, 1)</code> | — |
| <code>cycle_count</code> | <code>int64validator.Between(1, 60)</code> | <code>int64planmodifier.RequiresReplace()</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypesMY...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 63)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>pay_voucher_price</code> | <code>float64validator.AtLeast(0.0)</code> | <code>float64planmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>size</code> | <code>int64validator.Between(100, 1024000)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 8 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew_status</code>、<code>pay_voucher_price</code>、<code>project_id</code>、<code>region_id</code>、<code>size</code>。

**examples 源文件：** [examples/resources/ctyun_ecs_backup_repo/resource.tf](../../../examples/resources/ctyun_ecs_backup_repo/resource.tf)；未完整展示，显式展示 3 / 8。

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
  description = "Complete configurable shape for ctyun_ecs_backup_repo; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew_status = optional(number)
    cycle_count       = number
    cycle_type        = string
    name              = string
    pay_voucher_price = optional(number)
    project_id        = optional(string)
    region_id         = optional(string)
    size              = optional(number)
  })
}

resource "ctyun_ecs_backup_repo" "example" {
  auto_renew_status = var.config.auto_renew_status
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  project_id        = var.config.project_id
  region_id         = var.config.region_id
  size              = var.config.size
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_backup_repo.example.backup_count : number
# ctyun_ecs_backup_repo.example.backup_list : list(string)
# ctyun_ecs_backup_repo.example.create_time : string
# ctyun_ecs_backup_repo.example.expire_time : string
# ctyun_ecs_backup_repo.example.expired : bool
# ctyun_ecs_backup_repo.example.free_size : number
# ctyun_ecs_backup_repo.example.freeze : bool
# ctyun_ecs_backup_repo.example.id : string
# ctyun_ecs_backup_repo.example.paas : bool
# ctyun_ecs_backup_repo.example.remaining_size : number
# ctyun_ecs_backup_repo.example.status : string
# ctyun_ecs_backup_repo.example.used_size : number
```

</details>
