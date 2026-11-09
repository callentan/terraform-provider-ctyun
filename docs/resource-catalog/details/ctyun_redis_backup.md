# ctyun_redis_backup

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_redis_backup.tf) · [源码](../../../internal/service/redis/resource_ctyun_redis_backup.go#L57) · [原文档](../../../docs/resources/redis_backup.md)

**产品分类：** 分布式缓存服务Redis版。**用途：** 管理Redis实例的备份。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 3 / 6；递归展开后可配置 4，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>instance_id</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L68) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例ID |
| [<code>ip_type</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L127) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("privateIp")</code> | 获取备份文件下载链接的输入参数：网络类型，可选值：publicIp(公网IP)、privateIp(私网IP)，默认为privateIp 支持更新 |
| [<code>region_id</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L78) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>remark</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L90) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 备注信息，不超过128个字符 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L109) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>download_urls</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L136) | <code>map(string)</code><br><code>MapAttribute</code> | C | 否 | — | 备份文件下载链接，key为Redis节点名，value为备份文件下载URL |
| [<code>id</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L61) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识符 |
| [<code>name</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L102) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 备份名，格式为YYYYMMDDHHMMSS |
| [<code>status</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L116) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 节点状态: success(成功), processing(进行中), fail(失败) |
| [<code>type</code>](../../../internal/service/redis/resource_ctyun_redis_backup.go#L120) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 备份类型: 0(手动备份), 1(自动备份) |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>ip_type</code> | <code>stringvalidator.OneOf("publicIp", "privateIp")</code> | — |
| <code>name</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>remark</code> | <code>stringvalidator.LengthAtMost(128)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>type</code> | — | <code>int32planmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 1 / 4 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>ip_type</code>、<code>region_id</code>、<code>remark</code>。

**examples 源文件：** [examples/resources/ctyun_redis_backup/resource.tf](../../../examples/resources/ctyun_redis_backup/resource.tf)；未完整展示，显式展示 1 / 4。

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
  description = "Complete configurable shape for ctyun_redis_backup; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    ip_type     = optional(string)
    region_id   = optional(string)
    remark      = optional(string)
  })
}

resource "ctyun_redis_backup" "example" {
  instance_id = var.config.instance_id
  ip_type     = var.config.ip_type
  region_id   = var.config.region_id
  remark      = var.config.remark
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_backup.example.create_time : string
# ctyun_redis_backup.example.download_urls : map(string)
# ctyun_redis_backup.example.id : string
# ctyun_redis_backup.example.name : string
# ctyun_redis_backup.example.status : string
# ctyun_redis_backup.example.type : number
```

</details>
