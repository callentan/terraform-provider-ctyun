# ctyun_postgresql_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_postgresql_instance.tf) · [源码](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L122) · [原文档](../../../docs/resources/postgresql_instance.md)

**产品分类：** 关系数据库PostgreSQL版。**用途：** 管理PostgreSQL实例。

**属性数：** 顶层必填 / 可选 / 只读为 8 / 13 / 14；递归展开后可配置 24，只读 14（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L281) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，当cycle_type不等于on_demand时才可填写，当cycle_count&lt;12，到期自动续订1个月，当cycle_count&gt;=12，到期自动续订12个月 |
| [<code>availability_zone_info</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L319) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | pgsql实例节点指定可用区字段，选填，若未填写根据实例节点数分配至各个az。示例：若创建一个一主两备的pgsql，对应的availability_zone_info为：&#91;{availabilityZoneName:cn-huadong1-jsnj1A-public-ctcloud,availabilityZoneCount:1,nodeType:master},{availabilityZoneName:cn-huadong1-jsnj1A-public-ctcloud,availabilityZoneCount:1,nodeType:slave},{availabilityZoneName:cn-huadong1-jsnj1A-public-ctcloud,availabilityZoneCount:1,nodeType:slave}&#93; |
| [<code>availability_zone_info&#91;&#93;.availability_zone_count</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L334) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 资源池可用区总数，支持更新。 |
| [<code>availability_zone_info&#91;&#93;.availability_zone_name</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L327) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源池可用区名称，支持更新。可以根据data.ctyun_zones查询 |
| [<code>availability_zone_info&#91;&#93;.node_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L341) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 节点类型(master/slave)，支持更新。 |
| [<code>backup_storage_space</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L190) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 备份存储空间大小。支持更新，主存储空间(storage_space)若备份存储空间(backup_storage_space)同时更新，先更新backup_storage_space。 |
| [<code>backup_storage_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L163) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 备份存储类型: OS=对象存储, SSD=超高IO, SATA=普通IO, SAS=高IO。注：当填写OS时，无需填写backup_storage_size。当选择OS时，需要注意当前资源池是否支持对象存储 |
| [<code>case_sensitive</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L292) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否区分大小写: true=区分, false=不区分。默认不区分 |
| [<code>cycle_count</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L264) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数当且仅当在cycle_type为month时填写，支持传递1-36 |
| [<code>cycle_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L126) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，on_demand：按需。当此值为month时，cycle_count为必填 |
| [<code>flavor_name</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L148) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 规格名称，创建时必填，导入时可不填。形如c7.2xlarge.4，可从data.ctyun_postgresql_specs查询支持的规格，支持更新。 |
| [<code>is_mgr</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L312) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否开启MRG，默认false |
| [<code>name</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L242) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称（长度在 4 到 64个字符，必须以字母开头，不区分大小写，可以包含字母、数字、中划线或下划线，不能包含其他特殊字符）。支持更新，但不支持更新为重名实例名称 |
| [<code>password</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L249) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 实例密码，支持更新，导入时不填。8-32位由大写字母、小写字母、数字、特殊字符中的任意三种组成 特殊字符为!@#$%^&amp;*()_+-= |
| [<code>prod_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L155) | <code>number</code><br><code>Int64Attribute</code> | R | 否 | — | 产品ID，支持更新。取值可以根据data.ctyun_postgresql_specs查询 |
| [<code>project_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L300) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID。若环境变量为空，则默认为0 |
| [<code>region_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L136) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>running_control</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L396) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 控制是否暂停，启用和重启实例。支持更新，取值范围：stop, start, restart |
| [<code>security_group_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L222) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组Id，支持多个安全组，用英文逗号分割(,)。支持更新，最少得有一个安全组 |
| [<code>storage_space</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L183) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 主存储空间（单位GB），范围100-32768。支持更新，扩容过程中不支持磁盘(storage_space, backup_storage_space)、规格(flavor_name)和实例(pord_id)扩容同时进行 |
| [<code>storage_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L173) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主存储类型, SSD=超高IO, SSD-genric=通用型SSD, FAST-SSD=极速型SSD（极速型SSD云硬盘仅支持挂载至vCPU数量至少为16且为6代以上的计算增强型和内存优化型云主机）,XSSD-0, XSSD-1, XSSD-2 |
| [<code>subnet_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L212) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网Id |
| [<code>vip</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L229) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | VIP地址 |
| [<code>vpc_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L202) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云Id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>alive</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L356) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 实例是否存活,0:存活，-1:异常 |
| [<code>create_time</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L410) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>disk_rated</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L360) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 磁盘使用率， 该字段已废弃 |
| [<code>expire_time</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L417) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L351) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | postgresql实例id |
| [<code>master_order_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L403) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主订单id |
| [<code>outer_prod_inst_id</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L364) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 对外的实例ID，对应PaaS平台 |
| [<code>prod_db_engine</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L368) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 数据库实例引擎 |
| [<code>prod_order_status</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L372) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 订单状态，0：正常，1：冻结，2：删除，3：操作中，4：失败,2005:扩容中 |
| [<code>prod_running_status</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L376) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 实例状态 |
| [<code>prod_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L380) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 实例部署方式 0：单机部署,1：主备部署 |
| [<code>read_port</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L384) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 读端口 |
| [<code>tool_type</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L392) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 备份工具类型，1：pg_baseback, 2：pgbackrest, 3：s3 |
| [<code>write_port</code>](../../../internal/service/pgsql/resource_ctyun_postgresql_instance.go#L388) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 写端口 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>availability_zone_info&#91;&#93;.availability_zone_count</code> | <code>int32validator.Between(1, 16)</code> | — |
| <code>availability_zone_info&#91;&#93;.availability_zone_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>availability_zone_info&#91;&#93;.node_type</code> | <code>stringvalidator.OneOf("master", "slave")</code> | — |
| <code>backup_storage_space</code> | <code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("backup_storage_type"),<br>						types.StringValue(business.BackupStorageTypeOS),<br>					)</code> | — |
| <code>backup_storage_type</code> | <code>stringvalidator.OneOf(business.StorageTypeSSD, business.StorageTypeSATA, business.StorageTypeSAS, business.BackupStorageTypeOS)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>case_sensitive</code> | — | <code>explanmodifier.NullIgnoreBool()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.Between(1, 36)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand, business.OrderCycleTypeMonth)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>flavor_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>is_mgr</code> | — | <code>explanmodifier.NullIgnoreBool()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(4, 64)</code> | — |
| <code>password</code> | <code>validator2.DBPassword(<br>						8,<br>						32,<br>						3,<br>						"PGSQL",<br>						"!@#$%^&amp;*()_+-=",<br>					)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>running_control</code> | <code>stringvalidator.OneOf("stop", "start", "restart")</code> | — |
| <code>security_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>storage_space</code> | <code>int32validator.Between(100, 32768)</code> | — |
| <code>storage_type</code> | <code>stringvalidator.OneOf(business.StorageTypeSSD, business.StorageTypeSSDGenric, business.StorageTypeFASTSSD, business.StorageTypeXSSD0, business.StorageTypeXSSD1, business.StorageTypeXSSD2)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vip</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 4 个有效 HCL 目标块合并后，显式展示 12 / 24 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>availability_zone_info</code>、<code>availability_zone_info&#91;&#93;.availability_zone_count</code>、<code>availability_zone_info&#91;&#93;.availability_zone_name</code>、<code>availability_zone_info&#91;&#93;.node_type</code>、<code>backup_storage_space</code>、<code>cycle_count</code>、<code>is_mgr</code>、<code>project_id</code>、<code>region_id</code>、<code>running_control</code>、<code>vip</code>。

