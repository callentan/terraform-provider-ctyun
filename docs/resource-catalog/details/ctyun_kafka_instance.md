# ctyun_kafka_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_kafka_instance.tf) · [源码](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L92) · [原文档](../../../docs/resources/kafka_instance.md)

**产品分类：** 分布式消息服务Kafka。**用途：** 管理KAFKA实例。

**属性数：** 顶层必填 / 可选 / 只读为 10 / 13 / 7；递归展开后可配置 23，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L325) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写 |
| [<code>auto_renew_cycle_count</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L335) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 自动续订时长，当且仅当auto_renew为true时填写。支持自动续订范围：1-6月 |
| [<code>cycle_count</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L307) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month时才生效，当cycle_type=month，支持传递1、2、3、4、5、6、12、24、36，从按需变为包周期时支持更新 |
| [<code>cycle_type</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L300) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，on_demand：按需。当此值为month时，cycle_count为必填，支持更新 |
| [<code>disk_size</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L197) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 单个节点的磁盘存储空间，单位为GB，存储空间取值范围100GB ~ 10000，并且为100的倍数。实例总存储空间为diskSize * nodeNum，支持更新，不支持缩容 |
| [<code>disk_type</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L187) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 磁盘类型，建议使用ctyun_kafka_specs查看，通常支持SAS、SSD、FAST-SSD |
| [<code>enable_ipv6</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L234) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否启用IPv6，默认为false |
| [<code>engine_version</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L149) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.KafkaVersion36)</code> | 实例引擎版本，支持2.8和3.6，默认3.6 |
| [<code>http_port</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L279) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(8082)</code> | HTTP接入点端口，范围在8000到9100之间，默认为8082 |
| [<code>instance_name</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L141) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称，长度4~40个字符，大小写字母开头，只能包含大小写字母、数字及分隔符(-)，大小写字母或数字结尾，实例名称不可重复，支持更新 |
| [<code>node_num</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L168) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 节点数。单机版为1个，集群版3~50个，支持更新，不支持缩容 |
| [<code>plain_port</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L243) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(8090)</code> | 公共接入点(PLAINTEXT)端口，范围在8000到9100之间，默认为8090 |
| [<code>project_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L129) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L117) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>restart</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L353) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否重启 |
| [<code>retention_hours</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L291) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(72)</code> | 实例消息保留时长，单位小时。默认为72小时，可选1~10000小时，重启后生效，支持更新 |
| [<code>sasl_port</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L255) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(8092)</code> | 安全接入点(SASL_PLAINTEXT)端口，范围在8000到9100之间，默认为8092 |
| [<code>security_group_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L224) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组ID |
| [<code>spec_name</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L161) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例的规格类型，建议使用ctyun_kafka_specs查看，也可查看&lt;a href="https://www.ctyun.cn/document/10029624/10030704"&gt;产品规格说明&lt;/a&gt;，支持更新 |
| [<code>ssl_port</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L267) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(8098)</code> | SSL接入点(SASL_SSL)端口，范围在8000到9100之间，默认为8098。 |
| [<code>subnet_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L214) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |
| [<code>vpc_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L204) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |
| [<code>zone_list</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L175) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 实例所在可用区信息，只能传一个或三个可用区，可通过ctyun_regions查看 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>actual_cycle_type</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L318) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 服务端当前实际计费类型（可能与 cycle_type 不一致，如包周期未到期时）。 |
| [<code>create_time</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L361) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，UTC格式 |
| [<code>expire_time</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L368) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L96) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>last_restart_time</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L357) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 上一次重启时间，UTC格式 |
| [<code>master_order_id</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L110) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主订单号 |
| [<code>name</code>](../../../internal/service/kafka/resource_ctyun_kafka_instance.go#L103) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 名称 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>actual_cycle_type</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("cycle_type"))</code> |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>auto_renew_cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("auto_renew"),<br>						types.BoolValue(true),<br>					)</code><br><code>validator2.ConflictsWithEqualInt32(<br>						path.MatchRoot("auto_renew"),<br>						types.BoolValue(false),<br>					)</code><br><code>int32validator.Between(1, 6)</code> | <code>explanmodifier.NullIgnoreInt32()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.OneOf(1, 2, 3, 5, 6, 7, 12, 24, 36)</code> | — |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeMonth, business.OrderCycleTypeOnDemand)</code> | — |
| <code>disk_size</code> | <code>int32validator.Between(100, 10000)</code> | — |
| <code>disk_type</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>enable_ipv6</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>engine_version</code> | <code>stringvalidator.OneOf(business.KafkaVersion28, business.KafkaVersion36)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>explanmodifier.UseStringStateIfDependencyUnchanged(path.Root("cycle_type"))</code> |
| <code>http_port</code> | <code>int32validator.Between(8000, 9100)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_name</code> | <code>stringvalidator.LengthBetween(4, 40)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z0-9&#93;(?:&#91;a-zA-Z0-9&#93;&#124;&#91;-&#93;&#91;a-zA-Z0-9&#93;)+$"), "实例名称不符合规则")</code> | — |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | — | <code>explanmodifier.UseDependencyForUnknown(path.Root("instance_name"))</code> |
| <code>node_num</code> | <code>int32validator.Between(1, 50)</code> | — |
| <code>plain_port</code> | <code>int32validator.Between(8000, 9100)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>retention_hours</code> | <code>int32validator.Between(1, 10000)</code> | — |
| <code>sasl_port</code> | <code>int32validator.Between(8000, 9100)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>security_group_id</code> | <code>validator2.SecurityGroupValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>spec_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>ssl_port</code> | <code>int32validator.Between(8000, 9100)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>zone_list</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(stringvalidator.UTF8LengthAtLeast(1))</code> | <code>setplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 12 / 23 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>auto_renew_cycle_count</code>、<code>cycle_count</code>、<code>enable_ipv6</code>、<code>http_port</code>、<code>plain_port</code>、<code>project_id</code>、<code>region_id</code>、<code>restart</code>、<code>sasl_port</code>、<code>ssl_port</code>。

**examples 源文件：** [examples/resources/ctyun_kafka_instance/resource.tf](../../../examples/resources/ctyun_kafka_instance/resource.tf)；未完整展示，显式展示 12 / 23。

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
  description = "Complete configurable shape for ctyun_kafka_instance; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew             = optional(bool)
    auto_renew_cycle_count = optional(number)
    cycle_count            = optional(number)
    cycle_type             = string
    disk_size              = number
    disk_type              = string
    enable_ipv6            = optional(bool)
    engine_version         = optional(string)
    http_port              = optional(number)
    instance_name          = string
    node_num               = number
    plain_port             = optional(number)
    project_id             = optional(string)
    region_id              = optional(string)
    restart                = optional(bool)
    retention_hours        = optional(number)
    sasl_port              = optional(number)
    security_group_id      = string
    spec_name              = string
    ssl_port               = optional(number)
    subnet_id              = string
    vpc_id                 = string
    zone_list              = set(string)
  })
}

