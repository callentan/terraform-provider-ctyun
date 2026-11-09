# ctyun_enterprise_project_association_user_group

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_enterprise_project_association_user_group.tf) · [源码](../../../internal/service/iam/resource_ctyun_enterprise_project_association_user_group.go#L50) · [原文档](../../../docs/resources/enterprise_project_association_user_group.md)

**产品分类：** 统一身份认证（Identity and Access Management，简称IAM）。**用途：** 管理企业项目和用户组的绑定关系。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 1 / 0；递归展开后可配置 3，只读 0（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>enterprise_project_id</code>](../../../internal/service/iam/resource_ctyun_enterprise_project_association_user_group.go#L54) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 企业项目ID |
| [<code>policy_ids</code>](../../../internal/service/iam/resource_ctyun_enterprise_project_association_user_group.go#L74) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | <code>setdefault.StaticValue(types.SetValueMust(basetypes.StringType{}, &#91;&#93;attr.Value{}))</code> | 策略id列表，支持更新 |
| [<code>user_group_id</code>](../../../internal/service/iam/resource_ctyun_enterprise_project_association_user_group.go#L64) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 用户组id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

无。

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>enterprise_project_id</code> | <code>validator2.Project()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>policy_ids</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(stringvalidator.UTF8LengthAtLeast(1))</code> | — |
| <code>user_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 3 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_enterprise_project_association_user_group/resource.tf](../../../examples/resources/ctyun_enterprise_project_association_user_group/resource.tf)；字段展示完整，显式展示 3 / 3。

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
  description = "Complete configurable shape for ctyun_enterprise_project_association_user_group; consult constraints before use."
  nullable    = false
  type = object({
    enterprise_project_id = string
    policy_ids            = optional(set(string))
    user_group_id         = string
  })
}

resource "ctyun_enterprise_project_association_user_group" "example" {
  enterprise_project_id = var.config.enterprise_project_id
  policy_ids            = var.config.policy_ids
  user_group_id         = var.config.user_group_id
}

# Read-only attributes (reference only; never resource assignments):
```

</details>
