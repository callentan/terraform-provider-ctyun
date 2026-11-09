# ctyun_scaling_group

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_scaling_group.tf) · [源码](../../../internal/service/scaling/resource_ctyun_scaling.go#L113) · [原文档](../../../docs/resources/scaling_group.md)

**产品分类：** 弹性伸缩服务（CT-AS，Auto Scaling）。**用途：** 管理弹性伸缩组。

**属性数：** 顶层必填 / 可选 / 只读为 10 / 11 / 3；递归展开后可配置 25，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>add_instance_uuid_list</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L329) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | 需要手动添加的云主机uuid列表。伸缩组内云主机清单可以根据data.ctyun_scaling_ecs_list获取。支持更新。 |
| [<code>az_strategy</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L293) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 扩容策略类型：uniform_distribution-均衡分布，priority_distribution-优先级分布。支持更新 |
| [<code>config_list</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L285) | <code>set(number)</code><br><code>SetAttribute</code> | O | 否 | — | 伸缩配置ID列表，最大支持传入10个伸缩配置。支持更新 |
| [<code>delete_protection</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L318) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 控制伸缩组保护，开启伸缩组保护，不可删除该伸缩组。取值范围：enable 或 disable，支持更新。可以用于控制伸缩组保护的开启/关闭 |
| [<code>expected_count</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L222) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 期望云主机数，非多可用区资源池不支持该参数。支持更新，若未填写。expected_count默认=min_count |
| [<code>health_mode</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L163) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 健康检查方式：server-云服务器健康检查，lb-弹性负载均衡健康检查。支持更新，当选择lb（弹性负载均衡健康检查）时，use_lb=1 |
| [<code>health_period</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L234) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 健康检查时间间隔（周期），单位：秒，取值范围：&#91;300,10080&#93;。支持更新 |
| [<code>is_destroy</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L354) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 移除时是否销毁，仅当移除云主机时生效（对手动添加的机器做处理），true-ecs移出伸缩组时销毁， false-ecs移出伸缩组时不销毁，支持更新 |
| [<code>lb_list</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L242) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 负载均衡列表，use_lb=1时必填。当status=disable时支持更新 |
| [<code>lb_list&#91;&#93;.host_group_id</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L268) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 后端主机组ID，当status=disable时支持更新 |
| [<code>lb_list&#91;&#93;.lb_id</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L254) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 负载均衡ID，当status=disable时支持更新 |
| [<code>lb_list&#91;&#93;.port</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L247) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 端口号，当status=disable时支持更新，取值范围：1~65535 |
| [<code>lb_list&#91;&#93;.weight</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L261) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 权重，当status=disable时支持更新 |
| [<code>max_count</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L215) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 最大云主机数，取值范围：&#91;min_count,2147483647&#93;。支持更新 |
| [<code>min_count</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L207) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 最小云主机数，取值范围：&#91;0,50&#93;。支持更新 |
| [<code>move_out_strategy</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L182) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例移出策略：earlier_config-较早创建的配置较早创建，later_config-较晚创建的配置较晚创建，earlier_vm-较早创建的云主机，later_vm-较晚创建的云主机。支持更新 |
| [<code>name</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L156) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 伸缩组名称。支持更新。 |
| [<code>project_id</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L129) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L117) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID |
| [<code>remove_instance_uuid_list</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L337) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | 需要删除手动/自动加入伸缩组的云主机uuid列表。伸缩组内云主机清单可以根据data.ctyun_scaling_ecs_list获取。支持更新。 |
| [<code>security_group_id_list</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L141) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | 安全组ID列表。支持更新 |
| [<code>status</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L307) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 伸缩组状态。取值范围：enable 或 disable，支持更新。可以用于控制伸缩组的状态更新 |
| [<code>subnet_id_list</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L174) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 子网ID列表，支持一主多辅。最多支持5个。支持更新，但是更新阶段status必须为2（停用） |
| [<code>use_lb</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L190) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 是否使用负载均衡：1-是，2-否。status=disable时支持更新 |
| [<code>vpc_id</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L197) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>actual_count</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L230) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 当前弹性伸缩组内云主机数量 |
| [<code>id</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L300) | <code>number</code><br><code>Int64Attribute</code> | C | 否 | — | 伸缩组ID |
| [<code>real_count</code>](../../../internal/service/scaling/resource_ctyun_scaling.go#L359) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 当前的云主机数量，直接通过接口获取，一般为expected_count + 手动添加（+）/移除（-）云主机数量。 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>add_instance_uuid_list</code> | <code>setvalidator.SizeAtLeast(1)</code> | — |
| <code>az_strategy</code> | <code>stringvalidator.OneOf(business.ScalingAzStrategy...)</code> | — |
| <code>config_list</code> | <code>setvalidator.SizeAtMost(10)</code> | — |
| <code>delete_protection</code> | <code>stringvalidator.OneOf(business.ScalingControlProtectionStatus...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>expected_count</code> | <code>validator2.ScalingCountValidate()</code> | — |
| <code>health_mode</code> | <code>stringvalidator.OneOf(business.ScalingHealthMode...)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("use_lb"),<br>						types.Int32Value(1),<br>					)</code> | — |
| <code>health_period</code> | <code>int32validator.Between(300, 10080)</code> | — |
| <code>id</code> | — | <code>int64planmodifier.UseStateForUnknown()</code> |
| <code>lb_list</code> | <code>validator2.AlsoRequiresEqualList(<br>						path.MatchRoot("use_lb"),<br>						types.Int32Value(1),<br>					)</code> | — |
| <code>lb_list&#91;&#93;.host_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>lb_list&#91;&#93;.lb_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>lb_list&#91;&#93;.port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>lb_list&#91;&#93;.weight</code> | <code>int32validator.Between(0, 256)</code> | — |
| <code>max_count</code> | <code>validator2.ScalingCountValidate()</code> | — |
| <code>min_count</code> | <code>int32validator.Between(0, 50)</code><br><code>validator2.ScalingCountValidate()</code> | — |
| <code>move_out_strategy</code> | <code>stringvalidator.OneOf(business.ScalingMoveOutStrategy...)</code> | — |
| <code>name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>remove_instance_uuid_list</code> | <code>setvalidator.SizeAtLeast(1)</code> | — |
| <code>security_group_id_list</code> | <code>setvalidator.SizeAtLeast(1)</code> | — |
| <code>status</code> | <code>stringvalidator.OneOf(business.ScalingControlStatus...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>subnet_id_list</code> | <code>setvalidator.SizeBetween(1, 5)</code> | — |
| <code>use_lb</code> | <code>int32validator.OneOf(1, 2)</code> | — |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 18 / 25 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>add_instance_uuid_list</code>、<code>delete_protection</code>、<code>is_destroy</code>、<code>project_id</code>、<code>region_id</code>、<code>remove_instance_uuid_list</code>、<code>status</code>。

**examples 源文件：** [examples/resources/ctyun_scaling_group/resource.tf](../../../examples/resources/ctyun_scaling_group/resource.tf)；未完整展示，显式展示 18 / 25。

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
  description = "Complete configurable shape for ctyun_scaling_group; consult constraints before use."
  nullable    = false
  type = object({
    add_instance_uuid_list = optional(set(string))
    az_strategy            = string
    config_list            = optional(set(number))
    delete_protection      = optional(string)
    expected_count         = optional(number)
    health_mode            = string
    health_period          = number
    is_destroy             = optional(bool)
    lb_list = optional(list(object({
      host_group_id = string
      lb_id         = string
      port          = number
      weight        = number
    })))
    max_count                 = number
    min_count                 = number
    move_out_strategy         = string
    name                      = string
    project_id                = optional(string)
    region_id                 = optional(string)
    remove_instance_uuid_list = optional(set(string))
    security_group_id_list    = optional(set(string))
    status                    = optional(string)
    subnet_id_list            = set(string)
    use_lb                    = number
    vpc_id                    = string
  })
}

resource "ctyun_scaling_group" "example" {
  add_instance_uuid_list    = var.config.add_instance_uuid_list
  az_strategy               = var.config.az_strategy
  config_list               = var.config.config_list
  delete_protection         = var.config.delete_protection
  expected_count            = var.config.expected_count
  health_mode               = var.config.health_mode
  health_period             = var.config.health_period
  is_destroy                = var.config.is_destroy
  lb_list                   = var.config.lb_list
  max_count                 = var.config.max_count
  min_count                 = var.config.min_count
  move_out_strategy         = var.config.move_out_strategy
  name                      = var.config.name
  project_id                = var.config.project_id
  region_id                 = var.config.region_id
  remove_instance_uuid_list = var.config.remove_instance_uuid_list
  security_group_id_list    = var.config.security_group_id_list
  status                    = var.config.status
  subnet_id_list            = var.config.subnet_id_list
  use_lb                    = var.config.use_lb
  vpc_id                    = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_scaling_group.example.actual_count : number
# ctyun_scaling_group.example.id : number
# ctyun_scaling_group.example.real_count : number
```

</details>
