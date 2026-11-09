# ctyun_elb_health_check

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_elb_health_check.tf) · [源码](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L61) · [原文档](../../../docs/resources/elb_health_check.md)

**产品分类：** 弹性负载均衡（CT-ELB ，Elastic Load Balancing）。**用途：** 管理弹性负载均衡健康检查。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 10 / 3；递归展开后可配置 12，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L85) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 支持拉丁字母、中文、数字, 特殊字符：~!@#$%^&amp;*()_-+= &lt;&gt;?:{},./;'&#91;&#93;·！@#￥%……&amp;*（） —— -+={}\&#124;《》？：“”【】、；‘'，。、，不能以 http: / https: 开头，长度 0 - 128，支持更新 |
| [<code>http_expected_codes</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L174) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | — | 利用逗号分割，仅当protocol为HTTP时必填且生效,支持http_2xx/http_3xx/http_4xx/http_5xx，一个或者多个的列表, 当 protocol 为 HTTP 时, 不填默认为 http_2xx，支持更新 |
| [<code>http_method</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L134) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 仅当protocol为HTTP时必填且生效，HTTP请求的方法默认GET，{GET/HEAD/POST/PUT/DELETE/TRACE/OPTIONS/CONNECT/PATCH}，支持更新 |
| [<code>http_url_path</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L154) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 仅当protocol为HTTP时必填且生效,支持的最大字符长度：80，支持更新 |
| [<code>interval</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L116) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(5)</code> | 负载均衡进行健康检查的时间间隔，取值范围：1-20940秒，默认为5秒，支持更新 |
| [<code>max_retry</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L125) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(2)</code> | 最大重试次数，取值范围：1-10次，默认为2次，支持更新 |
| [<code>name</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L77) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 健康检查名称。支持拉丁字母、中文、数字，下划线，连字符，中文 / 英文字母开头，不能以 http: / https: 开头，长度 2 - 32，支持更新 |
| [<code>project_id</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L227) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>protocol</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L97) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 健康检查协议。取值范围：TCP、UDP、HTTP |
| [<code>protocol_port</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L197) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 健康检查端口 1 - 65535，不支持更新 |
| [<code>region_id</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L65) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID |
| [<code>timeout</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L107) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(2)</code> | 健康检查响应的最大超时时间，取值范围：2-60秒，默认为2秒，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L220) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L209) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 健康检查ID |
| [<code>status</code>](../../../internal/service/elb/resource_ctyun_elb_health_check.go#L216) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 状态 1 - UP, 0 - DOWN |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.LengthBetween(0, 128)</code><br><code>validator2.Desc()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>http_expected_codes</code> | <code>validator2.AlsoRequiresEqualSet(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.HealthCheckProtocolHTTP),<br>					)</code><br><code>validator2.ConflictsWithEqualSet(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.HealthCheckProtocolUDP),<br>						types.StringValue(business.HealthCheckProtocolTCP),<br>					)</code><br><code>setvalidator.ValueStringsAre(<br>						stringvalidator.OneOf("http_2xx", "http_3xx", "http_4xx", "http_5xx"),<br>					)</code> | <code>setplanmodifier.UseStateForUnknown()</code> |
| <code>http_method</code> | <code>stringvalidator.OneOf(business.HttpMethods...)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.HealthCheckProtocolHTTP),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.HealthCheckProtocolUDP),<br>						types.StringValue(business.HealthCheckProtocolTCP),<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>http_url_path</code> | <code>stringvalidator.LengthAtMost(80)</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.HealthCheckProtocolHTTP),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("protocol"),<br>						types.StringValue(business.HealthCheckProtocolUDP),<br>						types.StringValue(business.HealthCheckProtocolTCP),<br>					)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>interval</code> | <code>int32validator.Between(1, 20940)</code> | — |
| <code>max_retry</code> | <code>int32validator.Between(1, 10)</code> | — |
| <code>name</code> | <code>stringvalidator.LengthBetween(2, 32)</code><br><code>validator2.AclName()</code> | — |
| <code>protocol</code> | <code>stringvalidator.OneOf(business.HealthCheckProtocols...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>protocol_port</code> | <code>int32validator.Between(1, 65535)</code> | <code>int32planmodifier.RequiresReplace()</code><br><code>int32planmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>timeout</code> | <code>int32validator.Between(2, 60)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 9 / 12 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_elb_health_check/resource.tf](../../../examples/resources/ctyun_elb_health_check/resource.tf)；未完整展示，显式展示 9 / 12。

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
  description = "Complete configurable shape for ctyun_elb_health_check; consult constraints before use."
  nullable    = false
  type = object({
    description         = optional(string)
    http_expected_codes = optional(set(string))
    http_method         = optional(string)
    http_url_path       = optional(string)
    interval            = optional(number)
    max_retry           = optional(number)
    name                = string
    project_id          = optional(string)
    protocol            = string
    protocol_port       = optional(number)
    region_id           = optional(string)
    timeout             = optional(number)
  })
}

resource "ctyun_elb_health_check" "example" {
  description         = var.config.description
  http_expected_codes = var.config.http_expected_codes
  http_method         = var.config.http_method
  http_url_path       = var.config.http_url_path
  interval            = var.config.interval
  max_retry           = var.config.max_retry
  name                = var.config.name
  project_id          = var.config.project_id
  protocol            = var.config.protocol
  protocol_port       = var.config.protocol_port
  region_id           = var.config.region_id
  timeout             = var.config.timeout
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_health_check.example.create_time : string
# ctyun_elb_health_check.example.id : string
# ctyun_elb_health_check.example.status : number
```

</details>