resource "ctyun_kafka_instance" "example" {
  auto_renew             = var.config.auto_renew
  auto_renew_cycle_count = var.config.auto_renew_cycle_count
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  disk_size              = var.config.disk_size
  disk_type              = var.config.disk_type
  enable_ipv6            = var.config.enable_ipv6
  engine_version         = var.config.engine_version
  http_port              = var.config.http_port
  instance_name          = var.config.instance_name
  node_num               = var.config.node_num
  plain_port             = var.config.plain_port
  project_id             = var.config.project_id
  region_id              = var.config.region_id
  restart                = var.config.restart
  retention_hours        = var.config.retention_hours
  sasl_port              = var.config.sasl_port
  security_group_id      = var.config.security_group_id
  spec_name              = var.config.spec_name
  ssl_port               = var.config.ssl_port
  subnet_id              = var.config.subnet_id
  vpc_id                 = var.config.vpc_id
  zone_list              = var.config.zone_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_instance.example.actual_cycle_type : string
# ctyun_kafka_instance.example.create_time : string
# ctyun_kafka_instance.example.expire_time : string
# ctyun_kafka_instance.example.id : string
# ctyun_kafka_instance.example.last_restart_time : string
# ctyun_kafka_instance.example.master_order_id : string
# ctyun_kafka_instance.example.name : string
```

</details>
