# ctyun_ebm_interface

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ebm_interface.tf) · [源码](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L59) · [原文档](../../../docs/resources/ebm_interface.md)

**产品分类：** 物理机服务（CT-DPS，Dedicated Physical Server）。**用途：** 管理物理机的弹性网卡。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 2 / 2；递归展开后可配置 6，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L89) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区名称 |
| [<code>instance_id</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L101) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 物理机UUID |
| [<code>ipv4</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L130) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | IPV4地址 |
| [<code>region_id</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L77) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>security_group_ids</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L121) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 安全组ID，支持更新 |
| [<code>subnet_id</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L111) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L63) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>interface_id</code>](../../../internal/service/ebm/resource_ctyun_ebm_interface.go#L70) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 网卡ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>interface_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ipv4</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>validator2.Ip()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_ids</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(validator2.SecurityGroupValidate())</code> | — |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ebm_interface/resource.tf](../../../examples/resources/ctyun_ebm_interface/resource.tf)；未完整展示，显式展示 4 / 6。

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
  description = "Complete configurable shape for ctyun_ebm_interface; consult constraints before use."
  nullable    = false
  type = object({
    az_name            = optional(string)
    instance_id        = string
    ipv4               = string
    region_id          = optional(string)
    security_group_ids = set(string)
    subnet_id          = string
  })
}

resource "ctyun_ebm_interface" "example" {
  az_name            = var.config.az_name
  instance_id        = var.config.instance_id
  ipv4               = var.config.ipv4
  region_id          = var.config.region_id
  security_group_ids = var.config.security_group_ids
  subnet_id          = var.config.subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebm_interface.example.id : string
# ctyun_ebm_interface.example.interface_id : string
```

</details>
