# ctyun_sfs

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_sfs.tf) · [源码](../../../internal/service/sfs/resource_ctyun_sfs.go#L57) · [原文档](../../../docs/resources/sfs.md)

**产品分类：** 弹性文件服务（CT-SFS，Scalable File Service）。**用途：** 管理弹性文件服务。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 8 / 8；递归展开后可配置 13，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L167) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, false)</code> | 可用区id，如果不填则默认使用provider ctyun中的az_name或环境变量中的CTYUN_AZ_NAME。获取不到则使用资源池第一个可用区 |
| [<code>cycle_count</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L149) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 包周期数，cycle_type是year或month时必须指定，周期最大长度不能超过3年 |
| [<code>cycle_type</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L139) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 计费类型，year/month/on_demand。不支持更新 |
| [<code>is_encrypt</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L73) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否加密盘，默认false。目前仅少量资源池支持加密。具体可查看产品能力地图：https://www.ctyun.cn/document/10027350/10693922 |
| [<code>kms_uuid</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L80) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 如果是加密盘，需要提供kms的uuid |
| [<code>name</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L125) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 文件系统名称；单账户单资源池下，命名需唯一，支持更新 |
| [<code>project_id</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L93) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>protocol</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L115) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议类型，nfs/cifs |
| [<code>region_id</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L61) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>size</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L132) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 大小，单位GB，取值范围：&#91;500GB, 32768GB&#93;。支持更新。弹性文件只支持扩容，不支持缩容 |
| [<code>subnet_id</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L189) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 子网ID，当 |
| [<code>type</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L105) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 存储类型，capacity(标准型)或performance（性能型） |
| [<code>vpc_id</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L179) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 虚拟私有云ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L231) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L242) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L199) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性文件系统id |
| [<code>share_path</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L217) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 挂载路径 |
| [<code>share_path_windows</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L224) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 挂载路径（windows） |
| [<code>status</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L206) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性文件系统状态 |
| [<code>update_time</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L238) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |
| [<code>used_size</code>](../../../internal/service/sfs/resource_ctyun_sfs.go#L213) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 弹性文件系统已使用大小（MB） |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.SfsCycleType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>is_encrypt</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>kms_uuid</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("is_encrypt"),<br>						types.BoolValue(true),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf(&#91;&#93;string{"nfs", "cifs"}...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>share_path</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>share_path_windows</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>size</code> | <code>int32validator.Between(500, 32768)</code> | — |
| <code>status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(&#91;&#93;string{"capacity", "performance"}...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>explanmodifier.NullIgnoreString()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 8 / 13 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>cycle_count</code>、<code>is_encrypt</code>、<code>kms_uuid</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_sfs/resource.tf](../../../examples/resources/ctyun_sfs/resource.tf)；未完整展示，显式展示 8 / 13。

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
  description = "Complete configurable shape for ctyun_sfs; consult constraints before use."
  nullable    = false
  type = object({
    az_name     = optional(string)
    cycle_count = optional(number)
    cycle_type  = string
    is_encrypt  = optional(bool)
    kms_uuid    = optional(string)
    name        = string
    project_id  = optional(string)
    protocol    = string
    region_id   = optional(string)
    size        = number
    subnet_id   = optional(string)
    type        = string
    vpc_id      = optional(string)
  })
}

resource "ctyun_sfs" "example" {
  az_name     = var.config.az_name
  cycle_count = var.config.cycle_count
  cycle_type  = var.config.cycle_type
  is_encrypt  = var.config.is_encrypt
  kms_uuid    = var.config.kms_uuid
  name        = var.config.name
  project_id  = var.config.project_id
  protocol    = var.config.protocol
  region_id   = var.config.region_id
  size        = var.config.size
  subnet_id   = var.config.subnet_id
  type        = var.config.type
  vpc_id      = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_sfs.example.create_time : string
# ctyun_sfs.example.expire_time : string
# ctyun_sfs.example.id : string
# ctyun_sfs.example.share_path : string
# ctyun_sfs.example.share_path_windows : string
# ctyun_sfs.example.status : string
# ctyun_sfs.example.update_time : string
# ctyun_sfs.example.used_size : number
```

</details>
