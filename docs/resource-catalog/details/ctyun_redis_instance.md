# ctyun_redis_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_redis_instance.tf) · [源码](../../../internal/service/redis/resource_ctyun_redis_instance.go#L100) · [原文档](../../../docs/resources/redis_instance.md)

**产品分类：** 分布式缓存服务Redis版。**用途：** 管理Redis实例。

**属性数：** 顶层必填 / 可选 / 只读为 8 / 18 / 10；递归展开后可配置 29，只读 10（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L364) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写 |
| [<code>auto_renew_cycle_count</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L376) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 自动续订时长，单位月，支持1, 2, 3, 5, 6, 7, 12, 24, 36 |
| [<code>az_name</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L174) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 主可用区，如果不填则默认使用provider ctyun中的az_name或环境变量中的CTYUN_AZ_NAME |
| [<code>backup_policy</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L416) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | 实例的备份策略配置 |
| [<code>backup_policy.period</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L420) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 备份周期，用英文逗号分隔，1-7表示周一到周日，例如：2,5表示周二周五进行备份，支持更新 |
| [<code>backup_policy.retention_day</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L434) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 备份保留天数（1-7），支持更新 |
| [<code>backup_policy.time</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L427) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 每日备份执行时间（0-23），支持更新 |
| [<code>copies_count</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L288) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 副本数量，当edition取值为StandardDual/DirectCluster/ClusterOriginalProxy时可填1-10，当edition取值为OriginalMultipleReadLvs时可填2~10，当edition为其他值时不可填写。 |
| [<code>cycle_count</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L156) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month时才生效，当cycle_type=month，支持传递1、2、3、4、5、6、12、24、36，从按需变为包周期时支持更新 |
| [<code>cycle_type</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L149) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，on_demand：按需。当此值为month时，cycle_count为必填，支持更新 |
| [<code>data_disk_type</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L230) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.RedisDiskTypeSas)</code> | 磁盘类型，支持SAS和SSD，默认SAS |
| [<code>edition</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L208) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例类型，SeriesInfo中的seriesCode值，可参考&lt;a href="https://www.ctyun.cn/document/10029420/11030280"&gt;产品规格说明&lt;/a&gt; |
| [<code>engine_version</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L218) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | Redis引擎版本，SeriesInfo中的engineTypeItems(引擎版本可选值)，当version取值为BASIC时，版本号取值：5.0，6.0，7.0，当version取值为PLUS，版本号取值：6.0，7.0，支持更新 |
| [<code>host_type</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L242) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.RedisHostTypeS)</code> | 主机类型，默认S，X86取值：S：通用型、C：计算增强型、M：内存型、HS：海光通用型、HC：海光计算增强型，ARM取值：KS：鲲鹏通用型、KC：鲲鹏计算增强型 |
| [<code>instance_name</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L314) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称，大小写字母开头。只能包含大小写字母、数字及分隔符(-)。大小写字母或数字结尾。长度4~40个字符。实例名称不可重复。 |
| [<code>maintenance_time</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L394) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("02:00-04:00")</code> | 实例维护时间窗口，总时长必须为2小时，默认：02:00-04:00，支持更新 |
| [<code>password</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L355) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 密码，创建时必填，导入时不填。长度8-26字符。必须同时包含大写字母、小写字母、数字、英文格式特殊符号(@%^*_+!$-=.)中的至少三种类型。不能有空格。支持更新 |
| [<code>project_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L137) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>protection_status</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L410) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 退订保护开关，默认为不保护，支持更新 |
| [<code>region_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L125) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>secondary_az_name</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L186) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 备可用区 |
| [<code>security_group_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L345) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组ID |
| [<code>shard_count</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L264) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 分片数量，当edition取值为DirectClusterSingle或DirectCluster时可填3-256。当edition取其他值时不填。 |
| [<code>shard_mem_size</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L254) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 分片规格，当version取值为BASIC，取值：1、2、4、8、16、32、64，当version取值为PLUS时，取值：8、16、32、64 |
| [<code>ssl_enabled</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L443) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | ssl加密设置，设置该值会触发重启，只有version为BASIC且engine_version为6.0、7.0且edition为StandardSingle、StandardDual、DirectClusterSingle或DirectCluster时才能设置，支持更新 |
| [<code>subnet_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L335) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |
| [<code>template_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L483) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 参数模板ID，用于应用参数模板，支持更新 |
| [<code>version</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L196) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.RedisVersionBasic)</code> | 版本类型，SeriesInfo中的version值，支持BASIC和PLUS，默认BASIC |
| [<code>vpc_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L325) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>actual_cycle_type</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L167) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 服务端当前实际计费类型（可能与 cycle_type 不一致，如包周期未到期时）。 |
| [<code>connection_address</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L476) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 连接地址 |
| [<code>create_time</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L490) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L497) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L104) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>master_order_id</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L118) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主订单号 |
| [<code>name</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L111) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 名称 |
| [<code>protected_conn</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L462) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 受保护的连接地址 |
| [<code>tls_version</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L469) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | TLS版本 |
| [<code>vip</code>](../../../internal/service/redis/resource_ctyun_redis_instance.go#L403) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | VIP地址 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>actual_cycle_type</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("cycle_type"))</code> |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>auto_renew_cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("auto_renew"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("auto_renew"),<br>						types.BoolValue(false),<br>					)</code><br><code>int32validator.OneOf(1, 2, 3, 5, 6, 7, 12, 24, 36)</code> | <code>int32planmodifier.RequiresReplaceIfConfigured()</code> |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>backup_policy.period</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>backup_policy.retention_day</code> | <code>int32validator.Between(1, 7)</code> | — |
| <code>backup_policy.time</code> | <code>int32validator.Between(0, 23)</code> | — |
| <code>connection_address</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>copies_count</code> | <code>validator2.CrossFieldInt32(<br>						path.MatchRoot("edition"),<br>						&#91;&#93;any{business.RedisEditionStandardDual, business.RedisEditionDirectCluster, business.RedisEditionClusterOriginalProxy},<br>						&#91;&#93;int32{1, 2, 3, 4, 5, 6, 7, 8, 9, 10},<br>					)</code><br><code>validator2.CrossFieldInt32(<br>						path.MatchRoot("edition"),<br>						&#91;&#93;any{business.RedisEditionOriginalMultipleReadLvs},<br>						&#91;&#93;int32{2, 3, 4, 5, 6, 7, 8, 9, 10},<br>					)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("edition"),<br>						types.StringValue(business.RedisEditionStandardSingle),<br>						types.StringValue(business.RedisEditionDirectClusterSingle),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code><br><code>int32planmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.OneOf(1, 2, 3, 4, 5, 6, 12, 24, 36)</code> | — |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand, business.OrderCycleTypeMonth)</code> | — |
| <code>data_disk_type</code> | <code>stringvalidator.OneOf(business.RedisDiskTypeSas, business.RedisDiskTypeSsd)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>edition</code> | <code>stringvalidator.OneOf(business.RedisEdition...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>engine_version</code> | <code>stringvalidator.OneOf(business.RedisEngineVersion...)</code><br><code>validator2.CrossFieldString(<br>						path.MatchRoot("version"),<br>						&#91;&#93;any{"PLUS"},<br>						&#91;&#93;string{"6.0", "7.0"},<br>					)</code> | — |
| <code>expire_time</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("cycle_type"))</code> |
| <code>host_type</code> | <code>stringvalidator.OneOf(business.RedisHostType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_name</code> | <code>stringvalidator.UTF8LengthBetween(4, 40)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9-&#93;*&#91;a-zA-Z0-9&#93;$"), "不满足实例名称要求")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>maintenance_time</code> | <code>stringvalidator.RegexMatches(regexp.MustCompile("^(&#91;0-1&#93;&#91;0-9&#93;&#124;2&#91;0-3&#93;):&#91;0-5&#93;&#91;0-9&#93;-(&#91;0-1&#93;&#91;0-9&#93;&#124;2&#91;0-3&#93;):&#91;0-5&#93;&#91;0-9&#93;$"), "时间格式错误")</code> | — |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | — | <code>explanmodifier.UseDependencyForUnknown(path.Root("instance_name"))</code> |
| <code>password</code> | <code>stringvalidator.UTF8LengthBetween(8, 26)</code><br><code>validator2.RedisPassword()</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>protected_conn</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("ssl_enabled"))</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>secondary_az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_id</code> | <code>validator2.SecurityGroupValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>shard_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("edition"),<br>						types.StringValue(business.RedisEditionDirectClusterSingle),<br>						types.StringValue(business.RedisEditionDirectCluster),<br>					)</code><br><code>int32validator.Between(3, 256)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("edition"),<br>						types.StringValue(business.RedisEditionClusterOriginalProxy),<br>						types.StringValue(business.RedisEditionStandardSingle),<br>						types.StringValue(business.RedisEditionStandardDual),<br>						types.StringValue(business.RedisEditionOriginalMultipleReadLvs),<br>					)</code> | <code>int32planmodifier.UseStateForUnknown()</code><br><code>int32planmodifier.RequiresReplace()</code> |
| <code>shard_mem_size</code> | <code>int32validator.OneOf(1, 2, 4, 8, 16, 32, 64)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>ssl_enabled</code> | <code>validator2.ConflictsWithEqualBool(<br>						path.MatchRoot("engine_version"),<br>						types.StringValue("5.0"))</code><br><code>validator2.ConflictsWithEqualBool(<br>						path.MatchRoot("edition"),<br>						types.StringValue(business.RedisEditionClusterOriginalProxy),<br>						types.StringValue(business.RedisEditionOriginalMultipleReadLvs),<br>					)</code><br><code>validator2.ConflictsWithEqualBool(<br>						path.MatchRoot("version"),<br>						types.StringValue("PLUS"))</code> | — |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>template_id</code> | <code>stringvalidator.LengthBetween(45, 45)</code> | — |
| <code>tls_version</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("ssl_enabled"))</code> |
| <code>version</code> | <code>stringvalidator.OneOf(business.RedisVersionBasic, business.RedisVersionPlus)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vip</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 15 / 29 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>backup_policy</code>、<code>backup_policy.period</code>、<code>backup_policy.retention_day</code>、<code>backup_policy.time</code>、<code>copies_count</code>、<code>data_disk_type</code>、<code>host_type</code>、<code>project_id</code>、<code>region_id</code>、<code>secondary_az_name</code>、<code>shard_count</code>、<code>ssl_enabled</code>、<code>template_id</code>。

