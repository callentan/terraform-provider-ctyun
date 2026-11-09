# ctyun_ccse_node_pool

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ccse_node_pool.tf) · [源码](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L89) · [原文档](../../../docs/resources/ccse_node_pool.md)

**产品分类：** 云容器引擎（CCSE）。**用途：** 管理云容器引擎节点池。

**属性数：** 顶层必填 / 可选 / 只读为 7 / 15 / 1；递归展开后可配置 27，只读 1（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>affinity_group_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L288) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云主机组id，use_affinity_group为true时必填 |
| [<code>auto_renew</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L146) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写，支持更新 |
| [<code>az_infos</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L346) | <code>list(object)</code><br><code>ListNestedAttribute</code> | R | 否 | — | 可用区信息，支持的可用区可通过ctyun_regions查询 |
| [<code>az_infos&#91;&#93;.az_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L357) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 可用区编码 |
| [<code>cluster_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L110) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 集群ID |
| [<code>cycle_count</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L134) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-5年，支持更新 |
| [<code>cycle_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L127) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年、on_demand：按需。当此值为month或者year时，cycle_count为必填，支持更新 |
| [<code>data_disks</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L370) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 数据盘信息，支持更新 |
| [<code>data_disks&#91;&#93;.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L382) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 数据盘大小，单位为G，支持范围10-20000，支持更新 |
| [<code>data_disks&#91;&#93;.type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L375) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 数据盘类型，支持SATA、SAS、SSD、SSD-genric、FAST-SSD、XSSD-0、XSSD-1、XSSD-2，支持更新 |
| [<code>instance_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L174) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例类型，支持ecs（云主机）、ebm（裸金属） |
| [<code>item_def_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L228) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例规格名称，使用至少4C8G以上的规格，云主机规格通过ctyun_ecs_flavors查询，裸金属规格通过ctyun_ebm_device_types查询 |
| [<code>key_pair_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L238) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("")</code> | 密钥对名称，与password有且只能有一个 |
| [<code>max_pod_num</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L306) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 最大pod数, 默认110 |
| [<code>mirror_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L184) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 镜像id，实例为ecs类型必填，可查看&lt;a href="https://www.ctyun.cn/document/10083472/11004475"&gt;节点规格和节点镜像&lt;/a&gt; |
| [<code>mirror_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L201) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 镜像名称，实例为ebm类型必填，可查看&lt;a href="https://www.ctyun.cn/document/10083472/11004475"&gt;节点规格和节点镜像&lt;/a&gt; |
| [<code>mirror_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L218) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 镜像类型，支持传0（私有），1（公有），可查看&lt;a href="https://www.ctyun.cn/document/10026730/10030151"&gt;镜像概述&lt;/a&gt; |
| [<code>name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L120) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 节点池名称，支持更新 |
| [<code>node_num</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L337) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(0)</code> | 节点数，不填则默认为0，支持更新，创建节点池后只能增加不能减少 |
| [<code>password</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L252) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 用户密码，与key_pair_name有且只能有一个，需要满足以下规则：长度在8～30个字符；必须包含大写字母、小写字母、数字以及特殊符号中的三项；特殊符号可选：()`~!@#$%^&amp;*_-+=&#124;{}&#91;&#93;:;'&lt;&gt;,.?/\且不能以斜线号/开头 |
| [<code>region_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L98) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>sys_disk</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L317) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | 系统盘信息 |
| [<code>sys_disk.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L328) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 系统盘大小，单位为G，支持范围40-2040，支持更新 |
| [<code>sys_disk.type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L321) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 系统盘类型，支持SATA、SAS、SSD、SSD-genric、FAST-SSD、XSSD-0、XSSD-1、XSSD-2，支持更新 |
| [<code>use_affinity_group</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L281) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否使用主机组，默认不使用 |
| [<code>visibility_host_script</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L163) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 部署前执行自定义脚本，base64编码，支持更新 |
| [<code>visibility_post_host_script</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L152) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 部署后执行自定义脚本，base64编码，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_pool.go#L93) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>affinity_group_id</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("use_affinity_group"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("use_affinity_group"),<br>						types.BoolValue(false),<br>					)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>az_infos</code> | <code>listvalidator.SizeAtLeast(1)</code> | <code>listplanmodifier.RequiresReplace()</code> |
| <code>az_infos&#91;&#93;.az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>cluster_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 5)</code> | — |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | — |
| <code>data_disks&#91;&#93;.size</code> | <code>int32validator.Between(10, 20000)</code> | — |
| <code>data_disks&#91;&#93;.type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_type</code> | <code>stringvalidator.OneOf(business.CcseSlaveInstanceTypeEcs, business.CcseSlaveInstanceTypeEbm)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>item_def_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>key_pair_name</code> | <code>stringvalidator.ConflictsWith(<br>						path.MatchRoot("password"),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>max_pod_num</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.RequiresReplaceIfConfigured()</code> |
| <code>mirror_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("instance_type"),<br>						types.StringValue(business.CcseSlaveInstanceTypeEcs),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("instance_type"),<br>						types.StringValue(business.CcseSlaveInstanceTypeEbm),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>mirror_name</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("instance_type"),<br>						types.StringValue(business.CcseSlaveInstanceTypeEbm),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("instance_type"),<br>						types.StringValue(business.CcseSlaveInstanceTypeEcs),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>mirror_type</code> | <code>int32validator.Between(0, 1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>node_num</code> | <code>int32validator.AtLeast(0)</code> | — |
| <code>password</code> | <code>stringvalidator.Any(<br>						stringvalidator.All(<br>							validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEcs),<br>							),<br>							validator2.EcsPassword(),<br>						),<br>						stringvalidator.All(<br>							validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEbm),<br>							),<br>							validator2.EbmPassword(),<br>						),<br>					)</code><br><code>stringvalidator.ConflictsWith(<br>						path.MatchRoot("key_pair_name"),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>sys_disk.size</code> | <code>int32validator.Between(40, 2040)</code> | — |
| <code>sys_disk.type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | — |
| <code>use_affinity_group</code> | — | <code>explanmodifier.NullIgnoreBool()</code> |
| <code>visibility_host_script</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>visibility_post_host_script</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 21 / 27 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>mirror_name</code>、<code>node_num</code>、<code>password</code>、<code>region_id</code>、<code>visibility_host_script</code>、<code>visibility_post_host_script</code>。

**examples 源文件：** [examples/resources/ctyun_ccse_node_pool/resource.tf](../../../examples/resources/ctyun_ccse_node_pool/resource.tf)；未完整展示，显式展示 21 / 27。

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
  description = "Complete configurable shape for ctyun_ccse_node_pool; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    affinity_group_id = optional(string)
    auto_renew        = optional(bool)
    az_infos = list(object({
      az_name = string
    }))
    cluster_id  = string
    cycle_count = optional(number)
    cycle_type  = string
    data_disks = optional(list(object({
      size = optional(number)
      type = string
    })))
    instance_type = string
    item_def_name = string
    key_pair_name = optional(string)
    max_pod_num   = optional(number)
    mirror_id     = optional(string)
    mirror_name   = optional(string)
    mirror_type   = number
    name          = string
    node_num      = optional(number)
    password      = optional(string)
    region_id     = optional(string)
    sys_disk = optional(object({
      size = number
      type = string
    }))
    use_affinity_group          = optional(bool)
    visibility_host_script      = optional(string)
    visibility_post_host_script = optional(string)
  })
}

resource "ctyun_ccse_node_pool" "example" {
  affinity_group_id           = var.config.affinity_group_id
  auto_renew                  = var.config.auto_renew
  az_infos                    = var.config.az_infos
  cluster_id                  = var.config.cluster_id
  cycle_count                 = var.config.cycle_count
  cycle_type                  = var.config.cycle_type
  data_disks                  = var.config.data_disks
  instance_type               = var.config.instance_type
  item_def_name               = var.config.item_def_name
  key_pair_name               = var.config.key_pair_name
  max_pod_num                 = var.config.max_pod_num
  mirror_id                   = var.config.mirror_id
  mirror_name                 = var.config.mirror_name
  mirror_type                 = var.config.mirror_type
  name                        = var.config.name
  node_num                    = var.config.node_num
  password                    = var.config.password
  region_id                   = var.config.region_id
  sys_disk                    = var.config.sys_disk
  use_affinity_group          = var.config.use_affinity_group
  visibility_host_script      = var.config.visibility_host_script
  visibility_post_host_script = var.config.visibility_post_host_script
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_node_pool.example.id : string
```

</details>
