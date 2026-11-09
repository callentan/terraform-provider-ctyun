# ctyun_vpc_route_table_rule

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_vpc_route_table_rule.tf) · [源码](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L58) · [原文档](../../../docs/resources/vpc_route_table_rule.md)

**产品分类：** 虚拟私有云（Virtual Private Cloud，VPC）。**用途：** 管理虚拟私有云路由表规则。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 2 / 2；递归展开后可配置 7，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L138) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 规则描述，支持更新 |
| [<code>destination</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L118) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 无类别域间路由，例如：192.168.0.1/32 |
| [<code>ip_version</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L128) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 4标识ipv4,6标识ipv6 |
| [<code>next_hop_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L98) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 下一跳设备id |
| [<code>next_hop_type</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L108) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 下一跳设备类型，支持vpcpeering、havip、bm、vm、natgw、igw、igw6、dc、ticc、vpngw、enic |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L76) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>route_table_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L88) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 路由表id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L62) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>rule_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table_rule.go#L69) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 规则id |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>destination</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>ip_version</code> | <code>int32validator.OneOf(4, 6)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>next_hop_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>next_hop_type</code> | <code>stringvalidator.OneOf(NextHopType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>route_table_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rule_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 6 / 7 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_vpc_route_table_rule/resource.tf](../../../examples/resources/ctyun_vpc_route_table_rule/resource.tf)；未完整展示，显式展示 6 / 7。

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
  description = "Complete configurable shape for ctyun_vpc_route_table_rule; consult constraints before use."
  nullable    = false
  type = object({
    description    = optional(string)
    destination    = string
    ip_version     = number
    next_hop_id    = string
    next_hop_type  = string
    region_id      = optional(string)
    route_table_id = string
  })
}

resource "ctyun_vpc_route_table_rule" "example" {
  description    = var.config.description
  destination    = var.config.destination
  ip_version     = var.config.ip_version
  next_hop_id    = var.config.next_hop_id
  next_hop_type  = var.config.next_hop_type
  region_id      = var.config.region_id
  route_table_id = var.config.route_table_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_route_table_rule.example.id : string
# ctyun_vpc_route_table_rule.example.rule_id : string
```

</details>
