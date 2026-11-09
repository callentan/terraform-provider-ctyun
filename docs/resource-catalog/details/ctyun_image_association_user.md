# ctyun_image_association_user

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_image_association_user.tf) · [源码](../../../internal/service/image/resource_ctyun_image_association_user.go#L41) · [原文档](../../../docs/resources/image_association_user.md)

**产品分类：** 镜像服务（CT-IMS，Image Management Service）。**用途：** 管理私有镜像共享。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 2 / 0；递归展开后可配置 4，只读 0（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>image_id</code>](../../../internal/service/image/resource_ctyun_image_association_user.go#L45) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 要共享的私有镜像id |
| [<code>region_id</code>](../../../internal/service/image/resource_ctyun_image_association_user.go#L77) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>type</code>](../../../internal/service/image/resource_ctyun_image_association_user.go#L55) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 类型，share：表示将私有镜像分享给其他人，receive：表示接收或拒绝来自其他分享的私有镜像 |
| [<code>user_email</code>](../../../internal/service/image/resource_ctyun_image_association_user.go#L65) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 共享镜像的接收者，此值为对应账号的邮箱，当type为share时此值必填 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

无。

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>image_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(business.ImageAssociationUserTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>user_email</code> | <code>validator2.AlsoRequiresEqualString(path.MatchRoot("type"), types.StringValue(business.ImageAssociationUserTypeShare))</code><br><code>validator2.ConflictsWithEqualString(path.MatchRoot("type"), types.StringValue(business.ImageAssociationUserTypeReceive))</code><br><code>validator2.Email()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 4 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_image_association_user/resource.tf](../../../examples/resources/ctyun_image_association_user/resource.tf)；未完整展示，显式展示 3 / 4。

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
  description = "Complete configurable shape for ctyun_image_association_user; consult constraints before use."
  nullable    = false
  type = object({
    image_id   = string
    region_id  = optional(string)
    type       = string
    user_email = optional(string)
  })
}

resource "ctyun_image_association_user" "example" {
  image_id   = var.config.image_id
  region_id  = var.config.region_id
  type       = var.config.type
  user_email = var.config.user_email
}

# Read-only attributes (reference only; never resource assignments):
```

</details>
