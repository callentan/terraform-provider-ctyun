# ctyun_ccse_cluster

[返回汇总](../README.md) · [下载 TF 模板](../templates/ctyun_ccse_cluster.tf) · [源码](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L142) · [原文档](../../../docs/resources/ccse_cluster.md)

**产品分类：** 云容器引擎（CCSE）。**用途：** 管理云容器引擎集群。

**属性数：** 顶层必填 / 可选 / 只读为 2 / 2 / 7；递归展开后可配置 63，只读 7（包含容器属性本身）。

**模式：** R=Required；O=Optional；C=Computed；O+C 仍可配置。嵌套 R 仅在父对象/元素提供时必填。默认值“—”表示 Schema 未声明默认，不代表业务代码或服务端没有默认。敏感标记包括父属性的继承。

## 可配置属性

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>base_info</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L207) | <code>object</code><br><code>SingleNestedAttribute</code> | R | 否 | — | 集群基础信息 |
| [<code>base_info.auto_renew</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L451) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否自动续订，默认非自动续订，当cycle_type不等于on_demand时才可填写，按月购买，自动续订周期为1个月；按年购买，自动续订周期为1年。 |
| [<code>base_info.cluster_domain</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L264) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 集群本地域名，创建时必填，导入时不填 |
| [<code>base_info.cluster_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L254) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 集群名字 |
| [<code>base_info.cluster_series</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L538) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 集群系列，支持cce.standard（专有版），cce.managed（托管版），您可查看&lt;a href="https://www.ctyun.cn/document/10083472/10892150"&gt;产品定义&lt;/a&gt; |
| [<code>base_info.cluster_version</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L508) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 集群版本，支持1.31.6，1.29.3，1.27.8，您可查看&lt;a href="https://www.ctyun.cn/document/10083472/10650447"&gt;集群版本说明&lt;/a&gt; |
| [<code>base_info.container_runtime</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L488) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 容器运行时,创建时必填，导入时不填。可选containerd、docker，您可查看&lt;a href="https://www.ctyun.cn/document/10083472/10902208"&gt;容器运行时说明&lt;/a&gt; |
| [<code>base_info.cycle_count</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L471) | <code>number</code><br><code>Int64Attribute</code> | O | 否 | — | 订购时长，该参数在cycle_type为month或year时才生效，当cycle_type=month，支持订购1-11个月；当cycle_type=year，支持订购1-3年 |
| [<code>base_info.cycle_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L461) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 订购周期类型，取值范围：month：按月，year：按年、on_demand：按需。当此值为month或者year时，cycle_count为必填 |
| [<code>base_info.deploy_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L518) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 部署模式，创建时必填，导入时不填。单可用区为single，多可用区为multi |
| [<code>base_info.elb_prod_code</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L298) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | ApiServer的ELB类型，创建时必填，导入时不填。支持standardI（标准I型），standardII（标准II型），enhancedI（增强I型），enhancedII（增强II型），higherI（高阶I型），您可查看&lt;a href="https://www.ctyun.cn/document/10026756/10032048"&gt;ELB类型规格说明&lt;/a&gt; |
| [<code>base_info.enable_api_server_eip</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L353) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否开启ApiServerEip，默认false，若开启将自动创建按需计费类型的eip。 |
| [<code>base_info.enable_snat</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L360) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否开启nat网关，默认false，若开启将自动创建按需计费类型的nat网关。 |
| [<code>base_info.end_port</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L291) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 节点服务终止端口，可选范围30000-32767，startPort到endPort范围需大于20，支持更新 |
| [<code>base_info.install_als</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L388) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否安装日志插件，默认false |
| [<code>base_info.install_als_cube_event</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L381) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否安装事件采集插件，默认false |
| [<code>base_info.install_ccse_monitor</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L395) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否安装监控插件，默认false |
| [<code>base_info.install_nginx_ingress</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L402) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否安装nginx_ingress插件，默认false |
| [<code>base_info.ip_vlan</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L437) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 基于IPVLAN做弹性网卡共享，默认false，当指定为true时，主机镜像只有使用CtyunOS系统才能生效 |
| [<code>base_info.kube_proxy</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L528) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | kubeProxy类型：iptables或ipvs。您可查看&lt;a href="https://www.ctyun.cn/document/10083472/10915725"&gt;iptables与IPVS如何选择&lt;/a&gt; |
| [<code>base_info.nat_gateway_spec</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L367) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 当enable_snat=true时填写，nat网关规格：small，medium，large，xlarge，可参考&lt;a href="https://www.ctyun.cn/document/10026759/10043996"&gt;产品规格说明&lt;/a&gt; |
| [<code>base_info.network_plugin</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L274) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 网络插件，可选calico和cubecni，calico需要申请白名单。您可查看&lt;a href="https://www.ctyun.cn/document/10083472/10520760"&gt;容器网络插件说明&lt;/a&gt; |
| [<code>base_info.network_policy</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L444) | <code>bool</code><br><code>BoolAttribute</code> | O | 否 | — | 是否提供基于策略的网络访问控制，默认false |
| [<code>base_info.nginx_ingress_lb_spec</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L409) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | install_nginx_ingress=true必填，支持规格：standardI（标准I型） ,standardII（标准II型）, enhancedI（增强I型）, enhancedII（增强II型） , higherI（高阶I型），可参考&lt;a href="https://www.ctyun.cn/document/10026756/10032048"&gt;规格详情&lt;/a&gt; |
| [<code>base_info.nginx_ingress_network</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L423) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | install_nginx_ingress=true必填，nginx ingress访问方式：external（公网），internal（内网），当选择公网时将自动创建eip额外产生eip相关费用 |
| [<code>base_info.node_scale</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L560) | <code>number</code><br><code>Int32Attribute</code> | O+C | 否 | — | 托管版集群节点规模。series_type=managedbase时，选择节点规模，可选10；series_type=managedpro时，选择节点规模，可选为50，200，1000，2000，支持更新 |
| [<code>base_info.pod_cidr</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L308) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | pod网络cidr，使用cubecni作为网络插件时，podCidr不填，服务端会取vpcCidr。使用calico作为网络插件时，podCidr与vpcCidr和serviceCidr不能重叠。 |
| [<code>base_info.pod_subnet_id_list</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L340) | <code>set(string)</code><br><code>SetAttribute</code> | O | 否 | — | pod子网ID列表，创建时，若网络插件选择cubecni必传，其他情况不填。需要属于所选VPC，最多支持10个子网，支持更新 |
| [<code>base_info.project_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L211) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraProjectId, false)</code> | 企业项目ID，如果不填则默认使用provider ctyun中的project_id或环境变量中的CTYUN_PROJECT_ID |
| [<code>base_info.security_group_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L243) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 安全组ID，需属于所选vpc。使用自定义安全组时，需要配置如下规则，参考&lt;a href="https://www.ctyun.cn/document/10083472/10915714"&gt;集群安全组规则配置&lt;/a&gt; |
| [<code>base_info.series_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L548) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | — | 托管版集群规格，托管版集群必填。支持managedbase（单实例），managedpro（多实例）。单/多实例指控制面是否高可用，生产环境建议使用多实例，支持更新 |
| [<code>base_info.service_cidr</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L328) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>stringdefault.StaticString("10.96.0.0/16")</code> | 服务cidr，默认10.96.0.0/16。网络插件为calico时，podCidr与vpcCidr与serviceCidr不能重叠。选择cubecni时，podCidr（vpcCidr）与serviceCidr不能重叠。 |
| [<code>base_info.start_port</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L284) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 节点服务开始端口，可选范围30000-32767，支持更新 |
| [<code>base_info.subnet_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L233) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 子网ID |
| [<code>base_info.timezone</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L498) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 时区，例如Asia/Shanghai (UTC+08:00) |
| [<code>base_info.vpc_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L223) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 虚拟私有云ID |
| [<code>master_host</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L579) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | master节点基本信息，专有版必填，托管版时不传 |
| [<code>master_host.az_infos</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L650) | <code>list(object)</code><br><code>ListNestedAttribute</code> | R | 否 | — | 可用区信息，包括可用区编码和该可用区下master节点数量，支持的可用区可通过ctyun_regions查询 |
| [<code>master_host.az_infos&#91;&#93;.az_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L658) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | master可用区编码 |
| [<code>master_host.az_infos&#91;&#93;.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L668) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 该可用区下master节点数量 |
| [<code>master_host.data_disks</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L619) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 数据盘信息 |
| [<code>master_host.data_disks&#91;&#93;.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L637) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 数据盘大小，单位为G，支持范围10-20000 |
| [<code>master_host.data_disks&#91;&#93;.type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L627) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 数据盘类型，支持SATA、SAS、SSD、SSD-genric、FAST-SSD、XSSD-0、XSSD-1、XSSD-2 |
| [<code>master_host.item_def_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L583) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例规格名称，使用至少4C8G以上的规格，仅支持云主机，可通过ctyun_ecs_flavors查询 |
| [<code>master_host.sys_disk</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L593) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | 系统盘信息 |
| [<code>master_host.sys_disk.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L607) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 系统盘大小，单位为G，支持范围80-2040 |
| [<code>master_host.sys_disk.type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L597) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 系统盘类型，支持SATA、SAS、SSD、SSD-genric、FAST-SSD、XSSD-0、XSSD-1、XSSD-2 |
| [<code>region_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L195) | <code>string</code><br><code>StringAttribute</code> | O+C | 否 | <code>defaults.AcquireFromGlobalString(common.ExtraRegionId, true)</code> | 资源池ID，如果不填则默认使用provider ctyun中的region_id或环境变量中的CTYUN_REGION_ID |
| [<code>slave_host</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L694) | <code>object</code><br><code>SingleNestedAttribute</code> | R | 否 | — | slave节点基本信息 |
| [<code>slave_host.az_infos</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L762) | <code>set(object)</code><br><code>SetNestedAttribute</code> | R | 否 | — | 可用区信息，包括可用区编码和该可用区下worker节点数量，支持的可用区可通过ctyun_regions查询 |
| [<code>slave_host.az_infos&#91;&#93;.az_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L770) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | worker可用区编码 |
| [<code>slave_host.az_infos&#91;&#93;.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L780) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 该可用区下worker节点数量 |
| [<code>slave_host.data_disks</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L819) | <code>list(object)</code><br><code>ListNestedAttribute</code> | O | 否 | — | 数据盘信息 |
| [<code>slave_host.data_disks&#91;&#93;.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L837) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 数据盘大小，单位为G，支持范围10-20000 |
| [<code>slave_host.data_disks&#91;&#93;.type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L827) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 数据盘类型，支持SATA、SAS、SSD、SSD-genric、FAST-SSD、XSSD-0、XSSD-1、XSSD-2 |
| [<code>slave_host.instance_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L698) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例类型，支持ecs（云主机）、ebm（裸金属） |
| [<code>slave_host.item_def_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L752) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 实例规格名称，使用至少4C8G以上的规格，云主机规格通过ctyun_ecs_flavors查询，裸金属规格通过ctyun_ebm_device_types查询 |
| [<code>slave_host.mirror_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L708) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 镜像id，worker节点为ecs类型必填，可查看&lt;a href="https://www.ctyun.cn/document/10083472/11004475"&gt;节点规格和节点镜像&lt;/a&gt; |
| [<code>slave_host.mirror_name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L725) | <code>string</code><br><code>StringAttribute</code> | O | 否 | — | 镜像名称，worker节点为ebm类型必填，可查看&lt;a href="https://www.ctyun.cn/document/10083472/11004475"&gt;节点规格和节点镜像&lt;/a&gt; |
| [<code>slave_host.mirror_type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L742) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 镜像类型，支持传0（私有），1（公有），可查看&lt;a href="https://www.ctyun.cn/document/10026730/10030151"&gt;镜像概述&lt;/a&gt; |
| [<code>slave_host.sys_disk</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L793) | <code>object</code><br><code>SingleNestedAttribute</code> | O | 否 | — | 系统盘信息 |
| [<code>slave_host.sys_disk.size</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L807) | <code>number</code><br><code>Int32Attribute</code> | R | 否 | — | 系统盘大小，单位为G，支持范围80-2040 |
| [<code>slave_host.sys_disk.type</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L797) | <code>string</code><br><code>StringAttribute</code> | R | 否 | — | 系统盘类型，支持SATA、SAS、SSD、SSD-genric、FAST-SSD、XSSD-0、XSSD-1、XSSD-2 |

## 只读属性

这些字段不能作为 resource 参数赋值；可通过资源引用读取，完整引用路径见模板尾部。

| 属性路径（源码） | 类型 | 模式 | 敏感 | 默认值表达式 | 说明 |
| --- | --- | --- | --- | --- | --- |
| [<code>create_time</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L160) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 创建时间，为UTC格式 |
| [<code>expire_time</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L167) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 到期时间，为UTC格式，按需时为空 |
| [<code>external_kube_config</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L188) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 外网连接信息 |
| [<code>id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L146) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | ID |
| [<code>internal_kube_config</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L181) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 内网连接信息 |
| [<code>master_order_id</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L174) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 主订单号 |
| [<code>name</code>](../../../internal/service/ccse/resource_ctyun_ccse_cluster.go#L153) | <code>string</code><br><code>StringAttribute</code> | C | 否 | — | 名称 |

## 校验器与计划修饰器

以下为源码表达式，保留枚举引用、互斥、条件必填、范围及重建规则。RequiresReplace 表示重建；未出现此修饰器不代表支持原地更新。业务方法中的附加校验不在本表范围内。

| 属性 | Validators（源码） | PlanModifiers（源码） |
| --- | --- | --- |
| <code>base_info.auto_renew</code> | — | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsBool(<br>								path.MatchRoot("base_info").AtName("cycle_type"),<br>								types.StringValue(business.OrderCycleTypeOnDemand),<br>							)</code> |
| <code>base_info.cluster_domain</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>base_info.cluster_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.cluster_series</code> | <code>stringvalidator.OneOf(business.CcseClusterSeriesStandard, business.CcseClusterSeriesManaged, business.CcseClusterSeriesIcce)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.cluster_version</code> | <code>stringvalidator.OneOf(business.CcseClusterVersions...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.container_runtime</code> | <code>stringvalidator.OneOf(business.CcseContainerRuntimeContainerd, business.CcseContainerRuntimeDocker)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>base_info.cycle_count</code> | <code>validator2.AlsoRequiresEqualInt64(<br>								path.MatchRoot("base_info").AtName("cycle_type"),<br>								types.StringValue(business.OrderCycleTypeMonth),<br>								types.StringValue(business.OrderCycleTypeYear),<br>							)</code> | <code>explanmodifier.RequiresReplaceUnlessDependencyEqualsInt64(<br>								path.MatchRoot("base_info").AtName("cycle_type"),<br>								types.StringValue(business.OrderCycleTypeOnDemand),<br>							)</code> |
| <code>base_info.cycle_type</code> | <code>stringvalidator.OneOf(business.OrderCycleTypes...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.deploy_type</code> | <code>stringvalidator.OneOf(business.CcseDeployTypeSingle, business.CcseDeployTypeMulti)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>base_info.elb_prod_code</code> | <code>stringvalidator.OneOf(business.CcseApiServerElbSpecs...)</code> | <code>explanmodifier.NullIgnoreString()</code> |
| <code>base_info.enable_api_server_eip</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.enable_snat</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.end_port</code> | <code>int32validator.Between(30000, 32767)</code> | — |
| <code>base_info.install_als</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.install_als_cube_event</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.install_ccse_monitor</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.install_nginx_ingress</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.ip_vlan</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.kube_proxy</code> | <code>stringvalidator.OneOf(business.CcseKubeProxyIptables, business.CcseKubeProxyIpvs)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.nat_gateway_spec</code> | <code>stringvalidator.OneOf("small", "medium", "large", "xlarge")</code><br><code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("base_info").AtName("enable_snat"),<br>								types.BoolValue(true),<br>							)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.network_plugin</code> | <code>stringvalidator.OneOf(business.CcsePluginCubecni, business.CcsePluginCalico)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.network_policy</code> | — | <code>boolplanmodifier.RequiresReplace()</code> |
| <code>base_info.nginx_ingress_lb_spec</code> | <code>stringvalidator.OneOf("standardI", "standardII", "enhancedI", "enhancedII", "higherI")</code><br><code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("base_info").AtName("install_nginx_ingress"),<br>								types.BoolValue(true),<br>							)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.nginx_ingress_network</code> | <code>stringvalidator.OneOf("external", "internal")</code><br><code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("base_info").AtName("install_nginx_ingress"),<br>								types.BoolValue(true),<br>							)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.node_scale</code> | <code>validator2.CrossFieldInt32(<br>								path.MatchRoot("base_info").AtName("series_type"),<br>								&#91;&#93;any{business.CcseSeriesTypeManagedbase},<br>								&#91;&#93;int32{10},<br>							)</code><br><code>validator2.CrossFieldInt32(<br>								path.MatchRoot("base_info").AtName("series_type"),<br>								&#91;&#93;any{business.CcseSeriesTypeManagedpro},<br>								&#91;&#93;int32{50, 200, 1000, 2000},<br>							)</code> | — |
| <code>base_info.pod_cidr</code> | <code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("base_info").AtName("network_plugin"),<br>								types.StringValue(business.CcsePluginCalico),<br>							)</code><br><code>validator2.ConflictsWithEqualString(<br>								path.MatchRoot("base_info").AtName("network_plugin"),<br>								types.StringValue(business.CcsePluginCubecni),<br>							)</code><br><code>validator2.Cidr()</code> | <code>stringplanmodifier.UseStateForUnknown()</code><br><code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.pod_subnet_id_list</code> | <code>validator2.ConflictsWithEqualSet(<br>								path.MatchRoot("base_info").AtName("network_plugin"),<br>								types.StringValue(business.CcsePluginCalico),<br>							)</code><br><code>setvalidator.SizeBetween(1, 10)</code><br><code>setvalidator.ValueStringsAre(validator2.SubnetValidate())</code> | — |
| <code>base_info.project_id</code> | <code>validator2.Project()</code> | <code>explanmodifier.Project()</code> |
| <code>base_info.security_group_id</code> | <code>validator2.SecurityGroupValidate()</code> | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>base_info.series_type</code> | <code>stringvalidator.OneOf(business.CcseSeriesTypeManagedbase, business.CcseSeriesTypeManagedpro)</code><br><code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("base_info").AtName("cluster_series"),<br>								types.StringValue(business.CcseClusterSeriesManaged),<br>							)</code> | — |
| <code>base_info.service_cidr</code> | <code>validator2.Cidr()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.start_port</code> | <code>int32validator.Between(30000, 32767)</code> | — |
| <code>base_info.subnet_id</code> | <code>validator2.SubnetValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.timezone</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>base_info.vpc_id</code> | <code>validator2.VpcValidate()</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>create_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>expire_time</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>external_kube_config</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>internal_kube_config</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>master_host</code> | <code>validator2.AlsoRequiresEqualObject(<br>						path.MatchRoot("base_info").AtName("cluster_series"),<br>						types.StringValue(business.CcseClusterSeriesStandard),<br>					)</code><br><code>validator2.ConflictsWithEqualObject(<br>						path.MatchRoot("base_info").AtName("cluster_series"),<br>						types.StringValue(business.CcseClusterSeriesManaged),<br>						types.StringValue(business.CcseClusterSeriesIcce),<br>					)</code> | — |
| <code>master_host.az_infos</code> | — | <code>listplanmodifier.RequiresReplace()</code> |
| <code>master_host.az_infos&#91;&#93;.az_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>master_host.az_infos&#91;&#93;.size</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>master_host.data_disks</code> | — | <code>listplanmodifier.RequiresReplace()</code> |
| <code>master_host.data_disks&#91;&#93;.size</code> | <code>int32validator.Between(10, 20000)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>master_host.data_disks&#91;&#93;.type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>master_host.item_def_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>master_host.sys_disk.size</code> | <code>int32validator.Between(80, 2040)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>master_host.sys_disk.type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>master_order_id</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>name</code> | — | <code>stringplanmodifier.UseStateForUnknown()</code> |
| <code>region_id</code> | <code>stringvalidator.UTF8LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.az_infos</code> | — | <code>setplanmodifier.RequiresReplace()</code> |
| <code>slave_host.az_infos&#91;&#93;.az_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.az_infos&#91;&#93;.size</code> | <code>int32validator.AtLeast(1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>slave_host.data_disks</code> | — | <code>listplanmodifier.RequiresReplace()</code> |
| <code>slave_host.data_disks&#91;&#93;.size</code> | <code>int32validator.Between(10, 20000)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>slave_host.data_disks&#91;&#93;.type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.instance_type</code> | <code>stringvalidator.OneOf(business.CcseSlaveInstanceTypeEcs, business.CcseSlaveInstanceTypeEbm)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.item_def_name</code> | <code>stringvalidator.LengthAtLeast(1)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.mirror_id</code> | <code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("slave_host").AtName("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEcs),<br>							)</code><br><code>validator2.ConflictsWithEqualString(<br>								path.MatchRoot("slave_host").AtName("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEbm),<br>							)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.mirror_name</code> | <code>validator2.AlsoRequiresEqualString(<br>								path.MatchRoot("slave_host").AtName("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEbm),<br>							)</code><br><code>validator2.ConflictsWithEqualString(<br>								path.MatchRoot("slave_host").AtName("instance_type"),<br>								types.StringValue(business.CcseSlaveInstanceTypeEcs),<br>							)</code> | <code>stringplanmodifier.RequiresReplace()</code> |
| <code>slave_host.mirror_type</code> | <code>int32validator.Between(0, 1)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>slave_host.sys_disk.size</code> | <code>int32validator.Between(80, 2040)</code> | <code>int32planmodifier.RequiresReplace()</code> |
| <code>slave_host.sys_disk.type</code> | <code>stringvalidator.OneOf(business.EbsDiskTypesUpper...)</code> | <code>stringplanmodifier.RequiresReplace()</code> |

## 原文档与示例核对

**Schema 清单：** 属性路径、类型及 R/O/C 类别与源码一致。

**docs 示例：** 未完整展示；同类型的 1 个有效 HCL 目标块合并后，显式展示 53 / 63 个可配置属性路径。注释掉的参数不计入；只核对字段展示，不证明值、组合或部署有效。

**未显式展示的可配置属性：** <code>base_info.auto_renew</code>、<code>base_info.cycle_count</code>、<code>base_info.node_scale</code>、<code>base_info.pod_cidr</code>、<code>base_info.project_id</code>、<code>base_info.security_group_id</code>、<code>base_info.series_type</code>、<code>base_info.service_cidr</code>、<code>region_id</code>、<code>slave_host.mirror_name</code>。

**examples 源文件：** [examples/resources/ctyun_ccse_cluster/resource.tf](../../../examples/resources/ctyun_ccse_cluster/resource.tf)；未完整展示，显式展示 53 / 63。

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
  description = "Complete configurable shape for ctyun_ccse_cluster; consult constraints before use."
  nullable    = false
  type = object({
    base_info = object({
      auto_renew             = optional(bool)
      cluster_domain         = optional(string)
      cluster_name           = string
      cluster_series         = string
      cluster_version        = string
      container_runtime      = optional(string)
      cycle_count            = optional(number)
      cycle_type             = string
      deploy_type            = optional(string)
      elb_prod_code          = optional(string)
      enable_api_server_eip  = optional(bool)
      enable_snat            = optional(bool)
      end_port               = number
      install_als            = optional(bool)
      install_als_cube_event = optional(bool)
      install_ccse_monitor   = optional(bool)
      install_nginx_ingress  = optional(bool)
      ip_vlan                = optional(bool)
      kube_proxy             = string
      nat_gateway_spec       = optional(string)
      network_plugin         = string
      network_policy         = optional(bool)
      nginx_ingress_lb_spec  = optional(string)
      nginx_ingress_network  = optional(string)
      node_scale             = optional(number)
      pod_cidr               = optional(string)
      pod_subnet_id_list     = optional(set(string))
      project_id             = optional(string)
      security_group_id      = optional(string)
      series_type            = optional(string)
      service_cidr           = optional(string)
      start_port             = number
      subnet_id              = string
      timezone               = string
      vpc_id                 = string
    })
    master_host = optional(object({
      az_infos = list(object({
        az_name = string
        size    = number
      }))
      data_disks = optional(list(object({
        size = number
        type = string
      })))
      item_def_name = string
      sys_disk = optional(object({
        size = number
        type = string
      }))
    }))
    region_id = optional(string)
    slave_host = object({
      az_infos = set(object({
        az_name = string
        size    = number
      }))
      data_disks = optional(list(object({
        size = number
        type = string
      })))
      instance_type = string
      item_def_name = string
      mirror_id     = optional(string)
      mirror_name   = optional(string)
      mirror_type   = number
      sys_disk = optional(object({
        size = number
        type = string
      }))
    })
  })
}

resource "ctyun_ccse_cluster" "example" {
  base_info   = var.config.base_info
  master_host = var.config.master_host
  region_id   = var.config.region_id
  slave_host  = var.config.slave_host
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_cluster.example.create_time : string
# ctyun_ccse_cluster.example.expire_time : string
# ctyun_ccse_cluster.example.external_kube_config : string
# ctyun_ccse_cluster.example.id : string
# ctyun_ccse_cluster.example.internal_kube_config : string
# ctyun_ccse_cluster.example.master_order_id : string
# ctyun_ccse_cluster.example.name : string
```

</details>
