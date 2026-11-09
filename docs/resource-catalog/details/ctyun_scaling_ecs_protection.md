# ctyun_scaling_ecs_protection

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_scaling_ecs_protection.tf) · [源码](../../../internal/service/scaling/resource_ctyun_scaling_ecs_protection.go#L58) · [原文档](../../../docs/resources/scaling_ecs_protection.md)

**产品分类：** 弹性伸缩服务（CT-AS，Auto Scaling）。**用途：** 配置弹性伸缩组云主机的伸缩保护。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 2 / 0；递归展开后可配置 4，只读 0（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>group_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_ecs_protection.go#L74) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 伸缩组ID |
| [<code>instance_id_list</code>](../../../internal/service/scaling/resource_ctyun_scaling_ecs_protection.go#L84) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | 需要开启伸缩保护的的云主机uuid列表。伸缩组内云主机清单可以根据data.ctyun_scaling_ecs_list获取。支持更新。 |
| [<code>protect_status</code>](../../../internal/service/scaling/resource_ctyun_scaling_ecs_protection.go#L95) | <code>bool</code><br><code>BoolAttribute</code> | R | 否 | — | 开始保护或者停止保护伸缩组内的一台或者多台云主机。false=关闭云主机保护，true=开启云主机保护 |
| [<code>region_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_ecs_protection.go#L62) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

无。

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>group_id</code> | <code>int64validator.AtLeast(1)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>instance_id_list</code> | <code>setvalidator.SizeAtLeast(1)</code> | <code>setplanmodifier.RequiresReplace()</code> |
| <code>protect_status</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 4 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_scaling_ecs_protection/resource.tf](../../../examples/resources/ctyun_scaling_ecs_protection/resource.tf)；未完整展示，显式展示 3 / 4。

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
  description = "Complete configurable shape for ctyun_scaling_ecs_protection; consult constraints before use."
  nullable    = false
  type = object({
    group_id         = number
    instance_id_list = optional(set(string))
    protect_status   = bool
    region_id        = optional(string)
  })
}

resource "ctyun_scaling_ecs_protection" "example" {
  group_id         = var.config.group_id
  instance_id_list = var.config.instance_id_list
  protect_status   = var.config.protect_status
  region_id        = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
```

</details>
