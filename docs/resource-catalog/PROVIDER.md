# Provider 全局配置

[返回资源汇总](README.md)

此处为 provider Schema 的全量配置属性，不计入云资源类型数量。resource/data source 的区域、AZ、项目等字段通常优先于 provider 配置；provider 显式值优先于环境变量。每个资源的实际继承规则以其默认值/修饰器及业务代码为准。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>ak</code>](../../internal/service/ctyun_provider.go#L117) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 身份信息AK |
| [<code>az_name</code>](../../internal/service/ctyun_provider.go#L138) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 可用区英文，填写选用资源池的az_name |
| [<code>console_url</code>](../../internal/service/ctyun_provider.go#L149) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 请求分发地址，仅供测试使用，需配合inspect_url_keywords一起使用 |
| [<code>env</code>](../../internal/service/ctyun_provider.go#L127) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 环境类型env，可选值为：dev：开发环境、test：测试环境、prod：生产环境，默认为生产环境prod |
| [<code>inspect_url_keywords</code>](../../internal/service/ctyun_provider.go#L156) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | 请求拦截的地址，仅供测试使用，如果填入*则表示拦截所有请求，需配合console_url一起使用 |
| [<code>project_id</code>](../../internal/service/ctyun_provider.go#L142) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 企业项目ID，不填则使用用户默认的企业项目 |
| [<code>region_id</code>](../../internal/service/ctyun_provider.go#L134) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 资源池ID |
| [<code>sk</code>](../../internal/service/ctyun_provider.go#L122) | <code>string</code><br><code>StringAttribute</code> | O | 是 | — | 身份信息SK |

## 环境变量

| Provider 属性 | 环境变量 |
| --- | --- |
| <code>ak</code> | <code>CTYUN_AK</code> |
| <code>az_name</code> | <code>CTYUN_AZ_NAME</code> |
| <code>console_url</code> | <code>CTYUN_CONSOLE_URL</code> |
| <code>env</code> | <code>CTYUN_ENV</code> |
| <code>inspect_url_keywords</code> | <code>CTYUN_INSPECT_URL_KEYWORDS</code> |
| <code>project_id</code> | <code>CTYUN_PROJECT_ID</code> |
| <code>region_id</code> | <code>CTYUN_REGION_ID</code> |
| <code>sk</code> | <code>CTYUN_SK</code> |

`console_url` 和 `inspect_url_keywords` 属于非生产测试配置；默认不要设置。Schema 的默认值表与 Configure 中的运行时默认逻辑分开，未声明默认不等于没有默认。

## 完整配置结构

保留默认空对象即可由环境变量提供凭据；不要把实际 AK/SK 提交到仓库。

```terraform
variable "ctyun_provider" {
  sensitive = true
  default   = {}
  type = object({
    ak = optional(string)
    az_name = optional(string)
    console_url = optional(string)
    env = optional(string)
    inspect_url_keywords = optional(set(string))
    project_id = optional(string)
    region_id = optional(string)
    sk = optional(string)
  })
}

provider "ctyun" {
  ak = var.ctyun_provider.ak
  az_name = var.ctyun_provider.az_name
  console_url = var.ctyun_provider.console_url
  env = var.ctyun_provider.env
  inspect_url_keywords = var.ctyun_provider.inspect_url_keywords
  project_id = var.ctyun_provider.project_id
  region_id = var.ctyun_provider.region_id
  sk = var.ctyun_provider.sk
}
```

全局校验器：

| 属性 | Validators（源码） |
| --- | --- |
| <code>console_url</code> | <code>stringvalidator.AlsoRequires(path.MatchRoot("inspect_url_keywords"))</code> |
| <code>env</code> | <code>stringvalidator.OneOf(ctyunsdk.EnvironmentDev, ctyunsdk.EnvironmentTest, ctyunsdk.EnvironmentProd)</code> |
| <code>inspect_url_keywords</code> | <code>setvalidator.AlsoRequires(path.MatchRoot("console_url"))</code> |
| <code>project_id</code> | <code>validator2.Project()</code> |

