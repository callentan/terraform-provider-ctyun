# ctyun_ccse_node_association

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ccse_node_association.tf) · [源码](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L70) · [原文档](../../../docs/resources/ccse_node_association.md)

**产品分类：** 云容器引擎（CCSE）。**用途：** 纳管云容器引擎节点。

**属性数：** 顶层必填 / 可选 / 只读为 4 / 5 / 7；递归展开后可配置 9，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>az_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L91) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraAzName, true)</code> | 可用区名称 |
| [<code>cluster_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L103) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 集群ID |
| [<code>instance_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L113) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 主机ID |
| [<code>instance_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L146) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例类型，支持ecs（云主机）、ebm（裸金属） |
| [<code>mirror_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L156) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 镜像id，可查看&lt;a href="https://www.ctyun.cn/document/10083472/11004475"&gt;节点规格和节点镜像&lt;/a&gt; |
| [<code>password</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L166) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 用户密码，纳管时必填，导入时不填。需要满足以下规则：长度在8～30个字符；必须包含大写字母、小写字母、数字以及特殊符号中的三项；特殊符号可选：()`~!@#$%^&amp;*_-+=&#124;{}&#91;&#93;:;'&lt;&gt;,.?/\且不能以斜线号/开头 |
| [<code>region_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L79) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>visibility_host_script</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L136) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 部署前执行自定义脚本，base64编码 |
| [<code>visibility_post_host_script</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L126) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 部署后执行自定义脚本，base64编码 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>default_pool_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L197) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 集群默认的节点池ID，纳管的节点都属于此节点池 |
| [<code>id</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L74) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>is_evict</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L213) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否驱逐 |
| [<code>is_schedule</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L209) | <code>bool</code><br><code>BoolAttribute</code> | C | 否 | — | 是否调度 |
| [<code>name</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L193) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 纳管后的节点名称，通常和主机名称相同 |
| [<code>node_status</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L205) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 节点状态，normal：健康，abnormal：异常，expulsion：驱逐中。 |
| [<code>node_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_node_association.go#L201) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 节点类型，master或slave |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>az_name</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>cluster_id</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>instance_id</code> | <code>stringvalidator.Any(<br>						stringvalidator.RegexMatches(regexp.MustCompile("^ss-&#91;a-z0-9&#93;{28}$"), "不符合裸金属id规范"),<br>						validator2.UUID(),<br>					)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>instance_type</code> | <code>stringvalidator.OneOf(business.CcseSlaveInstanceTypeEcs, business.CcseSlaveInstanceTypeEbm)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>mirror_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>password</code> | <code>stringvalidator.Any(<br>						stringvalidator.All(<br>							validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEcs),<br>							),<br>							validator2.EcsPassword(),<br>						),<br><br>						stringvalidator.All(<br>							validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEbm),<br>							),<br>							validator2.EbmPassword(),<br>						),<br>					)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>visibility_host_script</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>visibility_post_host_script</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>explanmodifier.NullIgnoreString()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 7 / 9 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>az_name</code>、<code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_ccse_node_association/resource.tf](../../../examples/resources/ctyun_ccse_node_association/resource.tf)；未完整展示，显式展示 7 / 9。

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
  description = "Complete configurable shape for ctyun_ccse_node_association; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    az_name                     = optional(string)
    cluster_id                  = string
    instance_id                 = string
    instance_type               = string
    mirror_id                   = string
    password                    = optional(string)
    region_id                   = optional(string)
    visibility_host_script      = optional(string)
    visibility_post_host_script = optional(string)
  })
}

resource "ctyun_ccse_node_association" "example" {
  az_name                     = var.config.az_name
  cluster_id                  = var.config.cluster_id
  instance_id                 = var.config.instance_id
  instance_type               = var.config.instance_type
  mirror_id                   = var.config.mirror_id
  password                    = var.config.password
  region_id                   = var.config.region_id
  visibility_host_script      = var.config.visibility_host_script
  visibility_post_host_script = var.config.visibility_post_host_script
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_node_association.example.default_pool_id : string
# ctyun_ccse_node_association.example.id : string
# ctyun_ccse_node_association.example.is_evict : bool
# ctyun_ccse_node_association.example.is_schedule : bool
# ctyun_ccse_node_association.example.name : string
# ctyun_ccse_node_association.example.node_status : string
# ctyun_ccse_node_association.example.node_type : string
```

</details>
