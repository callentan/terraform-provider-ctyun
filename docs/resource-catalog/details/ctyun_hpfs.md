# ctyun_hpfs

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_hpfs.tf) · [源码](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L100) · [原文档](../../../docs/resources/hpfs.md)

**产品分类：** 并行文件服务HPFS（CT-HPFS，High Performance File Storage）。**用途：** 管理并行文件服务实例。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 9 / 9；递归展开后可配置 12，只读 9（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L185) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区名称 |
| [<code>baseline</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L208) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 性能基线（MB/s/TB），仅资源池支持性能基线时可传入该参数。可以根据data.ctyun_hpfs_clusters接口查询，也可访问网页查询：https://www.ctyun.cn/document/10088932/10510589 |
| [<code>cluster_name</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L197) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 集群名称，仅资源池支持指定集群时可传入该参数。可以根据data.ctyun_hpfs_clusters接口查询，也可访问网页查询：https://www.ctyun.cn/document/10088932/10510589 |
| [<code>cycle_count</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L150) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数当且仅当在cycle_type为month时填写，支持传递1-36，暂不支持 |
| [<code>cycle_type</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L138) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.OrderCycleTypeOnDemand)</code> | 订购周期类型，只支持on_demand |
| [<code>name</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L167) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 并行文件名，仅允许英文字母数字及-，开头必须为字母，结尾不允许为-，且长度为2-255字符，支持更新 |
| [<code>project_id</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L116) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>protocol</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L128) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议类型，可以根据data.ctyun_hpfs_clusters接口查询，也可访问网页查询：https://www.ctyun.cn/document/10088932/10510589 |
| [<code>region_id</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L104) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>size</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L175) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 文件大小（GB），范围: 512-32768，步长512。支持更新 |
| [<code>subnet_id</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L224) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 废弃字段<br>已弃用：废弃字段，请不要指定 |
| [<code>vpc_id</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L219) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 废弃字段<br>已弃用：废弃字段，请不要指定 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L281) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>dataflow_list</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L259) | <code>set(string)</code><br><code>SetAttribute</code> | C | 否 | — | HPFS文件系统下的数据流动策略ID列表 |
| [<code>id</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L236) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源 ID |
| [<code>master_order_id</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L229) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单ID |
| [<code>secret_key</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L274) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 挂载密钥 |
| [<code>share_path</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L267) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 挂载路径 |
| [<code>status</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L243) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 并行文件状态 |
| [<code>update_time</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L288) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |
| [<code>used_size</code>](../../../internal/service/hpfs/resource_ctyun_hpfs.go#L251) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 已用大小（MB） |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>baseline</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cluster_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.Between(1, 36)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>dataflow_list</code> | — | <code>setplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 255)</code><br><code>validator2.HpfsName()</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>protocol</code> | <code>stringvalidator.OneOf("nfs", "hpfs")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>secret_key</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>share_path</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>size</code> | <code>int32validator.Between(512, 32768)</code><br><code>validator2.SfsSize()</code> | — |
| <code>status</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>used_size</code> | — | <code>int32planmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 12 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>baseline</code>、<code>cluster_name</code>、<code>cycle_count</code>、<code>project_id</code>、<code>region_id</code>、<code>subnet_id</code>、<code>vpc_id</code>。

**examples 源文件：** [examples/resources/ctyun_hpfs/resource.tf](../../../examples/resources/ctyun_hpfs/resource.tf)；未完整展示，显式展示 4 / 12。

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
  description = "Complete configurable shape for ctyun_hpfs; consult constraints before use."
  nullable    = false
  type = object({
    az_name      = optional(string)
    baseline     = optional(string)
    cluster_name = optional(string)
    cycle_count  = optional(number)
    cycle_type   = optional(string)
    name         = string
    project_id   = optional(string)
    protocol     = string
    region_id    = optional(string)
    size         = number
    subnet_id    = optional(string)
    vpc_id       = optional(string)
  })
}

resource "ctyun_hpfs" "example" {
  az_name      = var.config.az_name
  baseline     = var.config.baseline
  cluster_name = var.config.cluster_name
  cycle_count  = var.config.cycle_count
  cycle_type   = var.config.cycle_type
  name         = var.config.name
  project_id   = var.config.project_id
  protocol     = var.config.protocol
  region_id    = var.config.region_id
  size         = var.config.size
  subnet_id    = var.config.subnet_id
  vpc_id       = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_hpfs.example.create_time : string
# ctyun_hpfs.example.dataflow_list : set(string)
# ctyun_hpfs.example.id : string
# ctyun_hpfs.example.master_order_id : string
# ctyun_hpfs.example.secret_key : string
# ctyun_hpfs.example.share_path : string
# ctyun_hpfs.example.status : string
# ctyun_hpfs.example.update_time : string
# ctyun_hpfs.example.used_size : number
```

</details>
