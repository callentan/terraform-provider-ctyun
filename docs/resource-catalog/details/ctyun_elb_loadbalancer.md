# ctyun_elb_loadbalancer

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_loadbalancer.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L48) · [原文档](../../../docs/resources/elb_loadbalancer.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡。

**属性数：** 顶层必填 / 可选 / 只读为 6 / 10 / 8；递归展开后可配置 16，只读 8（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L251) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 可用区<br>已弃用：废弃字段，请不要指定 |
| [<code>cycle_count</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L223) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长, 当 cycleType = month, 支持订购 1 - 11 个月; 当 cycleType = year, 支持订购 1 - 3 年 |
| [<code>cycle_type</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L213) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：year：按年，month：按月，on_demand：按需。当此值为month或year时，cycle_count为必填 |
| [<code>delete_protection</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L159) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 删除保护。true=开启，false不开启。默认不开启 |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L104) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·~！@#￥%……&amp;*（） —— -+={}\&#124;《》？：“”【】、；‘'，。、，不能以 http: / https: 开头，支持更新 |
| [<code>eip_id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L116) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 弹性公网IP的ID。当resource_type=external为必填 |
| [<code>gw_enabled</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L164) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 是否启用IPv4/6网关引流，0-关闭，1-开启。目前仅个别资源池支持，若提示不支持请联系产品经理申请权限。 |
| [<code>name</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L96) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 负载均衡器名称。支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32，支持更新 |
| [<code>pay_voucher_price</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L241) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 代金券金额，支持到小数点后两位 |
| [<code>private_ip_address</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L147) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 负载均衡的私有IP地址，不指定则自动分配 |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L64) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L52) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>resource_type</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L137) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 资源类型。internal：内网负载均衡，external：公网负载均衡 |
| [<code>sla_name</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L130) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | lb的规格名称，支持:elb.s2.small（标准型Ⅰ），elb.s3.small（增强型Ⅰ），elb.s4.small（高阶型Ⅰ），elb.s5.small（超强型Ⅰ），elb.s2.large（标准型Ⅱ），elb.s3.large（增强型Ⅱ），elb.s4.large（高阶型Ⅱ），elb.s5.large（超强型Ⅱ），支持更新 |
| [<code>subnet_id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L86) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |
| [<code>vpc_id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L76) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>admin_status</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L187) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 管理状态: DOWN / ACTIVE |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L195) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expired_time</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L206) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L169) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 负载均衡Id |
| [<code>ipv6_address</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L183) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 负载均衡实例的IPv6地址 |
| [<code>port_id</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L176) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 负载均衡实例默认创建port ID |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L191) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 负载均衡状态: DOWN / ACTIVE |
| [<code>update_time</code>](../../../internal/service/elb/resource_ctyun_elb_loadbalancer.go#L202) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>validator2.Desc()</code><br><code>stringvalidator.LengthBetween(1, 128)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>eip_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("resource_type"),<br>						types.StringValue(business.LbResourceTypeExternal),<br>					)</code><br><code>validator2.EipValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>expired_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 32)</code><br><code>validator2.AclName()</code> | — |
| <code>pay_voucher_price</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>port_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>private_ip_address</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>resource_type</code> | <code>stringvalidator.OneOf(business.LbResourceType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>sla_name</code> | <code>stringvalidator.OneOf(append(business.ElbSlaNames, business.PgElbSlaNames...)...)</code> | — |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 16 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>delete_protection</code>、<code>description</code>、<code>eip_id</code>、<code>gw_enabled</code>、<code>pay_voucher_price</code>、<code>private_ip_address</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_elb_loadbalancer/resource.tf](../../../examples/resources/ctyun_elb_loadbalancer/resource.tf)；未完整展示，显式展示 7 / 16。

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
  description = "Complete configurable shape for ctyun_elb_loadbalancer; consult constraints before use."
  nullable    = false
  type = object({
    az_name            = optional(string)
    cycle_count        = optional(number)
    cycle_type         = string
    delete_protection  = optional(bool)
    description        = optional(string)
    eip_id             = optional(string)
    gw_enabled         = optional(number)
    name               = string
    pay_voucher_price  = optional(string)
    private_ip_address = optional(string)
    project_id         = optional(string)
    region_id          = optional(string)
    resource_type      = string
    sla_name           = string
    subnet_id          = string
    vpc_id             = string
  })
}

resource "ctyun_elb_loadbalancer" "example" {
  az_name            = var.config.az_name
  cycle_count        = var.config.cycle_count
  cycle_type         = var.config.cycle_type
  delete_protection  = var.config.delete_protection
  description        = var.config.description
  eip_id             = var.config.eip_id
  gw_enabled         = var.config.gw_enabled
  name               = var.config.name
  pay_voucher_price  = var.config.pay_voucher_price
  private_ip_address = var.config.private_ip_address
  project_id         = var.config.project_id
  region_id          = var.config.region_id
  resource_type      = var.config.resource_type
  sla_name           = var.config.sla_name
  subnet_id          = var.config.subnet_id
  vpc_id             = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_loadbalancer.example.admin_status : string
# ctyun_elb_loadbalancer.example.create_time : string
# ctyun_elb_loadbalancer.example.expired_time : string
# ctyun_elb_loadbalancer.example.id : string
# ctyun_elb_loadbalancer.example.ipv6_address : string
# ctyun_elb_loadbalancer.example.port_id : string
# ctyun_elb_loadbalancer.example.status : string
# ctyun_elb_loadbalancer.example.update_time : string
```

</details>
