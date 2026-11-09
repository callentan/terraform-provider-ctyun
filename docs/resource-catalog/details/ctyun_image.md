# ctyun_image

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_image.tf) · [源码](../../../internal/service/image/resource_ctyun_image.go#L50) · [原文档](../../../docs/resources/image.md)

**产品分类：** 镜像服务（CT-IMS，Image Management Service）。**用途：** 管理私有镜像（从镜像文件创建）。

**属性数：** 顶层必填 / 可选 / 只读为 3 / 8 / 2；递归展开后可配置 11，只读 2（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>architecture</code>](../../../internal/service/image/resource_ctyun_image.go#L100) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 镜像系统架构，aarch64：AArch64架构，仅支持UEFI启动方式、x86_64：x86_64架构，支持BIOS和UEFI启动方式，注意：所指定的镜像系统架构应受所指定的资源池支持 |
| [<code>boot_mode</code>](../../../internal/service/image/resource_ctyun_image.go#L112) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 启动方式，bios：BIOS启动方式、uefi：UEFI启动方式，注意：若镜像系统架构为aarch64，则对启动方式的指定不生效。此参数无默认值，不指定则表示使用镜像系统架构的默认启动方式（x86_64架构的默认启动方式为BIOS），支持更新 |
| [<code>description</code>](../../../internal/service/image/resource_ctyun_image.go#L123) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 镜像描述信息。注意：长度为1~128个字符。支持更新 |
| [<code>disk_size</code>](../../../internal/service/image/resource_ctyun_image.go#L134) | <code>number</code><br><code>Int64Attribute</code> | O+C | 否 | — | 磁盘容量，单位为GB，取值范围：最小5，最大1024。注意：若填写，则不能小于镜像文件的大小 |
| [<code>file_source</code>](../../../internal/service/image/resource_ctyun_image.go#L61) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 镜像文件地址，格式应为{internetEndpoint}/{bucket}/{key}。可使用访问控制endpoint查询接口来查询外网访问endpoint，可使用获取桶列表接口来查询您拥有的桶的列表，可使用查看对象列表接口来查询存储桶内所有对象 |
| [<code>name</code>](../../../internal/service/image/resource_ctyun_image.go#L72) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 镜像名称，长度为2-32个字符，只能由数字、字母、-组成，不能以数字、-开头，且不能以-结尾，支持更新 |
| [<code>os_distro</code>](../../../internal/service/image/resource_ctyun_image.go#L80) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 操作系统的发行版名称。注意：对于Windows系操作系统，应确保参数值是windows，否则视作Linux系操作系统；对于Linux系操作系统，参数值的取值应根据系统实际情况，建议参照cloud-init的配置文件（/etc/cloud/cloud.cfg）中system_info.distro的取值或以下取值：anolis、centos、ctyunos、debian、fedora、kylin、openEuler、ubuntu、UnionTech、windows |
| [<code>os_version</code>](../../../internal/service/image/resource_ctyun_image.go#L90) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 操作系统版本。注意：参数值的取值应根据系统实际情况，建议参考（以下列出osDistro所列取值对应的osVersion参考取值）：anolis：7.9、centos：7.8、ctyunos：2.0.1、debian：9.0.0、fedora：36、kylin：V10_sp1、openEuler：20.03、ubuntu：18.04、UnionTech：V20_1050u1e、windows：2008 |
| [<code>project_id</code>](../../../internal/service/image/resource_ctyun_image.go#L159) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>region_id</code>](../../../internal/service/image/resource_ctyun_image.go#L171) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults2.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>type</code>](../../../internal/service/image/resource_ctyun_image.go#L146) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString(business.ImageTypeSystemDiskImage)</code> | 镜像种类，system：系统盘镜像，data：数据盘镜像，默认为系统盘镜像system |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>id</code>](../../../internal/service/image/resource_ctyun_image.go#L54) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | id |
| [<code>status</code>](../../../internal/service/image/resource_ctyun_image.go#L183) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 镜像状态，accepted：已接受共享镜像，active：正常，deactivated：已弃用，deactivating：弃用中，deleted：已删除，deleting：删除中，error：错误，importing：导入中，killed：上传出错，镜像不可读，pending_delete：等待删除中，queued：排队中，reactivating：取消弃用中，rejected：已拒绝共享镜像，saving：保存中，syncing：同步中，uploading：上传中，waiting：等待接受/拒绝共享镜像 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>architecture</code> | <code>stringvalidator.OneOf(business.ImageArchitectures...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplaceIfConfigured()</code> |
| <code>boot_mode</code> | <code>stringvalidator.OneOf(business.ImageBootModes...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>description</code> | <code>stringvalidator.UTF8LengthBetween(1, 128)</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>disk_size</code> | <code>int64validator.Between(5, 1024)</code> | <code>int64planmodifier.UseStateForUnknown()</code><br><code>int64planmodifier.RequiresReplace()</code> |
| <code>file_source</code> | <code>stringvalidator.LengthAtLeast(1)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile(`^&#91;^/&#93;+//&#91;^/&#93;+/.+$`), "格式应为{internetEndpoint}/{bucket}/{key}")</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | <code>stringvalidator.UTF8LengthBetween(2, 32)</code><br><code>stringvalidator.RegexMatches(regexp.MustCompile("^&#91;a-zA-Z&#93;&#91;a-zA-Z0-9.-&#93;*&#91;a-zA-Z0-9&#93;$"), "不满足镜像名称要求")</code> | — |
| <code>os_distro</code> | <code>stringvalidator.OneOf(business.ImageOsDistros...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>os_version</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>type</code> | <code>stringvalidator.OneOf(business.ImageTypes...)</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 10 / 11 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>region_id</code>。

**examples 源文件：** [examples/resources/ctyun_image/resource.tf](../../../examples/resources/ctyun_image/resource.tf)；未完整展示，显式展示 10 / 11。

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
  description = "Complete configurable shape for ctyun_image; consult constraints before use."
  nullable    = false
  type = object({
    architecture = optional(string)
    boot_mode    = optional(string)
    description  = optional(string)
    disk_size    = optional(number)
    file_source  = optional(string)
    name         = string
    os_distro    = string
    os_version   = string
    project_id   = optional(string)
    region_id    = optional(string)
    type         = optional(string)
  })
}

resource "ctyun_image" "example" {
  architecture = var.config.architecture
  boot_mode    = var.config.boot_mode
  description  = var.config.description
  disk_size    = var.config.disk_size
  file_source  = var.config.file_source
  name         = var.config.name
  os_distro    = var.config.os_distro
  os_version   = var.config.os_version
  project_id   = var.config.project_id
  region_id    = var.config.region_id
  type         = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_image.example.id : string
# ctyun_image.example.status : string
```

</details>
