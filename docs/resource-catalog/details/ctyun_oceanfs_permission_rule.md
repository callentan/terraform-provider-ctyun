# ctyun_oceanfs_permission_rule

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_oceanfs_permission_rule.tf) · [源码](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L96) · [原文档](../../../docs/resources/oceanfs_permission_rule.md)

**产品分类：** 海量文件服务OceanFS。**用途：** 管理海量文件服务权限组规则。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 2 / 1；递归展开后可配置 5，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auth_addr</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L122) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 授权地址，支持更新。可填写单个 IP 或者单个网段，支持IPv4和IPv6两种网络类型。默认来访地址为*表示允许所有 |
| [<code>permission_group_id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L100) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 权限组ID |
| [<code>priority</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L139) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(1)</code> | 规则优先级，支持更新。可选范围为1-400，默认值为1，即最高优先级。 |
| [<code>region_id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L110) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>rw_permission</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L129) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 读写权限类型。取值：rw：读写权限。对应IP下的计算服务可以对文件系统进行读写操作；ro：只读权限。对应IP下的计算服务可以对文件系统只有只读权限 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs_permission_rule.go#L148) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 权限组规则id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auth_addr</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>permission_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>priority</code> | <code>int32validator.Between(1, 400)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rw_permission</code> | <code>stringvalidator.OneOf("ro", "rw")</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 5 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_oceanfs_permission_rule/resource.tf](../../../examples/resources/ctyun_oceanfs_permission_rule/resource.tf)；未完整展示，显式展示 4 / 5。

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
  description = "Complete configurable shape for ctyun_oceanfs_permission_rule; consult constraints before use."
  nullable    = false
  type = object({
    auth_addr           = string
    permission_group_id = string
    priority            = optional(number)
    region_id           = optional(string)
    rw_permission       = string
  })
}

resource "ctyun_oceanfs_permission_rule" "example" {
  auth_addr           = var.config.auth_addr
  permission_group_id = var.config.permission_group_id
  priority            = var.config.priority
  region_id           = var.config.region_id
  rw_permission       = var.config.rw_permission
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_oceanfs_permission_rule.example.id : string
```

</details>
