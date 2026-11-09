# ctyun_ecs

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ecs.tf) · [源码](../../../internal/service/ecs/resource_ctyun_ecs.go#L77) · [原文档](../../../docs/resources/ecs.md)

**产品分类：** 弹性云主机（CT-ECS，Elastic Cloud Server）。**用途：** 管理云主机。

**属性数：** 顶层必填 / 可选 / 只读为 8 / 22 / 10；递归展开后可配置 32，只读 10（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>affinity_group_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L454) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 云主机组ID，支持更新 |
| [<code>auto_renew</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L263) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | 是否自动续订，此参数在包周期情况下才有效，当为包周期时此值默认为true，支持更新 |
| [<code>az_name</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L370) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区id，如果不填则默认使用provider ctyun中的az_name或环境变量中的CTYUN_AZ_NAME |
| [<code>bandwidth</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L340) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 带宽大小，传递时会自动创建弹性IP并绑定，单位为Mbit/s，取值范围：&#91;1, 2000&#93; |
| [<code>cycle_count</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L251) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-5年 支持更新 |
| [<code>cycle_type</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L244) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年、on_demand：按需。当此值为month或者year时，cycle_count为必填 支持更新 |
| [<code>deletion_protection</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L408) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否开启实例删除保护，默认为false，按需实例支持更新 |
| [<code>demand_billing_type</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L350) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 自动创建的弹性IP的计费模式，当传递了bandwidth且cycle_type为on_demand时可传递，bandwidth：按带宽，upflowc：按流量 |
| [<code>display_name</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L108) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称，长度为2-63字符 支持更新 |
| [<code>fixed_ip</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L195) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 加入子网后的ip地址 |
| [<code>flavor_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L115) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 规格id，请用ctyun_ecs_flavors查询具体id，变更前需要先关机，支持更新。 |
| [<code>flavor_name</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L128) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 云主机规格名称，规格ID和规格名称两者均可使用，必填其中一个，变更前需要先关机，支持更新。 |
| [<code>image_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L140) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 镜像id |
| [<code>instance_name</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L95) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主机名称（hostname），不可以使用已存在的云主机名称。不同操作系统下，云主机名称规则有差异。Windows：长度为2-15个字符，允许使用大小写字母、数字或连字符（-）。不能以连字符（-）开头或结尾，不能连续使用连字符（-），也不能仅使用数字；其他操作系统：长度为2-64字符，允许使用点（.）分隔字符成多段，每段允许使用大小写字母、数字或连字符（-），但不能连续使用点号（.）或连字符（-），不能以点号（.）或连字符（-）开头或结尾，也不能仅使用数字 |
| [<code>is_destroy_instance</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L382) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否立即释放，默认为false。包周期云主机退订之后有一定时间的保留期，通过terraform destroy触发退订后，若此字段为true，会立即释放该云主机。支持更新 |
| [<code>key_pair_name</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L220) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("")</code> | 密钥对名称，与password字段互斥，支持更新 |
| [<code>labels</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L432) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 标签 云主机绑定多个标签时，标签键（参数labelKey）不可重复，单台云主机最多可绑定10个标签 支持更新 |
| [<code>labels&#91;&#93;.key</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L437) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签的key值，长度不能超过32个字符。支持更新 |
| [<code>labels&#91;&#93;.value</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L444) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 标签的value值，长度不能超过32个字符。 支持更新 |
| [<code>metadata</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L400) | <code>map(string)</code><br><code>MapAttribute</code> | O | 否 | — | 云主机元数据信息，键值对形式，支持更新 |
| [<code>password</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L233) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 用户密码，与key_pair_name字段互斥，满足以下规则：长度在8～30个字符；必须包含大写字母、小写字母、数字以及特殊符号中的三项；特殊符号可选：()`~!@#$%^&amp;*_-+=&#124;{}&#91;&#93;:;'&lt;&gt;,.?/\且不能以斜线号/开头 支持更新 |
| [<code>pay_voucher_price</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L388) | <code>number</code><br><code>Float64Attribute</code> | O+C | 否 | <code>float64default.StaticFloat64(0.00)</code> | 代金券，满足以下规则：两位小数，不足两位自动补0，超过两位小数无效；不可为负数；注：字段为0时表示不使用代金券，默认不使用 |
| [<code>project_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L316) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L328) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>security_group_ids</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L207) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | — | 安全组id列表，在多可用区类型资源池下，安全组ID通常以“sg-”开头，非多可用区类型资源池安全组ID为uuid格式；默认使用默认安全组，无默认安全组情况下请填写该参数 支持更新 |
| [<code>security_product</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L421) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 安全防护类型，取值范围：EnterpriseEdition：企业版，UltimateEdition：旗舰版，BasicEdition：基础版。不填写表示不开启。 |
| [<code>status</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L269) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 云主机状态，初始状态为running，取值范围：backingup: 备份中，creating: 创建中，expired: 已到期，freezing: 冻结中，rebuild: 重装，restarting: 重启中，running: 运行中，starting: 开机中，stopped: 已关机，stopping: 关机中，error: 错误，snapshotting: 快照创建中，unsubscribed: 包周期已退订，unsubscribing: 包周期退订中，shelve：节省关机，shelving：节省关机中 |
| [<code>subnet_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L185) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主网卡的子网id |
| [<code>system_disk_size</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L165) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 系统盘大小（单位GB），取值范围：&#91;40, 32768&#93;，只支持扩容，需要先关机 支持更新 |
| [<code>system_disk_type</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L154) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 系统盘类型，SATA：普通IO，SAS：高IO，SSD：超高IO，SSD-genric：通用型SSD，FAST-SSD：极速型SSD |
| [<code>user_data</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L297) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("")</code> | 用户自定义数据，需要以Base64方式编码，Base64编码后的长度限制为1-16384字符 |
| [<code>vpc_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L175) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云id，在多可用区类型资源池下，vpcID通常为“vpc-”开头，非多可用区类型资源池vpcID为uuid格式 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>actual_image_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L150) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实际镜像id，重装、集群纳管等操作会导致actual_image_id与image_id不同 |
| [<code>create_time</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L468) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>eip_address</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L366) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性IP地址 |
| [<code>expire_time</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L283) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L81) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | id |
| [<code>master_order_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L309) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订购的受理单ID |
| [<code>master_port_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L461) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主网卡id |
| [<code>name</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L88) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 名称 |
| [<code>system_disk_id</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L290) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 系统盘ID |
| [<code>update_time</code>](../../../internal/service/ecs/resource_ctyun_ecs.go#L475) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>affinity_group_id</code> | <code>validator2.UUID()</code> | — |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>bandwidth</code> | <code>int32validator.Between(1, 2000)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 5)</code> | — |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | — |
| <code>deletion_protection</code> | <code>validator2.ConflictsWithEqualBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code> | — |
| <code>demand_billing_type</code> | <code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>stringvalidator.AlsoRequires(path.MatchRoot("bandwidth"))</code><br><code>stringvalidator.OneOf(business.EipDemandBillingTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>display_name</code> | <code>stringvalidator.LengthBetween(2, 63)</code> | — |
| <code>expire_time</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("cycle_type"))</code> |
| <code>fixed_ip</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>flavor_id</code> | <code>validator2.UUID()</code><br><code>stringvalidator.ExactlyOneOf(path.MatchRoot("flavor_name"))</code> | <code>explanmodifier.CheckValueWhenChangeString(path.Root("status"), business.EcsStatusStopped)</code><br><code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("flavor_name"))</code> |
| <code>flavor_name</code> | <code>stringvalidator.ExactlyOneOf(path.MatchRoot("flavor_id"))</code> | <code>explanmodifier.CheckValueWhenChangeString(path.Root("status"), business.EcsStatusStopped)</code><br><code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("flavor_id"))</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>image_id</code> | <code>validator2.UUID()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>instance_name</code> | <code>stringvalidator.LengthBetween(2, 64)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9\-\.&#93;*&#91;a-zA-Z0-9&#93;$`), "hostname必须以字母开头，以字母或数字结尾，只能包含字母、数字、连字符和点号。不能连续使用连字符，也不能仅使用数字")</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z0-9\-\.&#93;*$`), "hostname必须以字母开头，以字母或数字结尾，只能包含字母、数字、连字符和点号。不能连续使用连字符，也不能仅使用数字")</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^.*&#91;a-zA-Z&#93;.*$`), "hostname必须以字母开头，以字母或数字结尾，只能包含字母、数字、连字符和点号。不能连续使用连字符，也不能仅使用数字")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>key_pair_name</code> | <code>stringvalidator.ConflictsWith(path.Expressions{<br>						path.MatchRoot("password"),<br>					}...)</code><br><code>stringvalidator.UTF8LengthBetween(2, 63)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9-&#93;*&#91;a-zA-Z0-9&#93;$"), "不满足密钥对名称要求")</code> | — |
| <code>labels&#91;&#93;.key</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | — |
| <code>labels&#91;&#93;.value</code> | <code>stringvalidator.LengthBetween(1, 32)</code> | — |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_port_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>metadata</code> | <code>mapvalidator.SizeAtMost(65535)</code> | — |
| <code>name</code> | — | <code>explanmodifier.UseDependencyForUnknown(path.Root("display_name"))</code> |
| <code>password</code> | <code>stringvalidator.ConflictsWith(path.Expressions{<br>						path.MatchRoot("key_pair_name"),<br>					}...)</code><br><code>validator2.EcsPassword()</code> | — |
| <code>pay_voucher_price</code> | <code>float64validator.AtLeast(0.0)</code> | <code>float64planmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_ids</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(validator2.SecurityGroupValidate())</code> | <code>setplanmodifier.UseStateForUnknown()</code> |
| <code>security_product</code> | <code>stringvalidator.OneOf(<br>						"EnterpriseEdition", "UltimateEdition", "BasicEdition")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>status</code> | <code>stringvalidator.OneOf(<br>						business.EcsStatusRunning,<br>						business.EcsStatusStopped,<br>						business.EcsStatusShelve)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>system_disk_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>system_disk_size</code> | <code>int64validator.Between(40, 32768)</code> | <code>explanmodifier.CheckValueWhenChangeInt64(path.Root("status"), business.EcsStatusStopped)</code> |
| <code>system_disk_type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | <code>stringplanmodifier.RequiresReplace()</code><br><code>sdkPlanmodifier.EbsDiskTypeNormalize(business.EbsDiskTypeMap.FromOriginalScene, business.EbsDiskTypeMapScene1)</code> |
| <code>user_data</code> | <code>stringvalidator.UTF8LengthBetween(1, 16384)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 10 / 32 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>affinity_group_id</code>、<code>auto_renew</code>、<code>az_name</code>、<code>bandwidth</code>、<code>cycle_count</code>、<code>deletion_protection</code>、<code>demand_billing_type</code>、<code>fixed_ip</code>、<code>flavor_name</code>、<code>is_destroy_instance</code>、<code>labels</code>、<code>labels&#91;&#93;.key</code>、<code>labels&#91;&#93;.value</code>、<code>metadata</code>、<code>password</code>、<code>pay_voucher_price</code>、<code>project_id</code>、<code>region_id</code>、<code>security_group_ids</code>、<code>security_product</code>、<code>status</code>、<code>user_data</code>。