**examples 源文件：** [examples/resources/ctyun_redis_instance/resource.tf](../../../examples/resources/ctyun_redis_instance/resource.tf)；未完整展示，显式展示 15 / 29。

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
  description = "Complete configurable shape for ctyun_redis_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew             = optional(bool)
    auto_renew_cycle_count = optional(number)
    az_name                = optional(string)
    backup_policy = optional(object({
      period        = string
      retention_day = number
      time          = number
    }))
    copies_count      = optional(number)
    cycle_count       = optional(number)
    cycle_type        = string
    data_disk_type    = optional(string)
    edition           = string
    engine_version    = string
    host_type         = optional(string)
    instance_name     = string
    maintenance_time  = optional(string)
    password          = optional(string)
    project_id        = optional(string)
    protection_status = optional(bool)
    region_id         = optional(string)
    secondary_az_name = optional(string)
    security_group_id = string
    shard_count       = optional(number)
    shard_mem_size    = number
    ssl_enabled       = optional(bool)
    subnet_id         = string
    template_id       = optional(string)
    version           = optional(string)
    vpc_id            = string
  })
}

resource "ctyun_redis_instance" "example" {
  auto_renew             = var.config.auto_renew
  auto_renew_cycle_count = var.config.auto_renew_cycle_count
  az_name                = var.config.az_name
  backup_policy          = var.config.backup_policy
  copies_count           = var.config.copies_count
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  data_disk_type         = var.config.data_disk_type
  edition                = var.config.edition
  engine_version         = var.config.engine_version
  host_type              = var.config.host_type
  instance_name          = var.config.instance_name
  maintenance_time       = var.config.maintenance_time
  password               = var.config.password
  project_id             = var.config.project_id
  protection_status      = var.config.protection_status
  region_id              = var.config.region_id
  secondary_az_name      = var.config.secondary_az_name
  security_group_id      = var.config.security_group_id
  shard_count            = var.config.shard_count
  shard_mem_size         = var.config.shard_mem_size
  ssl_enabled            = var.config.ssl_enabled
  subnet_id              = var.config.subnet_id
  template_id            = var.config.template_id
  version                = var.config.version
  vpc_id                 = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_instance.example.actual_cycle_type : string
# ctyun_redis_instance.example.connection_address : string
# ctyun_redis_instance.example.create_time : string
# ctyun_redis_instance.example.expire_time : string
# ctyun_redis_instance.example.id : string
# ctyun_redis_instance.example.master_order_id : string
# ctyun_redis_instance.example.name : string
# ctyun_redis_instance.example.protected_conn : string
# ctyun_redis_instance.example.tls_version : string
# ctyun_redis_instance.example.vip : string
```

</details>
