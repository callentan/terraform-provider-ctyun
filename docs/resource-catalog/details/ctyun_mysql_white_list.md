# ctyun_mysql_white_list

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_mysql_white_list.tf) · [源码](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L80) · [原文档](../../../docs/resources/mysql_white_list.md)

**产品分类：** 关系数据库MySQL版。**用途：** 管理MySQL实例的白名单。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 2 / 4；递归展开后可配置 5，只读 4（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>group_name</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L111) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 白名单分组名（必须以小写字母开头，且必须以小写字母或数字结尾，可包含数字或下划线，不含其他特殊字符) |
| [<code>group_white_list</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L121) | <code>set(string)</code><br><code>SetAttribute</code> | R | 否 | — | 白名单ip列表，支持更新，举例：&#91;'192.168.0.1', '192.168.0.*'&#93;,指定IP地址192.168.0.1：表示允许192.168.0.1的IP地址访问实例。 指定IP地址192.168.0.*：表示允许从192.168.0.1到192.168.0.255的IP地址访问实例。 |
| [<code>instance_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L101) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | mysql实例id |
| [<code>project_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L84) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID<br>已弃用：废弃字段，请不要指定 |
| [<code>region_id</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L89) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L137) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>group_white_list_count</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L130) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 白名单分组组内数量 |
| [<code>id</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L148) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | id 唯一标识 |
| [<code>update_time</code>](../../../internal/service/mysql/resource_ctyun_mysql_white_list.go#L144) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间，为UTC格式 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>group_name</code> | <code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-z&#93;(&#91;a-z0-9_&#93;*&#91;a-z0-9&#93;)?$"), "白名单分组名不符合要求")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>group_white_list</code> | <code>setvalidator.SizeAtLeast(1)</code><br><code>setvalidator.ValueStringsAre(stringvalidator.UTF8LengthAtLeast(1))</code> | — |
| <code>group_white_list_count</code> | — | <code>explanmodifier.UseInt32StateIfDependencyUnchanged(path.Root("group_white_list"))</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 5 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>project_id</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_mysql_white_list/resource.tf](../../../examples/resources/ctyun_mysql_white_list/resource.tf)；未完整展示，显式展示 3 / 5。

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
  description = "Complete configurable shape for ctyun_mysql_white_list; consult constraints before use."
  nullable    = false
  type = object({
    group_name       = string
    group_white_list = set(string)
    instance_id      = string
    project_id       = optional(string)
    region_id        = optional(string)
  })
}

resource "ctyun_mysql_white_list" "example" {
  group_name       = var.config.group_name
  group_white_list = var.config.group_white_list
  instance_id      = var.config.instance_id
  project_id       = var.config.project_id
  region_id        = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_white_list.example.create_time : string
# ctyun_mysql_white_list.example.group_white_list_count : number
# ctyun_mysql_white_list.example.id : string
# ctyun_mysql_white_list.example.update_time : string
```

</details>
