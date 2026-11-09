# ctyun_search_instance

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_search_instance.tf) · [源码](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L96) · [原文档](../../../docs/resources/search_instance.md)

**产品分类：** 天翼云OpenSearch服务。**用途：** 管理OpenSearch实例。

**属性数：** 顶层必填 / 可选 / 只读为 10 / 4 / 3；递归展开后可配置 19，只读 3（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>cluster_type</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L178) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 集群类型：1：OpenSearch，2：Elasticsearch |
| [<code>cycle_count</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L225) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，cycle_type=month时取值为1-11，cycle_type=year时取值为1-5，cycle_type=on_demand时无需填写 |
| [<code>cycle_type</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L211) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 付费周期类型，month：包月，year：包年，on_demand：按需付费 |
| [<code>enable_https</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L198) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(opensearch.EnableHTTPSClose)</code> | 不开启 https: CLOSE,开启：OPEN；默认 CLOSE |
| [<code>enable_ipv6</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L162) | <code>bool</code><br><code>BoolAttribute</code> | R | 否 | — | 开启IPv6：开启:true 关闭:false |
| [<code>name</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L107) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例名称，由大小写字母、数字、下划线(_)或连字符(-)组成，且不以下划线(_)或连字符(-)开头，长度是1-32位 |
| [<code>node_details</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L243) | <code>set(object)</code><br><code>SetNestedAttribute</code> | R | 否 | — | 节点组详情列表，支持配置数据节点(MASTER)、专属主节点(EXCLUSIVE_MASTER)、协调节点(COORDINATE)和冷数据节点(COLD)四类节点 |
| [<code>node_details&#91;&#93;.flavor_name</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L281) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例规格名称，每个资源池可用区下可选择的机型，参考订购页面展示的机型信息，如 s3.medium.2、s3.large.4 等 |
| [<code>node_details&#91;&#93;.host_num</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L248) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 节点数量，MASTER 节点最小为 3，最大为 50；EXCLUSIVE_MASTER 节点最大为 3；COORDINATE 节点最大为 32；COLD 节点最大为 50 |
| [<code>node_details&#91;&#93;.node_group_type</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L288) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 节点组类型：MASTER（数据节点）/EXCLUSIVE_MASTER（专属master节点）/COORDINATE（专属协调节点）/COLD（冷数据节点） |
| [<code>node_details&#91;&#93;.storage_space</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L271) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 存储空间(GB)，MASTER 节点可选：40-6144GB；EXCLUSIVE_MASTER 节点固定 40GB；COORDINATE 节点固定 40GB；COLD 节点可选：40-6144GB |
| [<code>node_details&#91;&#93;.storage_type</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L255) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 存储类型：SSD-genric（通用型SSD）、SAS（高IO）、SSD（超高IO）、XSSD-0、XSSD-1 |
| [<code>os_type</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L188) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 操作系统类型，ctyun操作系统：CTyun、麒麟操作系统：Kylin |
| [<code>password</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L169) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 组件密码，创建时必填。密码应为数字、大写字母、小写字母、特殊符号 (@$!%*#_~?) 的组合，长度在 12－26 位 |
| [<code>region_id</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L115) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>security_group_id</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L155) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 安全组ID |
| [<code>subnet_id</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L148) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |
| [<code>vpc_id</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L141) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | VPC ID |
| [<code>zone_list</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L127) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 实例所在可用区信息，只能传一个或三个可用区，可通过ctyun_zones查看 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L100) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实例ID |
| [<code>status</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L306) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 实例状态 |
| [<code>version</code>](../../../internal/service/opensearch/resource_ctyun_search_instance.go#L310) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 版本信息 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>cluster_type</code> | <code>int32validator.OneOf(opensearch.ClusterTypeOpenSearch, opensearch.ClusterTypeElasticsearch)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeMonth),<br>						types.StringValue(business.OrderCycleTypeYear),<br>					)</code><br><code>validator2.CycleCount(1, 11, 1, 5)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>						path.MatchRoot("cycle_type"),<br>						types.StringValue(business.OrderCycleTypeOnDemand),<br>					)</code> |
| <code>cycle_type</code> | <code>stringvalidator.OneOf(<br>						opensearch.CycleTypeMonthlyStr,<br>						opensearch.CycleTypeYearlyStr,<br>						opensearch.CycleTypeOnDemandStr,<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>enable_https</code> | <code>stringvalidator.OneOf(opensearch.EnableHTTPSOpen, opensearch.EnableHTTPSClose)</code> | <code>stringplanmodifier.RequiresReplace()</code><br><code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>enable_ipv6</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.LengthBetween(1, 32)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;a-zA-Z0-9&#93;&#91;-a-zA-Z0-9_&#93;*$`), "必须由大小写字母、数字、下划线(_)或连字符(-)组成，且不以下划线(_)或连字符(-)开头")</code> | — |
| <code>node_details&#91;&#93;.flavor_name</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>node_details&#91;&#93;.host_num</code> | <code>int32validator.AtLeast(1)</code> | — |
| <code>node_details&#91;&#93;.node_group_type</code> | <code>stringvalidator.OneOf(<br>									opensearch.NodeGroupTypeMaster,<br>									opensearch.NodeGroupTypeExclusiveMaster,<br>									opensearch.NodeGroupTypeCoordinate,<br>									opensearch.NodeGroupTypeCold,<br>								)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>node_details&#91;&#93;.storage_space</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>node_details&#91;&#93;.storage_type</code> | <code>stringvalidator.OneOf(<br>									opensearch.IOTypeSSDGeneric,<br>									opensearch.IOTypeSAS,<br>									opensearch.IOTypeSSD,<br>									opensearch.IOTypeXSSD0,<br>									opensearch.IOTypeXSSD1,<br>								)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>os_type</code> | <code>stringvalidator.OneOf(opensearch.OSTypeCTyun, opensearch.OSTypeKylin)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>password</code> | <code>stringvalidator.UTF8LengthBetween(8, 26)</code><br><code>validator2.SearchPassword()</code> | — |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>security_group_id</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>subnet_id</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>zone_list</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.SizeAtMost(3)</code><br><code>setvalidator.ValueStringsAre(stringvalidator.UTF8LengthAtLeast(1))</code> | <code>explanmodifier.NullIgnoreSet()</code><br><code>setplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 字段展示完整；同类型的 3 个有效 HCL 目标块合并后，显式展示 19 / 19 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**examples 源文件：** [examples/resources/ctyun_search_instance/resource.tf](../../../examples/resources/ctyun_search_instance/resource.tf)；字段展示完整，显式展示 19 / 19。

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
  description = "Complete configurable shape for ctyun_search_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    cluster_type = number
    cycle_count  = optional(number)
    cycle_type   = string
    enable_https = optional(string)
    enable_ipv6  = bool
    name         = string
    node_details = set(object({
      flavor_name     = string
      host_num        = number
      node_group_type = string
      storage_space   = number
      storage_type    = string
    }))
    os_type           = string
    password          = optional(string)
    region_id         = optional(string)
    security_group_id = string
    subnet_id         = string
    vpc_id            = string
    zone_list         = set(string)
  })
}

resource "ctyun_search_instance" "example" {
  cluster_type      = var.config.cluster_type
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  enable_https      = var.config.enable_https
  enable_ipv6       = var.config.enable_ipv6
  name              = var.config.name
  node_details      = var.config.node_details
  os_type           = var.config.os_type
  password          = var.config.password
  region_id         = var.config.region_id
  security_group_id = var.config.security_group_id
  subnet_id         = var.config.subnet_id
  vpc_id            = var.config.vpc_id
  zone_list         = var.config.zone_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_search_instance.example.id : string
# ctyun_search_instance.example.status : string
# ctyun_search_instance.example.version : string
```

</details>
