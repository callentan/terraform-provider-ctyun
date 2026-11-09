# ctyun_vpce_service

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_vpce_service.tf) · [源码](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L83) · [原文档](../../../docs/resources/vpce_service.md)

**产品分类：** VPC终端节点（VPC Endpoint）。**用途：** 管理终端节点服务。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 12 / 3；递归展开后可配置 19，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>auto_connection</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L196) | <code>bool</code><br><code>BoolAttribute</code> | R | 否 | — | 是否自动连接，true表示自动链接，false表示非自动链接，支持更新 |
| [<code>description</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L146) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 终端节点服务描述，长度0-128，支持更新 |
| [<code>dns_name</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L209) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | DNS名称，支持更新 |
| [<code>force_enable_dns</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L217) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否强制开启DNS，true:开启，false:关闭，默认关闭，不可修改 |
| [<code>instance_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L172) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 服务后端实例ID，当type为interface时必填，支持更新 |
| [<code>instance_type</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L157) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 服务后端实例类型，vm:虚机类型,bm:物理机,vip:vip类型,lb:负载均衡类型,当type为interface时必填。支持更新 |
| [<code>name</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L138) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 支持拉丁字母、数字，下划线，连字符，中文/英文字母开头，不能以http:/https:开头，长度2-32，支持更新 |
| [<code>oa_type</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L226) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | OA类型，支持: tcp_option/proxy_protocol/close，仅支持有权限的用户修改，支持更新 |
| [<code>project_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L106) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L94) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>rules</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L261) | <code>set(object)</code><br><code>SetNestedAttribute</code> | O+C | 否 | — | 节点服务规则，当type为interface时必填，支持更新 |
| [<code>rules&#91;&#93;.endpoint_port</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L295) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 节点端口(用于创建rule传入)(1-65535)，支持更新 |
| [<code>rules&#91;&#93;.protocol</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L281) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 协议，TCP:TCP协议,UDP:UDP协议，支持更新 |
| [<code>rules&#91;&#93;.server_port</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L288) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 服务端口(用于创建backend传入)(1-65535)，支持更新 |
| [<code>service_charge</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L200) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | — | 是否开启服务计费，不可修改 |
| [<code>subnet_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L186) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 子网ID，创建反向终端节点服务时必填 |
| [<code>type</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L128) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 接口还是反向，interface:接口，reverse:反向 |
| [<code>vpc_id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L118) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |
| [<code>whitelist_email</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L237) | <code>set(string)</code><br><code>SetAttribute</code> | O+C | 否 | — | 白名单邮箱，最多支持10个，支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L250) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L87) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>update_time</code>](../../../internal/service/vpce/resource_ctyun_vpce_service.go#L257) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(128)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>dns_name</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>force_enable_dns</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code><br><code>boolplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.VpceServiceTypeInterface),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.VpceServiceTypeReverse),<br>					)</code> | — |
| <code>instance_type</code> | <code>stringvalidator.OneOf("vm", "bm", "vip", "lb")</code><br><code>validator2.AlsoRequiresEqualString(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.VpceServiceTypeInterface),<br>					)</code><br><code>validator2.ConflictsWithEqualString(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.VpceServiceTypeReverse),<br>					)</code> | — |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z\\x{4e00}-\\x{9fa5}&#93;&#91;0-9a-zA-Z_\\x{4e00}-\\x{9fa5}-&#93;+$"), "终端节点服务名称不符合规则")</code> | — |
| <code>oa_type</code> | <code>stringvalidator.OneOf("tcp_option", "proxy_protocol", "close")</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>planmodifier2.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>rules</code> | <code>validator2.AlsoRequiresEqualSet(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.VpceServiceTypeInterface),<br>					)</code><br><code>validator2.ConflictsWithEqualSet(<br>						path.MatchRoot("type"),<br>						types.StringValue(business.VpceServiceTypeReverse),<br>					)</code><br><code>setvalidator.SizeAtLeast(1)</code> | <code>setplanmodifier.UseStateForUnknown()</code> |
| <code>rules&#91;&#93;.endpoint_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>rules&#91;&#93;.protocol</code> | <code>stringvalidator.OneOf("TCP", "UDP")</code> | — |
| <code>rules&#91;&#93;.server_port</code> | <code>int32validator.Between(1, 65535)</code> | — |
| <code>service_charge</code> | — | <code>boolplanmodifier.UseStateForUnknown()</code><br><code>boolplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>planmodifier2.NullIgnoreString()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(business.VpceServiceTypeInterface, business.VpceServiceTypeReverse)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>whitelist_email</code> | <code>setvalidator.ValueStringsAre(validator2.Email())</code><br><code>setvalidator.SizeAtMost(10)</code> | <code>setplanmodifier.UseStateForUnknown()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 11 / 19 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>description</code>、<code>dns_name</code>、<code>force_enable_dns</code>、<code>oa_type</code>、<code>project_id</code>、<code>region_id</code>、<code>service_charge</code>、<code>whitelist_email</code>。

**examples 源文件：** [examples/resources/ctyun_vpce_service/resource.tf](../../../examples/resources/ctyun_vpce_service/resource.tf)；未完整展示，显式展示 11 / 19。

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
  description = "Complete configurable shape for ctyun_vpce_service; consult constraints before use."
  nullable    = false
  type = object({
    auto_connection  = bool
    description      = optional(string)
    dns_name         = optional(string)
    force_enable_dns = optional(bool)
    instance_id      = optional(string)
    instance_type    = optional(string)
    name             = string
    oa_type          = optional(string)
    project_id       = optional(string)
    region_id        = optional(string)
    rules = optional(set(object({
      endpoint_port = number
      protocol      = string
      server_port   = number
    })))
    service_charge  = optional(bool)
    subnet_id       = optional(string)
    type            = string
    vpc_id          = string
    whitelist_email = optional(set(string))
  })
}

resource "ctyun_vpce_service" "example" {
  auto_connection  = var.config.auto_connection
  description      = var.config.description
  dns_name         = var.config.dns_name
  force_enable_dns = var.config.force_enable_dns
  instance_id      = var.config.instance_id
  instance_type    = var.config.instance_type
  name             = var.config.name
  oa_type          = var.config.oa_type
  project_id       = var.config.project_id
  region_id        = var.config.region_id
  rules            = var.config.rules
  service_charge   = var.config.service_charge
  subnet_id        = var.config.subnet_id
  type             = var.config.type
  vpc_id           = var.config.vpc_id
  whitelist_email  = var.config.whitelist_email
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpce_service.example.create_time : string
# ctyun_vpce_service.example.id : string
# ctyun_vpce_service.example.update_time : string
```

</details>
