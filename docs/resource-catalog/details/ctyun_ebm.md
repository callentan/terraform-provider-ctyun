# ctyun_ebm

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ebm.tf) · [源码](../../../internal/service/ebm/resource_ctyun_ebm.go#L97) · [原文档](../../../docs/resources/ebm.md)

**产品分类：** 物理机服务（CT-DPS，Dedicated Physical Server）。**用途：** 管理物理机。

**属性数：** 顶层必填 / 可选 / 只读为 7 / 17 / 12；递归展开后可配置 24，只读 12（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L367) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写。 |
| [<code>az_name</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L141) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区名称 |
| [<code>bandwidth</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L248) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 带宽大小，传递时会自动创建弹性IP并绑定，单位为Mbit/s，取值范围：&#91;1, 2000&#93; |
| [<code>cycle_count</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L387) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，最长订购周期为60个月（5年）；非按需时必填 |
| [<code>cycle_type</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L377) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围:&#91;on_demand=按需,month=按月,year=按年&#93; |
| [<code>data_volume_raid_uuid</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L228) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 本地数据盘raid类型，如果有本地盘则必填，可通过ctyun_ebm_device_raids查询 |
| [<code>device_type</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L153) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 物理机套餐类型，可通过ctyun_ebm_device_types查询 |
| [<code>fixed_ip</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L319) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 加入子网后的ip地址 |
| [<code>hostname</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L170) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | hostname，linux系统2到63位长度；windows系统2-15位长度；&lt;br/&gt;允许使用大小写字母、数字、连字符'-'、点号'.'，不能连续使用'-'或者'.'，'-'和'.'不能用于开头或结尾，不能仅使用数字，支持更新 |
| [<code>image_uuid</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L180) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 物理机镜像id，可通过ctyun_ebm_device_images查询 |
| [<code>instance_name</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L163) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 物理机名称，长度为2-31位，支持更新 |
| [<code>key_pair_name</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L355) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 密钥对名词，和password只能传其中之一 |
| [<code>metadata</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L417) | <code>map(string)</code><br><code>MapAttribute</code> | O | 否 | — | 物理机元数据信息，键值对形式，支持更新 |
| [<code>password</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L194) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 密码(必须包含大小写字母和（一个数字或者特殊字符）长度8到30位)，未传入有效的keyName时必须传入password，支持更新 |
| [<code>project_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L205) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L129) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>security_group_ids</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L265) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | 主网卡安全组ID，套餐smart_nic_exist为true可支持安全组。创建弹性裸金属必须传入安全组ID，标准裸金属不支持传入安全组ID |
| [<code>status</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L405) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.EbmStatusRunning)</code> | 物理机状态，支持running（开机）和stopped（关机），默认running，支持更新 |
| [<code>subnet_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L309) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主网卡的子网id |
| [<code>system_disk_size</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L290) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 系统盘大小（单位GB），取值范围：&#91;100, 2048&#93;，当前不支持公网 |
| [<code>system_disk_type</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L277) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 系统盘类型，SATA：普通IO，SAS：高IO，SSD：超高IO |
| [<code>system_volume_raid_uuid</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L217) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 本地系统盘raid类型，如果有本地盘则必填，可通过ctyun_ebm_device_raids查询 |
| [<code>user_data</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L345) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 用户自定义数据，需要以Base64方式编码，Base64编码后的长度限制为1-16384字符 |
| [<code>vpc_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L238) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主网卡虚拟私有云ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>actual_image_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L190) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实际镜像id，重装、集群纳管等操作会导致actual_image_id与image_id不同 |
| [<code>create_time</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L425) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>eip_address</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L258) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性公网IP的地址 |
| [<code>expire_time</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L436) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L101) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>instance_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L115) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 物理机UUID，值与id相同 |
| [<code>interface_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L338) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主网卡UUID |
| [<code>master_order_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L122) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单id |
| [<code>name</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L108) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 名称 |
| [<code>port_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L331) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主网卡PORT UUID |
| [<code>system_disk_id</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L302) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 系统盘的id |
| [<code>update_time</code>](../../../internal/service/ebm/resource_ctyun_ebm.go#L432) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>bandwidth</code> | <code>int32validator.Between(1, 2000)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeYear),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 5)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand, business.OrderCycleTypeYear, business.OrderCycleTypeMonth)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>data_volume_raid_uuid</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>device_type</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>eip_address</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>fixed_ip</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>hostname</code> | <code>stringvalidator.LengthBetween(2, 63)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9\-\.&#93;*&#91;a-zA-Z0-9&#93;$`), "hostname必须以字母开头，以字母或数字结尾")</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z0-9\-\.&#93;*$`), "hostname只能包含字母、数字、连字符和点号")</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^.*&#91;a-zA-Z&#93;.*$`), "hostname不能仅使用数字")</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>image_uuid</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>instance_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_name</code> | <code>stringvalidator.UTF8LengthBetween(2, 31)</code> | — |
| <code>interface_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>key_pair_name</code> | <code>stringvalidator.ConflictsWith(path.Expressions{<br>						path.MatchRoot("password"),<br>					}...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>metadata</code> | <code>mapvalidator.SizeAtMost(65535)</code> | — |
| <code>name</code> | — | <code>explanmodifier.UseDependencyForUnknown(path.Root("instance_name"))</code> |
| <code>password</code> | <code>validator2.EbmPassword()</code><br><code>stringvalidator.ConflictsWith(path.Expressions{<br>						path.MatchRoot("key_pair_name"),<br>					}...)</code> | — |
| <code>port_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_ids</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(validator2.SecurityGroupValidate())</code> | <code>setplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>status</code> | <code>stringvalidator.OneOf(<br>						business.EbmStatusRunning,<br>						business.EbmStatusStopped,<br>					)</code> | — |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>system_disk_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>system_disk_size</code> | <code>int32validator.Between(100, 2048)</code><br><code>int32validator.ConflictsWith(path.MatchRoot("system_volume_raid_uuid"))</code><br><code>int32validator.AlsoRequires(path.MatchRoot("system_disk_type"))</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>system_disk_type</code> | <code>stringvalidator.OneOf(business.EbmDiskTypesUpper...)</code><br><code>stringvalidator.ConflictsWith(path.MatchRoot("system_volume_raid_uuid"))</code><br><code>stringvalidator.AlsoRequires(path.MatchRoot("system_disk_size"))</code> | <code>stringplanmodifier.RequiresReplace()</code><br><code>sdkPlanmodifier.EbsDiskTypeNormalize(business.EbsDiskTypeMap.FromOriginalScene, business.EbsDiskTypeMapScene1)</code> |
| <code>system_volume_raid_uuid</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>stringvalidator.ConflictsWith(path.MatchRoot("system_disk_type"))</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>user_data</code> | <code>stringvalidator.UTF8LengthBetween(1, 16384)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 2 个有效 HCL 目标块合并后，显式展示 16 / 24 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>cycle_count</code>、<code>fixed_ip</code>、<code>key_pair_name</code>、<code>metadata</code>、<code>project_id</code>、<code>region_id</code>、<code>user_data</code>。

**examples 源文件：** [examples/resources/ctyun_ebm/resource.tf](../../../examples/resources/ctyun_ebm/resource.tf)；未完整展示，显式展示 16 / 24。

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
  description = "Complete configurable shape for ctyun_ebm; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew              = optional(bool)
    az_name                 = optional(string)
    bandwidth               = optional(number)
    cycle_count             = optional(number)
    cycle_type              = string
    data_volume_raid_uuid   = optional(string)
    device_type             = string
    fixed_ip                = optional(string)
    hostname                = string
    image_uuid              = string
    instance_name           = string
    key_pair_name           = optional(string)
    metadata                = optional(map(string))
    password                = optional(string)
    project_id              = optional(string)
    region_id               = optional(string)
    security_group_ids      = optional(set(string))
    status                  = optional(string)
    subnet_id               = string
    system_disk_size        = optional(number)
    system_disk_type        = optional(string)
    system_volume_raid_uuid = optional(string)
    user_data               = optional(string)
    vpc_id                  = string
  })
}

