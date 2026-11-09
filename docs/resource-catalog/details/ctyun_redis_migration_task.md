# ctyun_redis_migration_task

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_redis_migration_task.tf) · [源码](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L64) · [原文档](../../../docs/resources/redis_migration_task.md)

**产品分类：** 分布式缓存服务Redis版。**用途：** 管理Redis迁移任务。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 4 / 4；递归展开后可配置 16，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>conflict_mode</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L98) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 数据冲突时的处理办法 1：中断迁移 2：跳过目标key，继续执行 3：覆盖目标key，继续执行 |
| [<code>operate_type</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L116) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 操作类型，可选值：2：结束运行中的任务，3：删除成功或者失败的任务记录 支持更新 |
| [<code>region_id</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L75) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>source_db_info</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L134) | <code>object</code><br><code>SingleNestedAttribute</code> | R | 否 | — | 源数据库信息 |
| [<code>source_db_info.account_name</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L160) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("")</code> | 数据库账号 |
| [<code>source_db_info.ip_addr</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L146) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 连接地址，创建时必填，导入时不填 |
| [<code>source_db_info.original_cluster</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L156) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否是原生cluster集群 |
| [<code>source_db_info.password</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L169) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 数据库密码，创建时必填，导入时不填 |
| [<code>source_db_info.spu_inst_id</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L136) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例ID |
| [<code>sync_mode</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L87) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 同步模式 1：全量同步+增量同步 2：全量同步 |
| [<code>target_db_info</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L184) | <code>object</code><br><code>SingleNestedAttribute</code> | R | 否 | — | 目标数据库信息 |
| [<code>target_db_info.account_name</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L210) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("")</code> | 数据库账号 |
| [<code>target_db_info.ip_addr</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L196) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 连接地址，创建时必填，导入时不填 |
| [<code>target_db_info.original_cluster</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L206) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否是原生cluster集群 |
| [<code>target_db_info.password</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L219) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 数据库密码，创建时必填，导入时不填 |
| [<code>target_db_info.spu_inst_id</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L186) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>complete_time</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L130) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 结束时间（秒，-1表示时间未知） |
| [<code>create_time</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L123) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间(秒) |
| [<code>id</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L68) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 任务ID |
| [<code>status</code>](../../../internal/service/redis/resource_ctyun_redis_migration_task.go#L109) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 任务状态 0：初始态 1：运行中 2：成功 3：失败 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>conflict_mode</code> | <code>int32validator.OneOf(1, 2, 3)</code> | <code>int32planmodifier.RequiresReplaceIfConfigured()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>operate_type</code> | <code>int32validator.OneOf(2, 3)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>source_db_info.account_name</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>source_db_info.ip_addr</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>source_db_info.password</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>source_db_info.spu_inst_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>status</code> | <code>int32validator.OneOf(0, 1, 2, 3)</code> | — |
| <code>sync_mode</code> | <code>int32validator.OneOf(1, 2)</code> | <code>int32planmodifier.RequiresReplaceIfConfigured()</code> |
| <code>target_db_info.account_name</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>target_db_info.ip_addr</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>target_db_info.password</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>target_db_info.spu_inst_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 12 / 16 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>operate_type</code>、<code>region_id</code>、<code>source_db_info.original_cluster</code>、<code>target_db_info.original_cluster</code>。

**examples 源文件：** [examples/resources/ctyun_redis_migration_task/resource.tf](../../../examples/resources/ctyun_redis_migration_task/resource.tf)；未完整展示，显式展示 12 / 16。

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
  description = "Complete configurable shape for ctyun_redis_migration_task; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    conflict_mode = optional(number)
    operate_type  = optional(number)
    region_id     = optional(string)
    source_db_info = object({
      account_name     = optional(string)
      ip_addr          = optional(string)
      original_cluster = optional(bool)
      password         = optional(string)
      spu_inst_id      = string
    })
    sync_mode = optional(number)
    target_db_info = object({
      account_name     = optional(string)
      ip_addr          = optional(string)
      original_cluster = optional(bool)
      password         = optional(string)
      spu_inst_id      = string
    })
  })
}

resource "ctyun_redis_migration_task" "example" {
  conflict_mode  = var.config.conflict_mode
  operate_type   = var.config.operate_type
  region_id      = var.config.region_id
  source_db_info = var.config.source_db_info
  sync_mode      = var.config.sync_mode
  target_db_info = var.config.target_db_info
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_migration_task.example.complete_time : string
# ctyun_redis_migration_task.example.create_time : string
# ctyun_redis_migration_task.example.id : string
# ctyun_redis_migration_task.example.status : number
```

</details>
