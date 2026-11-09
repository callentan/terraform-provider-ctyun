# ctyun_mongodb_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mongodb_instance.tf) · [源码](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L125) · [原文档](../../../docs/resources/mongodb_instance.md)

**产品分类：** 文档数据库服务（MongoDB）。**用途：** 管理MongoDB实例。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 16 / 8；递归展开后可配置 24，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L156) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写，当cycle_count&lt;12，到期自动续订1个月，当cycle_count&gt;=12，到期自动续订12个月 |
| [<code>availability_zone_info</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L315) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | mongodb实例节点指定可用区字段，选填。若不填写，将按节点个数均匀分布到各个可用区上。若需要填写可参考提供的examples 支持更新 |
| [<code>availability_zone_info&#91;&#93;.availability_zone_count</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L327) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 资源池可用区总数（开通集群版--nodeType为mongos时范围为&#91;2,16&#93;，nodeType为shard时,shard数量取值范围&#91;2,16&#93;，每一个shard对应3个availabilityZoneCount, 例：nodeType: shard且要开通shard数 量为3时，availabilityZoneCount:9 ；nodeType为config时节点默认为3即availabilityZoneCount: 3） 支持更新 |
| [<code>availability_zone_info&#91;&#93;.availability_zone_name</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L320) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源池可用区名称 支持更新 |
| [<code>availability_zone_info&#91;&#93;.node_type</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L334) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | master:主节点、mongos:mongos节点、shard:shard节点 、config:config节点（存储类型storageType与shard节点一致，存储空间storageSpace为单个shard的storageSpace）、 backup:备份机(存储类型storageType与shard 节点一致，存储空间storageSpace为shard节点数量乘以单个shard的storageSpace) 支持更新 |
| [<code>backup_storage_type</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L364) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | backup节点存储类型，创建时必填，导入时可不填，取值范围：SATA, SAS, SSD, OS（对象存储）。当选择OS时，需要注意当前资源池是否支持对象存储 |
| [<code>cycle_count</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L139) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数当且仅当在cycle_type为month时填写，支持传递1-36 |
| [<code>cycle_type</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L129) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，on_demand：按需。当此值为month时，cycle_count为必填 |
| [<code>flavor_name</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L188) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 规格名称，形如c7.2xlarge.4，可从data.ctyun_mongodb_specs查询支持的规格。支持更新 |
| [<code>mongos_num</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L352) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | mongos节点数量，mongodb为集群版需填写，支持更新。默认为2，取值范围：2~32 |
| [<code>name</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L215) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称（长度在 4 到 64个字符，必须以字母开头，不区分大小写，可以包含字母、数字、中划线或下划线，不能包含其他特殊字符），支持更新。 |
| [<code>password</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L224) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 实例密码，创建时必填，导入时不填。长度为8~26个字符，必须包含大写字母、小写字母、数字和特殊字符~!@#%^*_=+ 支持更新 |
| [<code>prod_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L239) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 产品id，开通时用于确定开通单机/集群版/副本集和版本，创建时必填，导入时不填。支持更新，推荐取值方式（1）。分为两种方式取值：1）数值型，具体取值可以通过data.ctyun_mysql_specs.specs.prod_id获取。2）字符型，取值范围包括：Single34（3.4单机版）,Single40（4.0单机版）,Replica3R34（3.4副本集三副本）,Replica3R40（4.0副本集三副本）,Replica5R34（3.4副本集五副本）,Replica5R40（4.0副本集五副本）,Replica7R34（3.4副本集七副本）,Replica7R40（4.0副本集七副本）,Cluster34（3.4集群版）,Cluster40（4.0集群版）,Single42（4.2单机版）,Replica3R42（4.2副本集三副本）,Replica5R42（4.2副本集五副本）,Replica7R42（4.2副本集七副本）,Cluster42（4.2集群版）,Single50（5.0单机版）,Replica3R50（5.0副本集三副本）,Replica5R50（5.0副本集五副本）,Replica7R50（5.0副本集七副本）,Cluster50（5.0集群版）,Cluster60（6.0集群版）,Replica3R60（6.0副本集三副本）,Replica5R60（6.0副本集五副本）,Replica7R60（6.0副本集七副本）,Single60（6.0单机版） |
| [<code>project_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L247) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>read_only_count</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L381) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 从节点数量 支持更新 |
| [<code>read_port</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L266) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 读端口,支持更新。若需要更新读取端口时可填，取值范围：1~65535 |
| [<code>region_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L166) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 区域id,如果不填这默认使用provider ctyun总region_id 或者环境变量 |
| [<code>security_group_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L205) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组Id |
| [<code>shard_num</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L344) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | shard节点数量，mongodb为集群版需填写，支持更新。默认为2，取值范围：2~32 |
| [<code>storage_space</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L306) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(100)</code> | 主存储空间（单位GB），默认为100，支持更新。取值范围：10-6144，backup节点为单个shard的容量乘以shard的个数 |
| [<code>storage_type</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L294) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("SSD")</code> | 存储类型，默认为SSD。取值范围：SSD=超高IO, SAS=高IO, SATA=普通IO，SSD-genric=通用型SSD，XSSD-0，XSSD-1，XSSD-2 |
| [<code>subnet_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L195) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网Id |
| [<code>upgrade_node_type</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L374) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 当实例为集群版，若升配mongos、shard节点个数时可填写，支持更新。取值范围：shard, mongos |
| [<code>vpc_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L178) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云Id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>backup_storage_space</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L360) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | backup节点磁盘空间，当前不支持指定。默认与存储空间相同 |
| [<code>create_time</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L389) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>eip_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L285) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | eip Id |
| [<code>expire_time</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L396) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>host_ip</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L274) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主机ip |
| [<code>id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L289) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | mongodb实例id |
| [<code>master_order_id</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L259) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单id |
| [<code>prod_running_status</code>](../../../internal/service/mongodb/resource_ctyun_mongodb_instance.go#L281) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 实例运行状态: 0-&gt;运行正常, 1-&gt;重启中, 2-备份操作中, 3-&gt;恢复操作中,4-&gt;转换ssl,5-&gt;异常,6-&gt;修改参数组中,7-&gt;已冻结,8-&gt;已注销,9-&gt;施工中,10-&gt;施工失败,11-&gt;扩容中,12-&gt;主备切换中 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>availability_zone_info&#91;&#93;.availability_zone_count</code> | <code>int32validator.Between(1, 16)</code> | — |
| <code>availability_zone_info&#91;&#93;.availability_zone_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>availability_zone_info&#91;&#93;.node_type</code> | <code>stringvalidator.OneOf(business.MongodbNodeType...)</code> | — |
| <code>backup_storage_type</code> | <code>stringvalidator.OneOf(business.StorageTypeSATA, business.StorageTypeSAS, business.StorageTypeSSD, business.BackupStorageTypeOS)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.Between(1, 36)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand, business.OrderCycleTypeMonth)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>flavor_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>host_ip</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>mongos_num</code> | <code>int32validator.Between(2, 32)</code> | — |
| <code>name</code> | <code>stringvalidator.LengthBetween(4, 64)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9_-&#93;*$"), "实例名称不符合规范")</code> | — |
| <code>password</code> | <code>validator2.DBPassword(<br>						8,<br>						26,<br>						4,<br>						"MongoDB",<br>						"~!@#%^*_=+",<br>					)</code> | — |
| <code>prod_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>read_only_count</code> | <code>int32validator.Between(0, 5)</code> | — |
| <code>read_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_id</code> | <code>validator2.SecurityGroupValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>shard_num</code> | <code>int32validator.Between(2, 32)</code> | — |
| <code>storage_space</code> | <code>int32validator.Between(10, 6144)</code> | — |
| <code>storage_type</code> | <code>stringvalidator.OneOf(business.MongodbStorageType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>upgrade_node_type</code> | <code>stringvalidator.OneOf("shard", "mongos")</code> | — |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 11 / 24 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>availability_zone_info</code>、<code>availability_zone_info&#91;&#93;.availability_zone_count</code>、<code>availability_zone_info&#91;&#93;.availability_zone_name</code>、<code>availability_zone_info&#91;&#93;.node_type</code>、<code>cycle_count</code>、<code>mongos_num</code>、<code>project_id</code>、<code>read_only_count</code>、<code>read_port</code>、<code>region_id</code>、<code>shard_num</code>、<code>upgrade_node_type</code>。

**examples 源文件：** [examples/resources/ctyun_mongodb_instance/resource.tf](../../../examples/resources/ctyun_mongodb_instance/resource.tf)；未完整展示，显式展示 11 / 24。

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
  description = "Complete configurable shape for ctyun_mongodb_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew = optional(bool)
    availability_zone_info = optional(list(object({
      availability_zone_count = number
      availability_zone_name  = string
      node_type               = string
    })))
    backup_storage_type = optional(string)
    cycle_count         = optional(number)
    cycle_type          = string
    flavor_name         = optional(string)
    mongos_num          = optional(number)
    name                = string
    password            = optional(string)
    prod_id             = optional(string)
    project_id          = optional(string)
    read_only_count     = optional(number)
    read_port           = optional(number)
    region_id           = optional(string)
    security_group_id   = string
    shard_num           = optional(number)
    storage_space       = optional(number)
    storage_type        = optional(string)
    subnet_id           = string
    upgrade_node_type   = optional(string)
    vpc_id              = string
  })
}

resource "ctyun_mongodb_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_info = var.config.availability_zone_info
  backup_storage_type    = var.config.backup_storage_type
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  mongos_num             = var.config.mongos_num
  name                   = var.config.name
  password               = var.config.password
  prod_id                = var.config.prod_id
  project_id             = var.config.project_id
  read_only_count        = var.config.read_only_count
  read_port              = var.config.read_port
  region_id              = var.config.region_id
  security_group_id      = var.config.security_group_id
  shard_num              = var.config.shard_num
  storage_space          = var.config.storage_space
  storage_type           = var.config.storage_type
  subnet_id              = var.config.subnet_id
  upgrade_node_type      = var.config.upgrade_node_type
  vpc_id                 = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mongodb_instance.example.backup_storage_space : number
# ctyun_mongodb_instance.example.create_time : string
# ctyun_mongodb_instance.example.eip_id : string
# ctyun_mongodb_instance.example.expire_time : string
# ctyun_mongodb_instance.example.host_ip : string
# ctyun_mongodb_instance.example.id : string
# ctyun_mongodb_instance.example.master_order_id : string
# ctyun_mongodb_instance.example.prod_running_status : number
```

</details>