**examples 源文件：** [examples/resources/ctyun_postgresql_instance/resource.tf](../../../examples/resources/ctyun_postgresql_instance/resource.tf)；未完整展示，显式展示 12 / 24。

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
  description = "Complete configurable shape for ctyun_postgresql_instance; consult constraints before use."
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
    case_sensitive       = optional(bool)
    cycle_count          = optional(number)
    cycle_type           = string
    flavor_name          = optional(string)
    is_mgr               = optional(bool)
    name                 = string
    password             = optional(string)
    prod_id              = number
    project_id           = optional(string)
    region_id            = optional(string)
    running_control      = optional(string)
    security_group_id    = string
    storage_space        = number
    storage_type         = string
    subnet_id            = string
    vip                  = optional(string)
    vpc_id               = string
  })
}

resource "ctyun_postgresql_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_info = var.config.availability_zone_info
  backup_storage_space   = var.config.backup_storage_space
  backup_storage_type    = var.config.backup_storage_type
  case_sensitive         = var.config.case_sensitive
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  is_mgr                 = var.config.is_mgr
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
  vip                    = var.config.vip
  vpc_id                 = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_instance.example.alive : number
# ctyun_postgresql_instance.example.create_time : string
# ctyun_postgresql_instance.example.disk_rated : number
# ctyun_postgresql_instance.example.expire_time : string
# ctyun_postgresql_instance.example.id : string
# ctyun_postgresql_instance.example.master_order_id : string
# ctyun_postgresql_instance.example.outer_prod_inst_id : string
# ctyun_postgresql_instance.example.prod_db_engine : string
# ctyun_postgresql_instance.example.prod_order_status : number
# ctyun_postgresql_instance.example.prod_running_status : number
# ctyun_postgresql_instance.example.prod_type : number
# ctyun_postgresql_instance.example.read_port : number
# ctyun_postgresql_instance.example.tool_type : number
# ctyun_postgresql_instance.example.write_port : string
```

</details>
