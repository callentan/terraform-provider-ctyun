# ctyun_vpc_route_table

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_vpc_route_table.tf) · [源码](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L61) · [原文档](../../../docs/resources/vpc_route_table.md)

**产品分类：** 虚拟私有云（Virtual Private Cloud，VPC）。**用途：** 管理虚拟私有云路由表。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 4 / 2；递归展开后可配置 6，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>bind_gateway</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L130) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否绑定网关，支持更新 |
| [<code>name</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L113) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 名称，支持拉丁字母、中文、数字，下划线，连字符，中文/英文字母开头，不能以http:/https:开头，长度2-32，支持更新 |
| [<code>project_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L91) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L79) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>route_type</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L121) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("subnet")</code> | 类型，支持subnet,gateway |
| [<code>vpc_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L103) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L65) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID，值与路由表ID相同 |
| [<code>route_table_id</code>](../../../internal/service/vpc/resource_ctyun_vpc_route_table.go#L72) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 路由表ID |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>bind_gateway</code> | <code>validator2.AlsoRequiresEqualBool(<br>						path.MatchRoot("route_type"),<br>						types.StringValue("gateway"),<br>					)</code><br><code>validator2.ConflictsWithEqualBool(<br>						path.MatchRoot("route_type"),<br>						types.StringValue("subnet"),<br>					)</code> | — |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z\\x{4e00}-\\x{9fa5}&#93;&#91;0-9a-zA-Z_\\x{4e00}-\\x{9fa5}-&#93;+$"), "名称不符合规则")</code> | — |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>route_table_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>route_type</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 2 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>bind_gateway</code>、<code>project_id</code>、<code>region_id</code>、<code>route_type</code>。

**examples 源文件：** [examples/resources/ctyun_vpc_route_table/resource.tf](../../../examples/resources/ctyun_vpc_route_table/resource.tf)；未完整展示，显式展示 2 / 6。

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
  description = "Complete configurable shape for ctyun_vpc_route_table; consult constraints before use."
  nullable    = false
  type = object({
    bind_gateway = optional(bool)
    name         = string
    project_id   = optional(string)
    region_id    = optional(string)
    route_type   = optional(string)
    vpc_id       = string
  })
}

resource "ctyun_vpc_route_table" "example" {
  bind_gateway = var.config.bind_gateway
  name         = var.config.name
  project_id   = var.config.project_id
  region_id    = var.config.region_id
  route_type   = var.config.route_type
  vpc_id       = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_route_table.example.id : string
# ctyun_vpc_route_table.example.route_table_id : string
```

</details>
