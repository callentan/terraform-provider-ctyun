# ctyun_ebs_snapshot

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ebs_snapshot.tf) · [源码](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L71) · [原文档](../../../docs/resources/ebs_snapshot.md)

**产品分类：** 云硬盘（CT-EVS，Elastic Volume Service）。**用途：** 管理云硬盘快照。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 2；递归展开后可配置 6，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>disk_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L80) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云硬盘ID |
| [<code>name</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L90) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云硬盘快照名称，长度为2-63字符，头尾不支持输入空格 |
| [<code>project_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L126) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L131) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>retention_policy</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L104) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 快照保留策略，取值范围：custom：自定义保留天数，forever：永久保留 |
| [<code>retention_time</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L114) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 自定义快照保留天数。取值范围：1-65535。当快照保留策略为custom时该参数为必填，当快照保留策略为forever时，自动设置为65535 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L75) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘快照id |
| [<code>snapshot_status</code>](../../../internal/service/ebs/resource_ctyun_ebs_snapshot.go#L100) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘快照状态： pending：创建中, available：可用， restoring：恢复中， error：错误 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>disk_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 63)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retention_policy</code> | <code>stringvalidator.OneOf("custom", "forever")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retention_time</code> | <code>int64validator.Between(1, 65535)</code> | <code>int64planmodifier.UseStateForUnknown()</code><br><code>int64planmodifier.RequiresReplaceIfConfigured()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>project_id</code>、<code>region_id</code>、<code>retention_time</code>。

**examples 源文件：** [examples/resources/ctyun_ebs_snapshot/resource.tf](../../../examples/resources/ctyun_ebs_snapshot/resource.tf)；未完整展示，显式展示 3 / 6。

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
  description = "Complete configurable shape for ctyun_ebs_snapshot; consult constraints before use."
  nullable    = false
  type = object({
    disk_id          = string
    name             = string
    project_id       = optional(string)
    region_id        = optional(string)
    retention_policy = string
    retention_time   = optional(number)
  })
}

resource "ctyun_ebs_snapshot" "example" {
  disk_id          = var.config.disk_id
  name             = var.config.name
  project_id       = var.config.project_id
  region_id        = var.config.region_id
  retention_policy = var.config.retention_policy
  retention_time   = var.config.retention_time
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_snapshot.example.id : string
# ctyun_ebs_snapshot.example.snapshot_status : string
```

</details>
