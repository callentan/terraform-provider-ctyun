# ctyun_private_zone_record

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_private_zone_record.tf) · [源码](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L99) · [原文档](../../../docs/resources/private_zone_record.md)

**产品分类：** 内网DNS（Intranet Domain Name Service，CT-IDNS）。**用途：** 管理内网DNS记录。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 4 / 3；递归展开后可配置 8，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>description</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L173) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | DNS记录集描述，支持更新 |
| [<code>enabled</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L198) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(true)</code> | 是否开启解析记录，默认启用，支持更新。 |
| [<code>name</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L163) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | DNS记录集的 name |
| [<code>region_id</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L103) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>ttl</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L154) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(300)</code> | zone ttl，支持更新。TTL指解析记录在本地DNS服务器的缓存时间。如果您的服务地址经常更换，建议TTL值设置相对小些，反之，建议设置相对大些。 |
| [<code>type</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L125) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 内网DNS记录类型，支持: A / CNAME / MX / AAAA / TXT, 大小写不敏感。A-将域名指向一个IPv4地址；CNAME-将域名指向另一个域名；MX-邮件交换记录，用于指定接收电子邮件的服务器；MX-邮件交换记录，用于指定接收电子邮件的服务器；AAAA-将域名指向一个IPv6地址；TXT-文本记录，可以包含任意文本信息； |
| [<code>value_list</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L141) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 支持更新。当type=A，value_list必须是 IPv4 地址；当type=CNAME，value_list填写您要指向的别名，只能写一个域名；当type=MX，value_list 填写邮箱服务器地址，最多可以输入8个不重复地址；当type=AAAA，valueList 填写IPv6地址，最多可以输入8个不重复地址；当type= TXT 时，valueList 填写文本记录值(合法字符包含大小写字母、数字、空格，文本记录) |
| [<code>zone_id</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L115) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 内网DNS id |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L187) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>id</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L180) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 内网DNS记录id |
| [<code>update_time</code>](../../../internal/service/dns/resource_ctyun_private_zone_record.go#L194) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>validator2.Desc()</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>ttl</code> | <code>int32validator.Between(300, 2147483647)</code> | — |
| <code>type</code> | <code>stringvalidator.OneOf("A", "CNAME", "MX", "AAAA", "TXT")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>value_list</code> | <code>setvalidator.SizeBetween(1, 8)</code> | — |
| <code>zone_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 8 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_private_zone_record/resource.tf](../../../examples/resources/ctyun_private_zone_record/resource.tf)；未完整展示，显式展示 7 / 8。

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
  description = "Complete configurable shape for ctyun_private_zone_record; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    enabled     = optional(bool)
    name        = string
    region_id   = optional(string)
    ttl         = optional(number)
    type        = string
    value_list  = set(string)
    zone_id     = string
  })
}

resource "ctyun_private_zone_record" "example" {
  description = var.config.description
  enabled     = var.config.enabled
  name        = var.config.name
  region_id   = var.config.region_id
  ttl         = var.config.ttl
  type        = var.config.type
  value_list  = var.config.value_list
  zone_id     = var.config.zone_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_zone_record.example.create_time : string
# ctyun_private_zone_record.example.id : string
# ctyun_private_zone_record.example.update_time : string
```

</details>
