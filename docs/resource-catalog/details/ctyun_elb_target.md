# ctyun_elb_target

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_target.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_target.go#L95) · [原文档](../../../docs/resources/elb_target.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡后端主机。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 5 / 6；递归展开后可配置 9，只读 6（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L121) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 描述，支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:'{},./;'&#91;,&#93;·~！@#￥%……&amp;*（） —— -+={},，支持更新 |
| [<code>instance_id</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L142) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 云主机或物理机，或弹性容器实例ID |
| [<code>instance_ip</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L152) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 后端实例ip |
| [<code>instance_type</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L132) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例类型。取值范围：VM-虚拟云主机、BM-物理机、ECI-弹性容器 |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L208) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>protocol_port</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L162) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 协议端口。取值范围：1-65535，支持更新 |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L99) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>target_group_id</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L111) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 后端服务组Id |
| [<code>weight</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L169) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(100)</code> | 后端实例权重。取值范围：1-256，默认为100，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L197) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>health_check_status</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L185) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | IPv4的健康检查状态: offline / online / unknown |
| [<code>health_check_status_ipv6</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L189) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | IPv6的健康检查状态: offline / online / unknown |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L178) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 后端主机服务(elb_target)ID |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L193) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 状态: DOWN / ACTIVE |
| [<code>update_time</code>](../../../internal/service/elb/resource_ctyun_elb_target.go#L204) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>instance_ip</code> | <code>validator2.Ip()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>instance_type</code> | <code>stringvalidator.OneOf(business.ElbTargetInstanceType...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>protocol_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>target_group_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>weight</code> | <code>int32validator.Between(1, 256)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 4 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>instance_ip</code>、<code>project_id</code>、<code>region_id</code>、<code>weight</code>。

**examples 源文件：** [examples/resources/ctyun_elb_target/resource.tf](../../../examples/resources/ctyun_elb_target/resource.tf)；未完整展示，显式展示 4 / 9。

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
  description = "Complete configurable shape for ctyun_elb_target; consult constraints before use."
  nullable    = false
  type = object({
    description     = optional(string)
    instance_id     = string
    instance_ip     = optional(string)
    instance_type   = string
    project_id      = optional(string)
    protocol_port   = number
    region_id       = optional(string)
    target_group_id = string
    weight          = optional(number)
  })
}

resource "ctyun_elb_target" "example" {
  description     = var.config.description
  instance_id     = var.config.instance_id
  instance_ip     = var.config.instance_ip
  instance_type   = var.config.instance_type
  project_id      = var.config.project_id
  protocol_port   = var.config.protocol_port
  region_id       = var.config.region_id
  target_group_id = var.config.target_group_id
  weight          = var.config.weight
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_target.example.create_time : string
# ctyun_elb_target.example.health_check_status : string
# ctyun_elb_target.example.health_check_status_ipv6 : string
# ctyun_elb_target.example.id : string
# ctyun_elb_target.example.status : string
# ctyun_elb_target.example.update_time : string
```

</details>
