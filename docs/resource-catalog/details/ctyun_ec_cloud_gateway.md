# ctyun_ec_cloud_gateway

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ec_cloud_gateway.tf) · [源码](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L59) · [原文档](../../../docs/resources/ec_cloud_gateway.md)

**产品分类：** 云间高速（标准版）（CT-EC, Express Connect Standard）。**用途：** 管理云企业路由器。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 3 / 3；递归展开后可配置 6，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L94) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云网关描述  支持更新 |
| [<code>ec_id</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L77) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云间高速实例ID |
| [<code>name</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L87) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云网关名称 支持更新 |
| [<code>region</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L101) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 地域信息，取值如下: 1：中国大陆（默认） 2:亚太 |
| [<code>region_id</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L122) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 资源池ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_name</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L112) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源池名称 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L127) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L63) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云网关实例ID |
| [<code>rtb_id</code>](../../../internal/service/ec/resource_ctyun_ec_cloud_gateway.go#L70) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云网关实例ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthAtMost(255)</code> | — |
| <code>ec_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(1, 64)</code> | — |
| <code>region</code> | <code>int64validator.OneOf(1, 2)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>region_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rtb_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ec_cloud_gateway/resource.tf](../../../examples/resources/ctyun_ec_cloud_gateway/resource.tf)；未完整展示，显式展示 4 / 6。

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
  description = "Complete configurable shape for ctyun_ec_cloud_gateway; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    ec_id       = string
    name        = string
    region      = optional(number)
    region_id   = optional(string)
    region_name = string
  })
}

resource "ctyun_ec_cloud_gateway" "example" {
  description = var.config.description
  ec_id       = var.config.ec_id
  name        = var.config.name
  region      = var.config.region
  region_id   = var.config.region_id
  region_name = var.config.region_name
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_cloud_gateway.example.create_time : string
# ctyun_ec_cloud_gateway.example.id : string
# ctyun_ec_cloud_gateway.example.rtb_id : string
```

</details>
