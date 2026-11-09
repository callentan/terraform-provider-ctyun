# ctyun_mysql_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mysql_instance.tf) · [源码](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L127) · [原文档](../../../docs/resources/mysql_instance.md)

**产品分类：** 关系数据库MySQL版。**用途：** 管理MySQL实例。

**属性数：** 顶层必填 / 可选 / 只读为 8 / 11 / 19；递归展开后可配置 22，只读 19（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L179) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写，当cycle_count&lt;12，到期自动续订1个月，当cycle_count&gt;=12，到期自动续订12个月 |
| [<code>availability_zone_info</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L297) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 可用区信息，支持更新。需要根据prod_id而定。创建阶段，需要指定master和slave的所在az。例：若一主一备，需要传参：&#91;｛'availability_zone_name':'xxxx', 'availability_zone_count':1,node_type:'master'｝,｛'availability_zone_name':'xxxx', 'availability_zone_count':1,node_type:'slave'｝&#93;；在更新阶段，仅需要填写扩容部分的AZ信息。例：将单节点扩容至1主2备，&#91;{'availability_zone_name':'xxxx', 'availability_zone_count':2,node_type:'slave'}&#93; |
| [<code>availability_zone_info&#91;&#93;.availability_zone_count</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L309) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 该AZ内存在的实例节点数量，支持更新。 |
| [<code>availability_zone_info&#91;&#93;.availability_zone_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L302) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源池可用区名称，支持更新。 |
| [<code>availability_zone_info&#91;&#93;.node_type</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L316) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 表示分布AZ的节点类型，master/slave，支持更新。 |
| [<code>backup_storage_space</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L288) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(100)</code> | 备份存储空间(单位:G，范围100,32768)，若storage_space和backup_storage_space都不为空，优先升配备份节点存储空间，支持更新 |
| [<code>backup_storage_type</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L278) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 备份空间磁盘存储类型：SSD=超高IO，SATA=普通IO，SAS=高IO |
| [<code>cycle_count</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L148) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数当且仅当在cycle_type为month时填写，支持传递1-36 |
| [<code>cycle_type</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L138) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，on_demand：按需。当此值为month时，cycle_count为必填 |
| [<code>flavor_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L131) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 规格名称，创建时必填，导入时不填。形如c7.2xlarge.4，可从data.ctyun_mysql_specs查询支持的规格，支持更新 |
| [<code>name</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L231) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称，支持更新。要求：长度在 4 到 64个字符，必须以字母开头，不区分大小写，可以包含字母、数字、中划线或下划线，不能包含其他特殊字符 |
| [<code>password</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L239) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 实例密码，支持更新。密码为8-26位，需为字母、数字和特殊字符~!@#$%^*_-+{&#91;&#93;}:,.?/的组合，区分大小写 |
| [<code>prod_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L253) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 产品id，推荐取值方式（1）。分为两种方式取值：1）数值型，具体取值可以通过data.ctyun_mysql_specs.specs.prod_id获取。2）字符型，取值范围：Single57（单实例5.7版本）, Single80（单实例8.0版本）, MasterSlave57（一主一备5.7版本）, MasterSlave80（一主一备8.0版本）, Master2Slave57（一主两备5.7版本）, Master2Slave80（一主两备8.0版本）。在更新时，不支持prod_id（节点）和prod_performance_spec（规格）同时更新。 |
| [<code>project_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L340) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L189) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>running_control</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L418) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 控制是否暂停，启用和重启实例，支持更新，取值范围：freeze, unfreeze, restart |
| [<code>security_group_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L221) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组Id |
| [<code>storage_space</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L271) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 主存储空间（单位GB），范围100-32768。取值为10的整数倍，支持更新 |
| [<code>storage_type</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L261) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 存储类型: SSD=超高IO、SATA=普通IO，SAS=高IO，SSD-genric=通用型SSD，FAST-SSD=极速型SSD，XSSD-0，XSSD-1，XSSD-2 |
| [<code>subnet_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L211) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网Id |
| [<code>vpc_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L201) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云Id |
| [<code>write_port</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L363) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 写数据端口，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>audit_log_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L398) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 日志审计开关 |
| [<code>create_time</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L165) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>eip</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L382) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性ip |
| [<code>eip_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L386) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 弹性ip状态 0-&gt;unbind，1-&gt;bind,2-&gt;binding |
| [<code>expire_time</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L172) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L429) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实例Id，同instance_id |
| [<code>inst_release_protection_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L402) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 实例释放保护开关 1:on,0:off |
| [<code>instance_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L333) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实例Id |
| [<code>master_order_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L326) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单id |
| [<code>mysql_port</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L410) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 数据库端口 |
| [<code>new_mysql_version</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L394) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | mysql版本 |
| [<code>pause_enable</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L406) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否允许暂停 |
| [<code>prod_db_engine</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L378) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 数据库引擎 |
| [<code>prod_order_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L425) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 0.正常 1.欠费暂停 2.已注销 3.创建中 4.施工失败 5.到期退订状态 6.新增的状态-openApi暂停 7.创建完成等待变更单 8.待注销 9.手动暂停 10.手动退订 |
| [<code>prod_running_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L352) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 0.正常 1.重启中 2.备份中 3.恢复中 4.修改参数中 5.应用参数组中 6.扩容预处理中 7.扩容预处理完成 8.修改端口中 9.迁移中 10.重置密码中 11.修改数据复制方式中 12.缩容预处理中 13.缩容预处理完成 15.内核小版本升级 17.迁移可用区中 18.修改备份配置中 20.停止中 21.已停止 22.启动中 26.白名单配置中 |
| [<code>read_port</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L374) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 读端口 |
| [<code>security_group_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L414) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 安全组状态 0-&gt;normal, 1-&gt;changing, 2-&gt;deleted |
| [<code>ssl_status</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L390) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | Ssl状态 0-&gt;off，1-&gt;on |
| [<code>vip</code>](../../../internal/service/mysql/resource_ctyun_mysql_instance.go#L359) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 虚拟IP地址 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>availability_zone_info&#91;&#93;.availability_zone_count</code> | <code>int32validator.Between(1, 16)</code> | — |
| <code>availability_zone_info&#91;&#93;.availability_zone_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>availability_zone_info&#91;&#93;.node_type</code> | <code>stringvalidator.OneOf("master", "slave")</code> | — |
| <code>backup_storage_space</code> | <code>int32validator.Between(100, 32768)</code> | — |
| <code>backup_storage_type</code> | <code>stringvalidator.OneOf(business.StorageTypeSSD, business.StorageTypeSATA, business.StorageTypeSAS)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.Between(1, 36)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand, business.OrderCycleTypeMonth)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>flavor_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(4, 64)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;0-9a-zA-Z_-&#93;+$"), "终端节点服务名称不符合规则")</code> | — |
| <code>password</code> | <code>validator2.DBPassword(<br>						8,<br>						26,<br>						3,<br>						"MYSQL",<br>						"~!@#$%^*_-+{&#91;&#93;}:,.?/",<br>					)</code> | — |
| <code>prod_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>prod_running_status</code> | <code>int32validator.Between(0, 26)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>running_control</code> | <code>stringvalidator.OneOf("freeze", "unfreeze", "restart")</code> | — |
| <code>security_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>storage_space</code> | <code>int32validator.Between(100, 32768)</code> | — |
| <code>storage_type</code> | <code>stringvalidator.OneOf(business.StorageType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>write_port</code> | <code>int32validator.Between(0, 65535)</code> | <code>int32planmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 5 个有效 HCL 目标块合并后，显式展示 10 / 22 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>availability_zone_info</code>、<code>availability_zone_info&#91;&#93;.availability_zone_count</code>、<code>availability_zone_info&#91;&#93;.availability_zone_name</code>、<code>availability_zone_info&#91;&#93;.node_type</code>、<code>backup_storage_space</code>、<code>backup_storage_type</code>、<code>cycle_count</code>、<code>project_id</code>、<code>region_id</code>、<code>running_control</code>、<code>write_port</code>。

**examples 源文件：** [examples/resources/ctyun_mysql_instance/resource.tf](../../../examples/resources/ctyun_mysql_instance/resource.tf)；未完整展示，显式展示 10 / 22。

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
  description = "Complete configurable shape for ctyun_mysql_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew = optional(bool)
    availability_zone_info = optional(list(object({
      availability_zone_count = number
      availability_zone_name  = string
      node_type               = string
    })))
    backup_storage_space = optional(number)
    backup_storage_type  = optional(string)
    cycle_count          = optional(number)
    cycle_type           = string
    flavor_name          = optional(string)
    name                 = string
    password             = optional(string)
    prod_id              = string
    project_id           = optional(string)
    region_id            = optional(string)
    running_control      = optional(string)
    security_group_id    = string
    storage_space        = number
    storage_type         = string
    subnet_id            = string
    vpc_id               = string
    write_port           = optional(number)
  })
}