resource "ctyun_ebm" "example" {
  auto_renew              = var.config.auto_renew
  az_name                 = var.config.az_name
  bandwidth               = var.config.bandwidth
  cycle_count             = var.config.cycle_count
  cycle_type              = var.config.cycle_type
  data_volume_raid_uuid   = var.config.data_volume_raid_uuid
  device_type             = var.config.device_type
  fixed_ip                = var.config.fixed_ip
  hostname                = var.config.hostname
  image_uuid              = var.config.image_uuid
  instance_name           = var.config.instance_name
  key_pair_name           = var.config.key_pair_name
  metadata                = var.config.metadata
  password                = var.config.password
  project_id              = var.config.project_id
  region_id               = var.config.region_id
  security_group_ids      = var.config.security_group_ids
  status                  = var.config.status
  subnet_id               = var.config.subnet_id
  system_disk_size        = var.config.system_disk_size
  system_disk_type        = var.config.system_disk_type
  system_volume_raid_uuid = var.config.system_volume_raid_uuid
  user_data               = var.config.user_data
  vpc_id                  = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebm.example.actual_image_id : string
# ctyun_ebm.example.create_time : string
# ctyun_ebm.example.eip_address : string
# ctyun_ebm.example.expire_time : string
# ctyun_ebm.example.id : string
# ctyun_ebm.example.instance_id : string
# ctyun_ebm.example.interface_id : string
# ctyun_ebm.example.master_order_id : string
# ctyun_ebm.example.name : string
# ctyun_ebm.example.port_id : string
# ctyun_ebm.example.system_disk_id : string
# ctyun_ebm.example.update_time : string
```

</details>
