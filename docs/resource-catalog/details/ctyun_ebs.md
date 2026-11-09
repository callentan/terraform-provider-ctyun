# ctyun_ebs

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ebs.tf) · [源码](../../../internal/service/ebs/resource_ctyun_ebs.go#L55) · [原文档](../../../docs/resources/ebs.md)

**产品分类：** 云硬盘（CT-EVS，Elastic Volume Service）。**用途：** 管理云硬盘。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 11 / 6；递归展开后可配置 18，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L201) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区id，如果不填则默认使用provider ctyun中的az_name或环境变量中的CTYUN_AZ_NAME |
| [<code>backup_id</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L243) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云硬盘备份ID参数，有以下限制：从备份创建盘仅支持VBD模式；新盘容量不能小于备份源盘容量；不支持配置加密属性（自动与备份源盘保持一致）；备份状态必须是可用。 |
| [<code>cycle_count</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L105) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-5年 |
| [<code>cycle_type</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L95) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年、on_demand：按需。当此值为month或者year时，cycle_count为必填 |
| [<code>delete_snap_with_ebs</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L225) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 设置快照是否随云硬盘删除，true表示随盘删除，false表示不随盘删除 |
| [<code>encrypted</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L161) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否加密盘； 共享盘、ISCSI模式磁盘、极速型SSD类型盘、XSSD系列盘不支持加密 |
| [<code>image_id</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L233) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 镜像ID，如果用镜像创建，只支持数据盘的私有镜像和共享镜像，所创建的数据盘的所在地域要与镜像源一致，容量不可小于镜像对应的磁盘容量。从镜像创建的数据盘不支持加密、ISCSI和FCSAN高级配置。 |
| [<code>labels</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L253) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 设置云硬盘标签，实际绑定标签的结果请查询云硬盘详情的labels返回值是否如预期。 |
| [<code>labels&#91;&#93;.key</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L261) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签的key值，长度不能超过32个字符。 |
| [<code>labels&#91;&#93;.value</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L271) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签的value值，长度不能超过32个字符。 |
| [<code>mode</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L67) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 磁盘模式，vbd，iscsi，fcsan |
| [<code>multi_attach</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L153) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否共享云硬盘 |
| [<code>name</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L59) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 磁盘命名，单账户单资源池下，命名需唯一，长度为2-64个字符，仅允许英文字母、数字及特殊字符._-，不能以特殊字符开头，支持更新 |
| [<code>project_id</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L177) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>provisioned_iops</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L214) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | XSSD类型云硬盘的预配置IOPS值，最小值为1，最大值计算公式为“min(单盘最大IOPS，500*容量) - 基础性能IOPS”。 其他类型磁盘不支持此参数 具体取值范围如下：<br>	●XSSD-0：（基础IOPS（min{1800+12×容量， 10000}） + 预配置IOPS） ≤ min{500×容量，100000}<br>	●XSSD-1：（基础IOPS（min{1800+50×容量， 50000}） + 预配置IOPS） ≤ min{500×容量，100000}<br>	●XSSD-2：（基础IOPS（min{3000+50×容量， 100000}） + 预配置IOPS） ≤ min{500×容量，1000000}  */  支持更新 |
| [<code>region_id</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L189) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>size</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L88) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 磁盘大小（单位GB），超高IO/高IO/极速型SSD/普通IO：取值范围&#91;10, 32768&#93;；XSSD-0：10GB-65536GB；XSSD-1：20GB-65536GB；XSSD-2：512GB-65536GB 支持更新（不支持缩容） |
| [<code>type</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L77) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 磁盘类型，SATA：普通IO，SAS：高IO，SSD：超高IO，SSD-genric：通用型SSD，FAST-SSD：极速型SSD，不支持ISCSI模式；XSSD-0、XSSD-1、XSSD-2：X系列云硬盘，不支持加密，不支持ISCSI模式或FCSAN模式 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L139) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L146) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L130) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 磁盘id |
| [<code>kms_uuid</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L170) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 加密盘密钥UUID，是加密盘时才返回 |
| [<code>master_order_id</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L123) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订购的受理单id |
| [<code>status</code>](../../../internal/service/ebs/resource_ctyun_ebs.go#L135) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云硬盘使用状态，deleting：删除中，creating：资源创建中，detaching：解绑中，detached：未绑定云主机，attaching：绑定中，attached：已绑定，extending：扩容中，error：错误状态，backup：备份中，backupRestoring：从备份恢复中，expired：包周期已结束，freezing：按需计费，处于冻结状态，可能账户受限或余额不足，available：可用，in-use：已挂载云主机，resizing：扩容中 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>backup_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 5)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>delete_snap_with_ebs</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>encrypted</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code><br><code>boolplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>image_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>kms_uuid</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>labels</code> | — | <code>listplanmodifier.RequiresReplace()</code> |
| <code>labels&#91;&#93;.key</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>labels&#91;&#93;.value</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>mode</code> | <code>stringvalidator.OneOf(business.EbsDiskModes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>multi_attach</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 64)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;0-9a-zA-Z_-&#93;+$"), "磁盘名称不符合规则")</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>provisioned_iops</code> | <code>int64validator.AtLeast(1)</code> | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>size</code> | <code>int64validator.Between(10, 65536)</code> | — |
| <code>type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | <code>stringplanmodifier.RequiresReplace()</code><br><code>sdkPlanmodifier.EbsDiskTypeNormalize(business.EbsDiskTypeMap.FromOriginalScene, business.EbsDiskTypeMapScene1)</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 5 / 18 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>backup_id</code>、<code>cycle_count</code>、<code>delete_snap_with_ebs</code>、<code>encrypted</code>、<code>image_id</code>、<code>labels</code>、<code>labels&#91;&#93;.key</code>、<code>labels&#91;&#93;.value</code>、<code>multi_attach</code>、<code>project_id</code>、<code>provisioned_iops</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ebs/resource.tf](../../../examples/resources/ctyun_ebs/resource.tf)；未完整展示，显式展示 5 / 18。

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
  description = "Complete configurable shape for ctyun_ebs; consult constraints before use."
  nullable    = false
  type = object({
    az_name              = optional(string)
    backup_id            = optional(string)
    cycle_count          = optional(number)
    cycle_type           = string
    delete_snap_with_ebs = optional(bool)
    encrypted            = optional(bool)
    image_id             = optional(string)
    labels = optional(list(object({
      key   = string
      value = string
    })))
    mode             = string
    multi_attach     = optional(bool)
    name             = string
    project_id       = optional(string)
    provisioned_iops = optional(number)
    region_id        = optional(string)
    size             = number
    type             = string
  })
}

resource "ctyun_ebs" "example" {
  az_name              = var.config.az_name
  backup_id            = var.config.backup_id
  cycle_count          = var.config.cycle_count
  cycle_type           = var.config.cycle_type
  delete_snap_with_ebs = var.config.delete_snap_with_ebs
  encrypted            = var.config.encrypted
  image_id             = var.config.image_id
  labels               = var.config.labels
  mode                 = var.config.mode
  multi_attach         = var.config.multi_attach
  name                 = var.config.name
  project_id           = var.config.project_id
  provisioned_iops     = var.config.provisioned_iops
  region_id            = var.config.region_id
  size                 = var.config.size
  type                 = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs.example.create_time : string
# ctyun_ebs.example.expire_time : string
# ctyun_ebs.example.id : string
# ctyun_ebs.example.kms_uuid : string
# ctyun_ebs.example.master_order_id : string
# ctyun_ebs.example.status : string
```

</details>