resource "ctyun_mysql_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_info = var.config.availability_zone_info
  backup_storage_space   = var.config.backup_storage_space
  backup_storage_type    = var.config.backup_storage_type
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  name                   = var.config.name
  password               = var.config.password
  prod_id                = var.config.prod_id
  project_id             = var.config.project_id
  region_id              = var.config.region_id
  running_control        = var.config.running_control
  security_group_id      = var.config.security_group_id
  storage_space          = var.config.storage_space
  storage_type           = var.config.storage_type
  subnet_id              = var.config.subnet_id
  vpc_id                 = var.config.vpc_id
  write_port             = var.config.write_port
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_instance.example.audit_log_status : number
# ctyun_mysql_instance.example.create_time : string
# ctyun_mysql_instance.example.eip : string
# ctyun_mysql_instance.example.eip_status : number
# ctyun_mysql_instance.example.expire_time : string
# ctyun_mysql_instance.example.id : string
# ctyun_mysql_instance.example.inst_release_protection_status : number
# ctyun_mysql_instance.example.instance_id : string
# ctyun_mysql_instance.example.master_order_id : string
# ctyun_mysql_instance.example.mysql_port : string
# ctyun_mysql_instance.example.new_mysql_version : string
# ctyun_mysql_instance.example.pause_enable : bool
# ctyun_mysql_instance.example.prod_db_engine : string
# ctyun_mysql_instance.example.prod_order_status : number
# ctyun_mysql_instance.example.prod_running_status : number
# ctyun_mysql_instance.example.read_port : string
# ctyun_mysql_instance.example.security_group_status : number
# ctyun_mysql_instance.example.ssl_status : number
# ctyun_mysql_instance.example.vip : string
```

</details>
