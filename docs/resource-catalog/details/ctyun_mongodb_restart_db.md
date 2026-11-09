# ctyun_mongodb_restart_db

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mongodb_restart_db.tf) · [源码](../../../internal/service/mongodb/resource_ctyun_mongodb_restart_db.go#L47) · [原文档](../../../docs/resources/mongodb_restart_db.md)

**产品分类：** 文档数据库服务（MongoDB）。**用途：** 重启MongoDB实例。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 2 / 1；递归展开后可配置 3，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>instance_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_restart_db.go#L58) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | MongoDB实例ID |
| [<code>project_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_restart_db.go#L80) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_restart_db.go#L68) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_restart_db.go#L51) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识，格式为 instance_id:ip_RestartDb_name |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 1 / 3 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_mongodb_restart_db/resource.tf](../../../examples/resources/ctyun_mongodb_restart_db/resource.tf)；未完整展示，显式展示 1 / 3。

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
  description = "Complete configurable shape for ctyun_mongodb_restart_db; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    project_id  = optional(string)
    region_id   = optional(string)
  })
}

resource "ctyun_mongodb_restart_db" "example" {
  instance_id = var.config.instance_id
  project_id  = var.config.project_id
  region_id   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mongodb_restart_db.example.id : string
```

</details>
