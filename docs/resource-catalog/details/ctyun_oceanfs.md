# ctyun_oceanfs

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_oceanfs.tf) · [源码](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L126) · [原文档](../../../docs/resources/oceanfs.md)

**产品分类：** 海量文件服务OceanFS。**用途：** 管理海量文件服务。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 7 / 8；递归展开后可配置 14，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L207) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区名称，若未填写，默认从环境变量中读取。 |
| [<code>cycle_count</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L189) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 包周期数，cycle_type是year或month时必须指定，周期最大长度不能超过3年 |
| [<code>cycle_type</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L179) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 计费类型，year/month/on_demand。不支持更新 |
| [<code>is_vpce</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L240) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 创建文件系统时是否自动创建VPC终端节点。开启后本服务将为您创建免费的VPC终端节点（VPCE），连接文件存储服务。创建VPCE后将返回该VPC专属的挂载地址，通常需要1~3分钟。注：物理机必须通过VPCE专属挂载地址访问文件系统，其它计算服务如云主机、容器为非必须 |
| [<code>name</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L162) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 文件系统名称；单账户单资源池下，命名需唯一，只能由数字、“-”、字母组成，不能以数字和“-”开头、且不能以“-”结尾，2~255字符 |
| [<code>project_id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L142) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>protocol</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L152) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议类型，nfs/cifs。nfs 适用于 Linux；cifs 适用于 Windows |
| [<code>region_id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L130) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>size</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L172) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 文件系统大小（GB），支持更新。取值范围默认为&#91;100,1048576&#93;，实际取值受限于用户剩余容量配额大小。为避免资源浪费，单用户单资源池默认分配500TB容量配额，可提交工单提升配额。 |
| [<code>subnet_id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L230) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 子网ID，当isVpce为true时必填 |
| [<code>tags</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L247) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O | 否 | — | 标签列表，不支持更新 |
| [<code>tags&#91;&#93;.key</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L252) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签键 |
| [<code>tags&#91;&#93;.value</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L262) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签值 |
| [<code>vpc_id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L220) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | VPC ID，创建时仅支持一个vpc，若需要更新依赖ctyun_oceanfs_permission_group_association能力 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L296) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L307) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L278) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源ID |
| [<code>share_path</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L314) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 挂载路径 |
| [<code>share_path_windows</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L321) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 挂载路径（windows） |
| [<code>status</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L285) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 文件系统状态 |
| [<code>update_time</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L303) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |
| [<code>used_size</code>](../../../internal/service/oceanfs/resource_ctyun_oceanfs.go#L292) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 已使用大小（GB） |

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
| <code>is_vpce</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 255)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf(&#91;&#93;string{"nfs", "cifs"}...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>share_path</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>share_path_windows</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>size</code> | <code>int32validator.Between(100, 1048576)</code> | — |
| <code>status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>tags</code> | — | <code>explanmodifier.NullIgnoreSet()</code> |
| <code>tags&#91;&#93;.key</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>tags&#91;&#93;.value</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>vpc_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 10 / 14 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>is_vpce</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_oceanfs/resource.tf](../../../examples/resources/ctyun_oceanfs/resource.tf)；未完整展示，显式展示 10 / 14。

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
  description = "Complete configurable shape for ctyun_oceanfs; consult constraints before use."
  nullable    = false
  type = object({
    az_name     = optional(string)
    cycle_count = optional(number)
    cycle_type  = string
    is_vpce     = optional(bool)
    name        = string
    project_id  = optional(string)
    protocol    = string
    region_id   = optional(string)
    size        = number
    subnet_id   = optional(string)
    tags = optional(set(object({
      key   = string
      value = string
    })))
    vpc_id = string
  })
}

resource "ctyun_oceanfs" "example" {
  az_name     = var.config.az_name
  cycle_count = var.config.cycle_count
  cycle_type  = var.config.cycle_type
  is_vpce     = var.config.is_vpce
  name        = var.config.name
  project_id  = var.config.project_id
  protocol    = var.config.protocol
  region_id   = var.config.region_id
  size        = var.config.size
  subnet_id   = var.config.subnet_id
  tags        = var.config.tags
  vpc_id      = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_oceanfs.example.create_time : string
# ctyun_oceanfs.example.expire_time : string
# ctyun_oceanfs.example.id : string
# ctyun_oceanfs.example.share_path : string
# ctyun_oceanfs.example.share_path_windows : string
# ctyun_oceanfs.example.status : string
# ctyun_oceanfs.example.update_time : string
# ctyun_oceanfs.example.used_size : number
```

</details>
