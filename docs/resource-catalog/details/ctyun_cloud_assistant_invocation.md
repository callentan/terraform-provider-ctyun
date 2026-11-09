# ctyun_cloud_assistant_invocation

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_cloud_assistant_invocation.tf) · [源码](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L55) · [原文档](../../../docs/resources/cloud_assistant_invocation.md)

**产品分类：** 云助手。**用途：** 触发云助手命令执行并查询执行结果。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 4 / 2；递归展开后可配置 6，只读 10（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>command_id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L88) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 命令 ID（使用已有命令时传入）。若执行未保存的命令可以使用ctyun__cloud_assistant_run_command |
| [<code>instance_ids</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L78) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 待执行命令的弹性云主机ID列表，使用英文逗号分割 |
| [<code>parameter</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L111) | <code>map(string)</code><br><code>MapAttribute</code> | O | 否 | — | 自定义参数的默认取值 |
| [<code>region_id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L66) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID |
| [<code>timeout</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L102) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(60)</code> | 命令超时时间，默认60秒 |
| [<code>working_directory</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L95) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 命令运行目录 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L59) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源标识，invokedID。可以通过此id查询到执行结果 |
| [<code>results</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L116) | <code>list(object)</code><br><code>ListNestedAttribute</code> | C | 否 | — | 各实例的命令执行结果 |
| [<code>results&#91;&#93;.create_time</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L141) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行创建时间 |
| [<code>results&#91;&#93;.error_info</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L137) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行失败原因 |
| [<code>results&#91;&#93;.exit_code</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L133) | <code>number</code><br><code>Int32Attribute</code> | C | 否 | — | 命令退出码 |
| [<code>results&#91;&#93;.instance_id</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L121) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 云主机 ID |
| [<code>results&#91;&#93;.invocation_record_status</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L149) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 单个命令执行任务的总状态，取值范围:Pending：未执行，当有云主机中命令状态为Pending，则总的执行状态为未执行；<br>Running：运行中，有云主机中命令进程为运行中，则总的执行状态为运行中；<br>Finished：已完成。所有云主机命令进程全部完成执行；<br>Failed：执行失败，有云主机中命令进程为执行失败，则总的状态为Failed。 |
| [<code>results&#91;&#93;.invocation_status</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L125) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令运行状态：Pending/Running/Success/Failed |
| [<code>results&#91;&#93;.output</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L129) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行输出信息 |
| [<code>results&#91;&#93;.update_time</code>](../../../internal/service/cloud-assistant/resource_ctyun_cloud_assistant_invocation.go#L145) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 命令执行完成时间 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>command_id</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_ids</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>timeout</code> | — | <code>int32planmodifier.RequiresReplace()</code> |
| <code>working_directory</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 3 / 6 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>parameter</code>、<code>region_id</code>、<code>working_directory</code>。

**examples 源文件：** [examples/resources/ctyun_cloud_assistant_invocation/resource.tf](../../../examples/resources/ctyun_cloud_assistant_invocation/resource.tf)；未完整展示，显式展示 3 / 6。

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
  description = "Complete configurable shape for ctyun_cloud_assistant_invocation; consult constraints before use."
  nullable    = false
  type = object({
    command_id        = string
    instance_ids      = string
    parameter         = optional(map(string))
    region_id         = optional(string)
    timeout           = optional(number)
    working_directory = optional(string)
  })
}

resource "ctyun_cloud_assistant_invocation" "example" {
  command_id        = var.config.command_id
  instance_ids      = var.config.instance_ids
  parameter         = var.config.parameter
  region_id         = var.config.region_id
  timeout           = var.config.timeout
  working_directory = var.config.working_directory
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_cloud_assistant_invocation.example.id : string
# ctyun_cloud_assistant_invocation.example.results : list(object)
# ctyun_cloud_assistant_invocation.example.results[*].create_time : string
# ctyun_cloud_assistant_invocation.example.results[*].error_info : string
# ctyun_cloud_assistant_invocation.example.results[*].exit_code : number
# ctyun_cloud_assistant_invocation.example.results[*].instance_id : string
# ctyun_cloud_assistant_invocation.example.results[*].invocation_record_status : string
# ctyun_cloud_assistant_invocation.example.results[*].invocation_status : string
# ctyun_cloud_assistant_invocation.example.results[*].output : string
# ctyun_cloud_assistant_invocation.example.results[*].update_time : string
```

</details>
