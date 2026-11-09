# ctyun_ecs_data_volume

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ecs_data_volume.tf) · [源码](../../../internal/service/ecs/resource_ctyun_ecs_data_volume.go#L50) · [原文档](../../../docs/resources/ecs_data_volume.md)

**产品分类：** 弹性云主机（CT-ECS，Elastic Cloud Server）。**用途：** 配置云主机挂载的云硬盘，支持多块盘。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 1 / 1；递归展开后可配置 3，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>ebs_ids</code>](../../../internal/service/ecs/resource_ctyun_ecs_data_volume.go#L71) | <code>list(string)</code><br><code>ListAttribute</code> | R | 否 | — | 磁盘ID列表 |
| [<code>instance_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_data_volume.go#L61) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机ID，多可用区资源池下，云硬盘和云主机必须在同个az才能支持挂载 |
| [<code>region_id</code>](../../../internal/service/ecs/resource_ctyun_ecs_data_volume.go#L84) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/ecs/resource_ctyun_ecs_data_volume.go#L54) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>ebs_ids</code> | <code>listvalidator.ValueStringsAre(validator2.UUID())</code><br><code>listvalidator.SizeBetween(1, 10)</code><br><code>listvalidator.UniqueValues()</code> | <code>listplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 2 / 3 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ecs_data_volume/resource.tf](../../../examples/resources/ctyun_ecs_data_volume/resource.tf)；未完整展示，显式展示 2 / 3。

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
  description = "Complete configurable shape for ctyun_ecs_data_volume; consult constraints before use."
  nullable    = false
  type = object({
    ebs_ids     = list(string)
    instance_id = string
    region_id   = optional(string)
  })
}

resource "ctyun_ecs_data_volume" "example" {
  ebs_ids     = var.config.ebs_ids
  instance_id = var.config.instance_id
  region_id   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_data_volume.example.id : string
```

</details>
