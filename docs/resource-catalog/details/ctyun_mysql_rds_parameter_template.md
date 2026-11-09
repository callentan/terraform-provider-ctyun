# ctyun_mysql_rds_parameter_template

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mysql_rds_parameter_template.tf) · [源码](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L55) · [原文档](../../../docs/resources/mysql_rds_parameter_template.md)

**产品分类：** 关系数据库MySQL版。**用途：** 配置MySQL实例的参数，同时支持应用参数模板。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 4 / 1；递归展开后可配置 5，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>instance_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L59) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | mysql数据库实例ID，为该实例管理只读实例 |
| [<code>parameters</code>](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L101) | <code>map(string)</code><br><code>MapAttribute</code> | O | 否 | — | 要修改的参数对。传入该参数，则无需传入template_id，当前mysql实例的参数可根据data.ctyun_mysql_parameters获取。 |
| [<code>project_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L82) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L70) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>template_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L87) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 参数模板id，当mysql实例应用参数模板时必填。参数模板id可以根据data.ctyun_mysql_param_templates获取 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/mysql/resource_ctyun_mysql_rds_parameter_template.go#L97) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 参数模板管理id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>instance_id</code> | <code>stringvalidator.LengthBetween(32, 32)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>parameters</code> | <code>mapvalidator.SizeAtLeast(1)</code> | <code>mapplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>template_id</code> | <code>int64validator.AtLeast(1)</code> | <code>int64planmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 2 / 5 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>parameters</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_mysql_rds_parameter_template/resource.tf](../../../examples/resources/ctyun_mysql_rds_parameter_template/resource.tf)；未完整展示，显式展示 2 / 5。

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
  description = "Complete configurable shape for ctyun_mysql_rds_parameter_template; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    parameters  = optional(map(string))
    project_id  = optional(string)
    region_id   = optional(string)
    template_id = optional(number)
  })
}

resource "ctyun_mysql_rds_parameter_template" "example" {
  instance_id = var.config.instance_id
  parameters  = var.config.parameters
  project_id  = var.config.project_id
  region_id   = var.config.region_id
  template_id = var.config.template_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_rds_parameter_template.example.id : string
```

</details>
