# ctyun_nat_snat

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_nat_snat.tf) · [源码](../../../internal/service/nat/resource_ctyun_snat.go#L95) · [原文档](../../../docs/resources/nat_snat.md)

**产品分类：** NAT网关（CT-NAT Gateway）。**用途：** 管理公网NAT网关snat规则。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 4 / 5；递归展开后可配置 6，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/nat/resource_ctyun_snat.go#L171) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | SNAT描述，支持更新 |
| [<code>nat_gateway_id</code>](../../../internal/service/nat/resource_ctyun_snat.go#L125) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | NAT网关Id |
| [<code>region_id</code>](../../../internal/service/nat/resource_ctyun_snat.go#L113) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>snat_ips</code>](../../../internal/service/nat/resource_ctyun_snat.go#L161) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 弹性公网IP集合，每个元素为eipID，至少输入1个，最多5个，支持更新 |
| [<code>source_cidr</code>](../../../internal/service/nat/resource_ctyun_snat.go#L148) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 自定义网段，与source_subnet_id有且只能填写一个，支持更新 |
| [<code>source_subnet_id</code>](../../../internal/service/nat/resource_ctyun_snat.go#L135) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 子网ID，需要和NAT网关同属一个VPC，与source_cidr有且只能填写一个，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/nat/resource_ctyun_snat.go#L188) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>eips</code>](../../../internal/service/nat/resource_ctyun_snat.go#L195) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | 绑定的 eip 信息 |
| [<code>eips&#91;&#93;.eip_id</code>](../../../internal/service/nat/resource_ctyun_snat.go#L203) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性 IP id |
| [<code>eips&#91;&#93;.ip_address</code>](../../../internal/service/nat/resource_ctyun_snat.go#L210) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 弹性 IP 地址 |
| [<code>id</code>](../../../internal/service/nat/resource_ctyun_snat.go#L99) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID，同snat_id |
| [<code>snat_id</code>](../../../internal/service/nat/resource_ctyun_snat.go#L106) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | Snat规则的id |
| [<code>subnet_type</code>](../../../internal/service/nat/resource_ctyun_snat.go#L182) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | <code>int32default.StaticInt32(0)</code> | 废弃字段<br>已弃用：废弃字段 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>eips</code> | — | <code>planmodifier2.UseListStateIfDependencyUnchanged(path.Root("snat_ips"))</code> |
| <code>eips&#91;&#93;.eip_id</code> | — | <code>planmodifier2.UseStringStateIfDependencyUnchanged(path.Root("snat_ips"))</code> |
| <code>eips&#91;&#93;.ip_address</code> | — | <code>planmodifier2.UseStringStateIfDependencyUnchanged(path.Root("snat_ips"))</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>nat_gateway_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>snat_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>snat_ips</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.SizeAtMost(5)</code><br><code>setvalidator.ValueStringsAre(validator2.EipValidate())</code> | — |
| <code>source_cidr</code> | <code>validator2.Cidr()</code><br><code>stringvalidator.ExactlyOneOf(path.MatchRoot("source_subnet_id"))</code><br><code>stringvalidator.ConflictsWith(path.MatchRoot("source_subnet_id"))</code> | <code>planmodifier2.UseStringStateIfDependencyUnchanged(path.Root("source_subnet_id"))</code> |
| <code>source_subnet_id</code> | <code>validator2.SubnetValidate()</code><br><code>stringvalidator.ExactlyOneOf(path.MatchRoot("source_cidr"))</code><br><code>stringvalidator.ConflictsWith(path.MatchRoot("source_cidr"))</code> | <code>planmodifier2.UseStringStateIfDependencyUnchanged(path.Root("source_cidr"))</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>region_id</code>、<code>source_subnet_id</code>。

**examples 源文件：** [examples/resources/ctyun_nat_snat/resource.tf](../../../examples/resources/ctyun_nat_snat/resource.tf)；未完整展示，显式展示 3 / 6。

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
  description = "Complete configurable shape for ctyun_nat_snat; consult constraints before use."
  nullable    = false
  type = object({
    description      = optional(string)
    nat_gateway_id   = string
    region_id        = optional(string)
    snat_ips         = set(string)
    source_cidr      = optional(string)
    source_subnet_id = optional(string)
  })
}

resource "ctyun_nat_snat" "example" {
  description      = var.config.description
  nat_gateway_id   = var.config.nat_gateway_id
  region_id        = var.config.region_id
  snat_ips         = var.config.snat_ips
  source_cidr      = var.config.source_cidr
  source_subnet_id = var.config.source_subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_nat_snat.example.create_time : string
# ctyun_nat_snat.example.eips : list(object)
# ctyun_nat_snat.example.eips[*].eip_id : string
# ctyun_nat_snat.example.eips[*].ip_address : string
# ctyun_nat_snat.example.id : string
# ctyun_nat_snat.example.snat_id : string
# ctyun_nat_snat.example.subnet_type : number
```

</details>
