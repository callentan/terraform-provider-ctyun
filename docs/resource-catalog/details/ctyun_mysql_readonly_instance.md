# ctyun_mysql_readonly_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mysql_readonly_instance.tf) · [源码](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L113) · [原文档](../../../docs/resources/mysql_readonly_instance.md)

**产品分类：** 关系数据库MySQL版。**用途：** 管理MySQL只读实例。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 6 / 3；递归展开后可配置 11，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L154) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写，当cycle_count&lt;12，到期自动续订1个月，当cycle_count&gt;=12，到期自动续订12个月 |
| [<code>availability_zone_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L230) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 可用区id，如果不填写，默认为第一个可用区 |
| [<code>cycle_count</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L137) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 订购时长，该参数当且仅当在cycle_type为month时填写，支持传递1-36 |
| [<code>cycle_type</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L127) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，on_demand：按需。当此值为month时，cycle_count为必填 |
| [<code>flavor_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L164) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 规格名称，创建时必填，导入时不填。形如c7.2xlarge.4，可从data.ctyun_mysql_specs查询支持的规格，支持更新。注：只读规格远小于主实例规格时，可能导致创建只读实例失败、复制延迟等风险。 |
| [<code>instance_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L117) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | mysql数据库实例ID，为该实例管理只读实例 |
| [<code>name</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L218) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称，实例名称要求：实例名称 长度4到100，必须以字母或中文开头，只能包含字母(不区分大小写)、中文、数字、-或_ |
| [<code>project_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L186) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L174) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>storage_space</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L208) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 主存储空间（单位GB），范围100-32768。支持更新 |
| [<code>storage_type</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L198) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 存储类型: SSD=超高IO、SATA=普通IO、SAS=高IO、SSD-genric=通用型SSD、FAST-SSD=极速型SSD |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L249) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L256) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/mysql/resource_ctyun_mysql_readonly_instance.go#L242) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 可读实例id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>availability_zone_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code><br><code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>					)</code><br><code>int32validator.Between(1, 36)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt32(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypeOnDemand, business.OrderCycleTypeMonth)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>flavor_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.LengthBetween(32, 32)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(4, 100)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;0-9a-zA-Z_-&#93;+$"), "终端节点服务名称不符合规则")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>storage_space</code> | <code>int32validator.Between(100, 32768)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>storage_type</code> | <code>stringvalidator.OneOf(business.StorageType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 6 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>availability_zone_name</code>、<code>cycle_count</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_mysql_readonly_instance/resource.tf](../../../examples/resources/ctyun_mysql_readonly_instance/resource.tf)；未完整展示，显式展示 6 / 11。

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
  description = "Complete configurable shape for ctyun_mysql_readonly_instance; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew             = optional(bool)
    availability_zone_name = optional(string)
    cycle_count            = optional(number)
    cycle_type             = string
    flavor_name            = optional(string)
    instance_id            = string
    name                   = string
    project_id             = optional(string)
    region_id              = optional(string)
    storage_space          = number
    storage_type           = string
  })
}

resource "ctyun_mysql_readonly_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_name = var.config.availability_zone_name
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  instance_id            = var.config.instance_id
  name                   = var.config.name
  project_id             = var.config.project_id
  region_id              = var.config.region_id
  storage_space          = var.config.storage_space
  storage_type           = var.config.storage_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_readonly_instance.example.create_time : string
# ctyun_mysql_readonly_instance.example.expire_time : string
# ctyun_mysql_readonly_instance.example.id : string
```

</details>
