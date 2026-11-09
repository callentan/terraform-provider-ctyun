# ctyun_cloud_assistant_run_command

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_cloud_assistant_run_command.tf) · [源码](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L56) · [原文档](../../../docs/resources/cloud_assistant_run_command.md)

**产品分类：** 云助手。**用途：** 在云主机中执行一段Shell、PowerShell、Bat或Python类型的脚本命令。

**属性数：** 顶层必填 / 可选 / 只读为 1 / 10 / 2；递归展开后可配置 11，只读 9（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>command_content</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L119) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 加密后的命令内容，长度不可超过24KB |
| [<code>command_name</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L89) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 命令名称，长度不超过128个字符 |
| [<code>command_type</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L109) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 命令类型：shell、bat、powershell、python |
| [<code>description</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L99) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 命令描述，长度不超过512个字符 |
| [<code>enabled_parameter</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L151) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否启用自定义参数，默认false |
| [<code>instance_ids</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L79) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 待执行命令的弹性云主机ID列表，使用英文逗号分割，一次最多不超过100台 |
| [<code>parameter</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L160) | <code>map(string)</code><br><code>MapAttribute</code> | O | 否 | — | 自定义参数，key和value均只支持string |
| [<code>region_id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L67) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID |
| [<code>save_command</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L142) | <code>bool</code><br><code>BoolAttribute</code> | O+C | 否 | <code>booldefault.StaticBool(false)</code> | 是否保存命令，默认false |
| [<code>timeout</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L133) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(60)</code> | 命令超时时间，默认60秒 |
| [<code>working_directory</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L126) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 命令在实例中运行目录，Linux默认/tmp，Windows默认C:\Windows\System32 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L60) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源标识，invokedID。可以通过此id查询到执行结果 |
| [<code>results</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L165) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | 各实例的命令执行结果 |
| [<code>results&#91;&#93;.create_time</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L190) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行创建时间 |
| [<code>results&#91;&#93;.error_info</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L186) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行失败原因 |
| [<code>results&#91;&#93;.exit_code</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L182) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 命令退出码 |
| [<code>results&#91;&#93;.instance_id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L170) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机 ID |
| [<code>results&#91;&#93;.invocation_status</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L174) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令运行状态：Pending/Running/Success/Failed |
| [<code>results&#91;&#93;.output</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L178) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行输出信息 |
| [<code>results&#91;&#93;.update_time</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_run_command.go#L194) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行完成时间 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>command_content</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>command_name</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>command_type</code> | <code>stringvalidator.OneOf("shell", "bat", "powershell", "python")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(512)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>enabled_parameter</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_ids</code> | <code>stringvalidator.UTF8LengthBetween(1, 100)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>save_command</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>timeout</code> | — | <code>int32planmodifier.RequiresReplace()</code> |
| <code>working_directory</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>enabled_parameter</code>、<code>parameter</code>、<code>region_id</code>、<code>working_directory</code>。

**examples 源文件：** [examples/resources/ctyun_cloud_assistant_run_command/resource.tf](../../../examples/resources/ctyun_cloud_assistant_run_command/resource.tf)；未完整展示，显式展示 7 / 11。

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
  description = "Complete configurable shape for ctyun_cloud_assistant_run_command; consult constraints before use."
  nullable    = false
  type = object({
    command_content   = optional(string)
    command_name      = optional(string)
    command_type      = optional(string)
    description       = optional(string)
    enabled_parameter = optional(bool)
    instance_ids      = string
    parameter         = optional(map(string))
    region_id         = optional(string)
    save_command      = optional(bool)
    timeout           = optional(number)
    working_directory = optional(string)
  })
}

resource "ctyun_cloud_assistant_run_command" "example" {
  command_content   = var.config.command_content
  command_name      = var.config.command_name
  command_type      = var.config.command_type
  description       = var.config.description
  enabled_parameter = var.config.enabled_parameter
  instance_ids      = var.config.instance_ids
  parameter         = var.config.parameter
  region_id         = var.config.region_id
  save_command      = var.config.save_command
  timeout           = var.config.timeout
  working_directory = var.config.working_directory
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_cloud_assistant_run_command.example.id : string
# ctyun_cloud_assistant_run_command.example.results : list(object)
# ctyun_cloud_assistant_run_command.example.results[*].create_time : string
# ctyun_cloud_assistant_run_command.example.results[*].error_info : string
# ctyun_cloud_assistant_run_command.example.results[*].exit_code : number
# ctyun_cloud_assistant_run_command.example.results[*].instance_id : string
# ctyun_cloud_assistant_run_command.example.results[*].invocation_status : string
# ctyun_cloud_assistant_run_command.example.results[*].output : string
# ctyun_cloud_assistant_run_command.example.results[*].update_time : string
```

</details>