**examples 源文件：** [examples/resources/ctyun_ecs/resource.tf](../../../examples/resources/ctyun_ecs/resource.tf)；未完整展示，显式展示 10 / 32。

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
  description = "Complete configurable shape for ctyun_ecs; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    affinity_group_id   = optional(string)
    auto_renew          = optional(bool)
    az_name             = optional(string)
    bandwidth           = optional(number)
    cycle_count         = optional(number)
    cycle_type          = string
    deletion_protection = optional(bool)
    demand_billing_type = optional(string)
    display_name        = string
    fixed_ip            = optional(string)
    flavor_id           = optional(string)
    flavor_name         = optional(string)
    image_id            = string
    instance_name       = string
    is_destroy_instance = optional(bool)
    key_pair_name       = optional(string)
    labels = optional(list(object({
      key   = string
      value = string
    })))
    metadata           = optional(map(string))
    password           = optional(string)
    pay_voucher_price  = optional(number)
    project_id         = optional(string)
    region_id          = optional(string)
    security_group_ids = optional(set(string))
    security_product   = optional(string)
    status             = optional(string)
    subnet_id          = string
    system_disk_size   = number
    system_disk_type   = string
    user_data          = optional(string)
    vpc_id             = string
  })
}

resource "ctyun_ecs" "example" {
  affinity_group_id   = var.config.affinity_group_id
  auto_renew          = var.config.auto_renew
  az_name             = var.config.az_name
  bandwidth           = var.config.bandwidth
  cycle_count         = var.config.cycle_count
  cycle_type          = var.config.cycle_type
  deletion_protection = var.config.deletion_protection
  demand_billing_type = var.config.demand_billing_type
  display_name        = var.config.display_name
  fixed_ip            = var.config.fixed_ip
  flavor_id           = var.config.flavor_id
  flavor_name         = var.config.flavor_name
  image_id            = var.config.image_id
  instance_name       = var.config.instance_name
  is_destroy_instance = var.config.is_destroy_instance
  key_pair_name       = var.config.key_pair_name
  labels              = var.config.labels
  metadata            = var.config.metadata
  password            = var.config.password
  pay_voucher_price   = var.config.pay_voucher_price
  project_id          = var.config.project_id
  region_id           = var.config.region_id
  security_group_ids  = var.config.security_group_ids
  security_product    = var.config.security_product
  status              = var.config.status
  subnet_id           = var.config.subnet_id
  system_disk_size    = var.config.system_disk_size
  system_disk_type    = var.config.system_disk_type
  user_data           = var.config.user_data
  vpc_id              = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs.example.actual_image_id : string
# ctyun_ecs.example.create_time : string
# ctyun_ecs.example.eip_address : string
# ctyun_ecs.example.expire_time : string
# ctyun_ecs.example.id : string
# ctyun_ecs.example.master_order_id : string
# ctyun_ecs.example.master_port_id : string
# ctyun_ecs.example.name : string
# ctyun_ecs.example.system_disk_id : string
# ctyun_ecs.example.update_time : string
```

</details>
