# ctyun_private_nat

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_private_nat.tf) · [源码](../../../internal/service/nat/resource_ctyun_private_nat.go#L50) · [原文档](../../../docs/resources/private_nat.md)

**产品分类：** NAT网关（CT-NAT Gateway）。**用途：** 管理私网NAT网关。

**属性数：** 顶层必填 / 可选 / 只读为 5 / 7 / 6；递归展开后可配置 12，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_renew</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L162) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认为true |
| [<code>az_name</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L172) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区名称 |
| [<code>cycle_count</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L144) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长, 当 cycleType = month, 支持订购 1 - 11 个月; 当 cycleType = year, 支持订购 1 - 3 年 |
| [<code>cycle_type</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L134) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：year：按年，month：按月，on_demand：按需。当此值为month或year时，cycle_count为必填 |
| [<code>description</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L121) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | nat描述 支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·！@#￥%……&amp;*（） —— -+={}\&#124;《》？：“”【】、；‘'，。、，不能以 http: / https: 开头，长度 0 - 128，支持更新 |
| [<code>name</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L112) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | nat名称，支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32 支持更新 |
| [<code>pay_voucher_price</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L184) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 代金券金额，支持到小数点后两位，支持更新 |
| [<code>project_id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L73) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L61) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>spec</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L105) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 规格，(可传值：small, medium, large, xlarge)，支持更新 |
| [<code>subnet_id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L95) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 需要创建私网NAT网关的Subnet的ID |
| [<code>vpc_id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L85) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 需要创建 NAT 网关的 VPC 的 ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L211) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | NAT网关的创建时间,为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L218) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L54) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID，值与nat_gateway_id相同 |
| [<code>master_order_id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L198) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 订单id |
| [<code>nat_gateway_id</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L191) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 网关id |
| [<code>vpc_name</code>](../../../internal/service/nat/resource_ctyun_private_nat.go#L205) | <code>string</code><br><code>StringAttribute</code> | C | 否 | <code>stringdefault.StaticString("")</code> | 废弃字段<br>已弃用：废弃字段 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 3)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 128)</code><br><code>validator2.Desc()</code><br><code>validator2.DescNotStartWithHttp()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code><br><code>validator2.Desc()</code><br><code>validator2.DescNotStartWithHttp()</code> | — |
| <code>nat_gateway_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>pay_voucher_price</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>spec</code> | <code>stringvalidator.OneOf("small", "medium", "large", "xlarge")</code> | — |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 6 / 12 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>auto_renew</code>、<code>az_name</code>、<code>cycle_count</code>、<code>pay_voucher_price</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_private_nat/resource.tf](../../../examples/resources/ctyun_private_nat/resource.tf)；未完整展示，显式展示 6 / 12。

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
  description = "Complete configurable shape for ctyun_private_nat; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew        = optional(bool)
    az_name           = optional(string)
    cycle_count       = optional(number)
    cycle_type        = string
    description       = optional(string)
    name              = string
    pay_voucher_price = optional(string)
    project_id        = optional(string)
    region_id         = optional(string)
    spec              = string
    subnet_id         = string
    vpc_id            = string
  })
}

resource "ctyun_private_nat" "example" {
  auto_renew        = var.config.auto_renew
  az_name           = var.config.az_name
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  description       = var.config.description
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  project_id        = var.config.project_id
  region_id         = var.config.region_id
  spec              = var.config.spec
  subnet_id         = var.config.subnet_id
  vpc_id            = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_nat.example.create_time : string
# ctyun_private_nat.example.expire_time : string
# ctyun_private_nat.example.id : string
# ctyun_private_nat.example.master_order_id : string
# ctyun_private_nat.example.nat_gateway_id : string
# ctyun_private_nat.example.vpc_name : string
```

</details>
