# ctyun_scaling_config

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_scaling_config.tf) · [源码](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L112) · [原文档](../../../docs/resources/scaling_config.md)

**产品分类：** 弹性伸缩服务（CT-AS，Auto Scaling）。**用途：** 管理弹性伸缩配置。

**属性数：** 顶层必填 / 可选 / 只读为 6 / 7 / 2；递归展开后可配置 19，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_names</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L297) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | — | 可用区列表，不填写默认包含该资源池下所有AZ，支持更新 |
| [<code>bandwidth</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L210) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 弹性IP带宽(Mbps)，范围1-3000，支持更新 |
| [<code>flavor_name</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L149) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 规格名称，形如c7.2xlarge.4，支持更新。 |
| [<code>image_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L136) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 镜像ID，可以通过data.ctyun_images(datasource)获取，支持更新 |
| [<code>key_pair_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L261) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 密钥对ID，login_mode为key_pair时必填，支持更新 |
| [<code>login_mode</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L229) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 登录方式: password-密码, key_pair-密钥对，支持更新 |
| [<code>monitor_service</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L305) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | 是否开启详细监控，支持更新 |
| [<code>name</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L128) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 伸缩配置名称,长度为 2～15 个字符，允许使用大小写字母、数字或连字符（-）。不能以点号（.）或连字符（-）开头或结尾，不能连续使用点号（.）或连字符（-），也不能仅使用数字，支持更新 |
| [<code>password</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L244) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 密码，login_mode为password时必填。密码规则：（1）8～30 个字符（2）必须同时包含三项（大写字母、小写字母、数字、 ()`~!@#$%^&amp;*_-+=&#124;{}&#91;&#93;:;'&lt;&gt;,.?/ 中的特殊符号）（3）不能以斜线号（/）开头 （4）不能包含3个及以上连续字符，如abc、123 （5）Windows镜像不能包含镜像用户名（Administrator）、用户名大小写变化（adminiSTrator），支持更新 |
| [<code>region_id</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L116) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID |
| [<code>tags</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L275) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 标签集，支持更新 |
| [<code>tags&#91;&#93;.key</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L280) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签键，支持更新 |
| [<code>tags&#91;&#93;.value</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L287) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签值，支持更新 |
| [<code>use_floatings</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L203) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 是否使用弹性IP: disable-不使用, auto-自动分配。支持更新 |
| [<code>volumes</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L156) | <code>list(object)</code><br><code>ListNestedAttribute</code> | R | 否 | — | 磁盘类型和大小列表，最多添加9块硬盘。系统盘仅支持1块。数据盘最多支持8块，支持更新。 |
| [<code>volumes&#91;&#93;.disk_mode</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L175) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 磁盘模式: VBD（虚拟块存储设备）/ISCSI（小型计算机系统接口）。当flag=OS情况下，不可填写。数据盘磁盘模式，默认为VBD，支持更新 |
| [<code>volumes&#91;&#93;.flag</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L189) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 磁盘类型: OS-系统盘, DATA-数据盘，系统盘限制1块。支持更新 |
| [<code>volumes&#91;&#93;.volume_size</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L168) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 磁盘大小(GB)，支持更新 |
| [<code>volumes&#91;&#93;.volume_type</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L161) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 磁盘类型: SATA/SAS/SSD/SATA-KUNPENG/SATA-HAIGUANG/SAS-KUNPENG/SAS-HAIGUANG/SSD-genric，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L311) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 弹性伸缩配置ID |
| [<code>username</code>](../../../internal/service/scaling/resource_ctyun_scaling_config.go#L236) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 用户名，windows系统为administrator,linux系统为root。不可修改 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>az_names</code> | <code>setvalidator.SizeAtLeast(1)</code> | — |
| <code>bandwidth</code> | <code>int32validator.Between(1, 3000)</code><br><code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("use_floatings"),<br>						types.StringValue(business.ScalingUseFloatingsAutoStr),<br>					)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("use_floatings"),<br>						types.StringValue(business.ScalingUseFloatingsDisableStr),<br>					)</code> | <code>planmodifier2.SetStateNullIfDependencyChangeInt32(path.Root("use_floatings"))</code> |
| <code>flavor_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>id</code> | — | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>image_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>login_mode</code> | <code>stringvalidator.OneOf(business.ScalingLoginMode...)</code> | — |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 15)</code><br><code>validator2.ScalingConfigNameValidate()</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>tags&#91;&#93;.key</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>tags&#91;&#93;.value</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>use_floatings</code> | <code>stringvalidator.OneOf(business.ScalingUseFloatings...)</code> | — |
| <code>username</code> | — | <code>stringplanmodifier.RequiresReplace()</code><br><code>planmodifier2.UseStringStateIfDependencyUnchanged(path.Root("login_mode"))</code> |
| <code>volumes</code> | <code>listvalidator.SizeAtLeast(1)</code><br><code>listvalidator.UniqueValues()</code> | — |
| <code>volumes&#91;&#93;.disk_mode</code> | <code>validator2.ConflictsWithEqualString(<br>									path.MatchRelative().AtParent().AtName("flag"),<br>									types.StringValue(business.ScalingVolumeFlagOSStr),<br>								)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>volumes&#91;&#93;.flag</code> | <code>stringvalidator.OneOf(business.ScalingVolumeFlag...)</code> | — |
| <code>volumes&#91;&#93;.volume_size</code> | <code>int32validator.AtLeast(1)</code> | — |
| <code>volumes&#91;&#93;.volume_type</code> | <code>stringvalidator.OneOf("SATA", "SAS", "SSD", "SATA-KUNPENG", "SATA-HAIGUANG", "SAS-KUNPENG", "SAS-HAIGUANG", "SSD-genric")</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 16 / 19 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>key_pair_id</code>、<code>region_id</code>、<code>volumes&#91;&#93;.disk_mode</code>。

**examples 源文件：** [examples/resources/ctyun_scaling_config/resource.tf](../../../examples/resources/ctyun_scaling_config/resource.tf)；未完整展示，显式展示 16 / 19。

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
  description = "Complete configurable shape for ctyun_scaling_config; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    az_names        = optional(set(string))
    bandwidth       = optional(number)
    flavor_name     = string
    image_id        = string
    key_pair_id     = optional(string)
    login_mode      = string
    monitor_service = optional(bool)
    name            = string
    password        = optional(string)
    region_id       = optional(string)
    tags = optional(list(object({
      key   = string
      value = string
    })))
    use_floatings = string
    volumes = list(object({
      disk_mode   = optional(string)
      flag        = string
      volume_size = number
      volume_type = string
    }))
  })
}

resource "ctyun_scaling_config" "example" {
  az_names        = var.config.az_names
  bandwidth       = var.config.bandwidth
  flavor_name     = var.config.flavor_name
  image_id        = var.config.image_id
  key_pair_id     = var.config.key_pair_id
  login_mode      = var.config.login_mode
  monitor_service = var.config.monitor_service
  name            = var.config.name
  password        = var.config.password
  region_id       = var.config.region_id
  tags            = var.config.tags
  use_floatings   = var.config.use_floatings
  volumes         = var.config.volumes
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_scaling_config.example.id : number
# ctyun_scaling_config.example.username : string
```

</details>
