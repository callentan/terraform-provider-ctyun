# ctyun_function

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_function.tf) · [源码](../../../internal/service/faas/resource_ctyun_function.go#L84) · [原文档](../../../docs/resources/function.md)

**产品分类：** 函数计算（FaaS）。**用途：** 管理函数。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 21 / 5；递归展开后可配置 24，只读 5（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>code_bucket</code>](../../../internal/service/faas/resource_ctyun_function.go#L245) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | OBS 桶名称 |
| [<code>code_content</code>](../../../internal/service/faas/resource_ctyun_function.go#L235) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 内联代码内容或 Zip 文件的 Base64 编码 |
| [<code>code_key</code>](../../../internal/service/faas/resource_ctyun_function.go#L255) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | OBS 对象键（文件路径） |
| [<code>code_version</code>](../../../internal/service/faas/resource_ctyun_function.go#L265) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 代码版本号 |
| [<code>container_cpu</code>](../../../internal/service/faas/resource_ctyun_function.go#L177) | <code>number</code><br><code>Float64Attribute</code> | O+C | 否 | — | CPU 规格 (vCPU)，默认 0.1，范围 0.05~12.0 支持更新 |
| [<code>container_disk_size</code>](../../../internal/service/faas/resource_ctyun_function.go#L159) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 磁盘规格 (Mb)，默认 512，范围 512,10240,20480 支持更新 |
| [<code>container_fast_start</code>](../../../internal/service/faas/resource_ctyun_function.go#L196) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(0)</code> | 启动加速，默认为 0，1 表示使用启动加速  |
| [<code>container_image</code>](../../../internal/service/faas/resource_ctyun_function.go#L210) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 函数服务镜像 支持更新 |
| [<code>container_listen_port</code>](../../../internal/service/faas/resource_ctyun_function.go#L186) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(8080)</code> | 监听端口，默认 8080 支持更新 |
| [<code>container_max_scale</code>](../../../internal/service/faas/resource_ctyun_function.go#L192) | <code>number</code><br><code>Int32Attribute</code> | O | 否 | — | 并发实例数上限 |
| [<code>container_memory_size</code>](../../../internal/service/faas/resource_ctyun_function.go#L168) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 内存规格 (Mb)，默认 128，范围 128~32768 支持更新 |
| [<code>container_run_command</code>](../../../internal/service/faas/resource_ctyun_function.go#L205) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 函数服务启动命令 支持更新 |
| [<code>container_time_zone</code>](../../../internal/service/faas/resource_ctyun_function.go#L151) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 时区，默认 UTC 支持更新 |
| [<code>create_type</code>](../../../internal/service/faas/resource_ctyun_function.go#L106) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(1)</code> | 创建函数的类型 1:标准运行时 2:自定义运行时 3:自定义镜像 |
| [<code>description</code>](../../../internal/service/faas/resource_ctyun_function.go#L218) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 函数描述，长度最大为 512，支持更新 |
| [<code>environment</code>](../../../internal/service/faas/resource_ctyun_function.go#L229) | <code>map(string)</code><br><code>MapAttribute</code> | O+C | 否 | — | 函数环境变量，支持更新 |
| [<code>name</code>](../../../internal/service/faas/resource_ctyun_function.go#L95) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 函数名称。长度限制：2~64 个字符，支持数字、字母、下划线、连字符，以字母开头 |
| [<code>region_id</code>](../../../internal/service/faas/resource_ctyun_function.go#L282) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池 ID，如果不填则默认使用 provider ctyun 中的 region_id 或环境变量中的 CTYUN_REGION_ID |
| [<code>role</code>](../../../internal/service/faas/resource_ctyun_function.go#L275) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 角色 支持更新 |
| [<code>runtime_execute_timeout</code>](../../../internal/service/faas/resource_ctyun_function.go#L139) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(10)</code> | 执行超时时间，默认 10 秒 支持更新 |
| [<code>runtime_handle_type</code>](../../../internal/service/faas/resource_ctyun_function.go#L123) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("event")</code> | 请求处理程序类型（标准运行时必填），如 http/event |
| [<code>runtime_handler</code>](../../../internal/service/faas/resource_ctyun_function.go#L132) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 函数执行的入口（标准运行时必填）支持更新 |
| [<code>runtime_instance_concurrency</code>](../../../internal/service/faas/resource_ctyun_function.go#L145) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | <code>int32default.StaticInt32(1)</code> | 实例最大并发度 支持更新 |
| [<code>runtime_runtime</code>](../../../internal/service/faas/resource_ctyun_function.go#L115) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 运行时类型，如 python3.9 支持更新 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>created_at</code>](../../../internal/service/faas/resource_ctyun_function.go#L298) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间 |
| [<code>function_id</code>](../../../internal/service/faas/resource_ctyun_function.go#L294) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 函数唯一标识 |
| [<code>id</code>](../../../internal/service/faas/resource_ctyun_function.go#L88) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 资源唯一标识 |
| [<code>status</code>](../../../internal/service/faas/resource_ctyun_function.go#L306) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 函数状态 |
| [<code>updated_at</code>](../../../internal/service/faas/resource_ctyun_function.go#L302) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 更新时间 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>code_bucket</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>code_content</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>code_key</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>code_version</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>container_cpu</code> | <code>float64validator.AtLeast(0.05)</code><br><code>float64validator.AtMost(12.0)</code> | — |
| <code>container_disk_size</code> | <code>int32validator.AtLeast(0)</code><br><code>int32validator.OneOf(512, 10240, 20480)</code> | — |
| <code>container_image</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |
| <code>container_memory_size</code> | <code>int32validator.AtLeast(128)</code><br><code>int32validator.AtMost(32768)</code> | — |
| <code>container_time_zone</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>create_type</code> | — | <code>int32planmodifier.RequiresReplace()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthAtMost(512)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 64)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9_-&#93;*$"), "函数名称必须以字母开头，只能包含字母、数字、下划线、连字符")</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>role</code> | <code>stringvalidator.LengthAtLeast(1)</code> | — |
| <code>runtime_handle_type</code> | — | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>runtime_handler</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code> | — |
| <code>runtime_runtime</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | — |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 2 个有效 HCL 目标块合并后，显式展示 17 / 24 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>code_version</code>、<code>container_fast_start</code>、<code>container_image</code>、<code>container_max_scale</code>、<code>container_run_command</code>、<code>region_id</code>、<code>role</code>。

**examples 源文件：** [examples/resources/ctyun_function/resource.tf](../../../examples/resources/ctyun_function/resource.tf)；未完整展示，显式展示 17 / 24。

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
  description = "Complete configurable shape for ctyun_function; consult constraints before use."
  nullable    = false
  type = object({
    code_bucket                  = optional(string)
    code_content                 = optional(string)
    code_key                     = optional(string)
    code_version                 = optional(string)
    container_cpu                = optional(number)
    container_disk_size          = optional(number)
    container_fast_start         = optional(number)
    container_image              = optional(string)
    container_listen_port        = optional(number)
    container_max_scale          = optional(number)
    container_memory_size        = optional(number)
    container_run_command        = optional(string)
    container_time_zone          = optional(string)
    create_type                  = optional(number)
    description                  = optional(string)
    environment                  = optional(map(string))
    name                         = string
    region_id                    = optional(string)
    role                         = optional(string)
    runtime_execute_timeout      = optional(number)
    runtime_handle_type          = optional(string)
    runtime_handler              = string
    runtime_instance_concurrency = optional(number)
    runtime_runtime              = string
  })
}

resource "ctyun_function" "example" {
  code_bucket                  = var.config.code_bucket
  code_content                 = var.config.code_content
  code_key                     = var.config.code_key
  code_version                 = var.config.code_version
  container_cpu                = var.config.container_cpu
  container_disk_size          = var.config.container_disk_size
  container_fast_start         = var.config.container_fast_start
  container_image              = var.config.container_image
  container_listen_port        = var.config.container_listen_port
  container_max_scale          = var.config.container_max_scale
  container_memory_size        = var.config.container_memory_size
  container_run_command        = var.config.container_run_command
  container_time_zone          = var.config.container_time_zone
  create_type                  = var.config.create_type
  description                  = var.config.description
  environment                  = var.config.environment
  name                         = var.config.name
  region_id                    = var.config.region_id
  role                         = var.config.role
  runtime_execute_timeout      = var.config.runtime_execute_timeout
  runtime_handle_type          = var.config.runtime_handle_type
  runtime_handler              = var.config.runtime_handler
  runtime_instance_concurrency = var.config.runtime_instance_concurrency
  runtime_runtime              = var.config.runtime_runtime
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function.example.created_at : string
# ctyun_function.example.function_id : string
# ctyun_function.example.id : string
# ctyun_function.example.status : string
# ctyun_function.example.updated_at : string
```

</details>
