# 天翼云 Terraform 资源全属性目录

**范围：170 种已注册 resource，34 个源码产品分类，146 种 data source（另列索引）。** 递归展开共有 2141 个属性路径，其中可配置 1524、只读 617。

**核对结论：** 170/170 份原文档的 Schema 清单在属性路径、类型、必填/可选/只读分类上与源码一致；但只有 14/170 份 docs 示例显式覆盖全部可配置属性。文档 Schema 清单与 Example 是两件事，不能用示例替代完整属性说明。具体缺项和不支持参数见[审计报告](AUDIT.md)及每个资源的详情页。

## 阅读入口

| 内容 | 入口 |
| --- | --- |
| 按云产品分类的资源汇总 | [下方分类汇总](#产品分类汇总) |
| 每个 resource 的全属性表、约束、源码行与 TF 模板 | 点击汇总表中的资源名或 `.tf` |
| 现有 docs / examples 覆盖核对 | [AUDIT.md](AUDIT.md) |
| Provider 全局属性和凭据配置 | [PROVIDER.md](PROVIDER.md) |
| 查询型 data source 索引（不混入 resource） | [DATA_SOURCES.md](DATA_SOURCES.md) |
| Excel / 数据处理用资源汇总 | [resources.csv](resources.csv) |
| 逐属性清单（含嵌套、默认值、校验器、源码定位） | [attributes.csv](attributes.csv) |
| Azure 对照起始表（未预设等价关系） | [azure-mapping-template.csv](azure-mapping-template.csv) |
| 完整机器可读源码快照 | [catalog.json](catalog.json) |

## 范围与依据

- Provider 源码自报版本：`2.3.2`；相关源码最近提交：`63d015d46357d8a07de7901adb3735804818b657`；相关源码工作区无未提交变化。
- 源码指纹（SHA-256）：`64c2797384cb504104dc4bfdee607bd3daefea80e1bc9718b66f5cf54704642a`。
- 以 `CtyunProvider.Resources()` 的实际注册、构造函数返回类型、`Metadata` 名称和 `Schema` 为依据，通过 Go AST 解析排除注释代码，不按文件名或 SDK API 数量推算。资源包装器的 `Schema` 仅转发目标 Schema。
- 属性数包含父容器和嵌套子属性；`labels[].key` 中 `[]` 表示 list/set 元素，`{}` 表示 map 任意键。任意 map 的用户自定义键不是额外 Schema 属性。R=Required，O=Optional，C=Computed，O+C 是可配置输入。
- 本目录是本地源码静态契约核对，不是云 API 探测、运行时 provider schema 导出或 CRUD 兼容性认证。默认值/校验器保留源码表达式；Schema 之外的业务条件、远端限制、区域可用性需进一步确认。源码版本号不保证与 Registry 同名版本内容完全一致。
- Terraform `resource` 也可能代表绑定、配置、恢复或重启等动作，并非每一项都是独立的云实例。Terraform 自带的 `count`、`for_each`、`depends_on`、`lifecycle` 等 meta-arguments 不属于 provider 属性，不计入。

## 模板使用方式

每个 `.tf` 是一个独立模块模板，包含 provider 声明、完整的 `variable "config"` 对象类型、resource 赋值及只读属性引用注释。**它不是已填入合法值的可直接部署样例。**

将选定的一个模板复制到独立目录并命名为 `main.tf`；依据详情页的约束，在该目录的 `terraform.tfvars` 中为 `config = { ... }` 填入真实必填值及所需可选值。嵌套对象类型内没有 `optional(...)` 的成员，在提供父对象或元素时必须填写。不需要的可选成员直接省略，provider 会按其自身规则处理 `null`。

**不要**把全部模板放进同一 Terraform 根模块运行：模板复用了 `config` 和 `example`，并包含重复的 provider 声明。组合多个资源时应合并 provider 声明、重命名变量/资源标签并显式建立依赖引用。

凭据优先通过 `CTYUN_AK` / `CTYUN_SK` 等环境变量注入；不要把秘密写入 TF 文件或映射表。含敏感输入的模板把整个 `config` 标记为 sensitive；这不会加密 Terraform state。模板不写死 Registry 版本，实际使用时必须选定与目标源码契约一致的 provider 版本并保留依赖锁文件。

以 ECS 为例，`flavor_id` 与 `flavor_name` 需二选一，`password` 与 `key_pair_name` 互斥，`cycle_count` 是否必填取决于 `cycle_type`；“覆盖全部属性”并不意味着同时给所有字段赋非空值。普通输入和只读输出分开，避免不可配置字段导致错误。

## 后续与 Azure 对照

先固定 Azure 的接口层与版本（例如 `azurerm` 或 `azapi`），再复制 `azure-mapping-template.csv` 到一个手工维护的文件。**不要直接编辑生成文件**，重新生成会覆盖它们。以 `(ctyun_resource_type, ctyun_attribute_path)` 作为稳定关联键，从 `attributes.csv` 补充源侧类型、R/O/C、默认值、敏感性、枚举/约束和更新行为。

映射表预留 Azure provider、版本、资源类型、属性路径、变换说明和备注。`mapping_status` 初始为 `unassessed`，可改为 `direct`、`transform`、`split`、`unsupported`；这些标签需要人工证据，不应仅凭名称相似推断等价。默认值/空值、计费、单位、地域/AZ、标识符、嵌套集合及重建语义都要对照。

## 产品分类汇总

| 产品分类（源码原称） | resource 数 | 可配置属性路径 | 只读属性路径 |
| --- | --- | --- | --- |
| [NAT网关（CT-NAT Gateway）](#service-9f2f3e32fb) | 7 | 60 | 40 |
| [VPC终端节点（VPC Endpoint）](#service-90b6174182) | 5 | 47 | 15 |
| [云助手](#service-b4916ee5f7) | 3 | 26 | 22 |
| [云容器引擎（CCSE）](#service-322824080d) | 5 | 108 | 20 |
| [云硬盘（CT-EVS，Elastic Volume Service）](#service-df28e210ca) | 10 | 77 | 43 |
| [云间高速（标准版）（CT-EC, Express Connect Standard）](#service-b69f8feeb6) | 7 | 50 | 21 |
| [共享带宽（Shared Bandwidth）](#service-e3e55b487d) | 3 | 13 | 6 |
| [关系数据库MySQL版](#service-cc4b7944dc) | 13 | 96 | 42 |
| [关系数据库PostgreSQL版](#service-2e84c10d32) | 8 | 73 | 36 |
| [内网DNS（Intranet Domain Name Service，CT-IDNS）](#service-043d7ea8e7) | 2 | 18 | 7 |
| [函数计算（FaaS）](#service-368c04c6f4) | 5 | 56 | 21 |
| [分布式消息服务Kafka](#service-a154906fb6) | 5 | 71 | 32 |
| [分布式消息服务RabbitMQ](#service-1db755ac07) | 4 | 41 | 11 |
| [分布式消息服务RocketMQ](#service-99cc20fd00) | 3 | 33 | 7 |
| [分布式缓存服务Redis版](#service-783acb15e2) | 7 | 70 | 31 |
| [天翼云OpenSearch服务](#service-552a14ac83) | 1 | 19 | 3 |
| [天翼云SD-WAN](#service-5b0e3f7ea5) | 1 | 3 | 1 |
| [容器镜像服务（CRS）](#service-cb783cda73) | 1 | 3 | 1 |
| [对等连接（VPC peering connection）](#service-a42f402d5d) | 2 | 13 | 10 |
| [对象存储（CT-ZOS，Zettabyte Object Storage）](#service-9719e3fc06) | 3 | 27 | 8 |
| [并行文件服务HPFS（CT-HPFS，High Performance File Storage）](#service-1f2589ebb1) | 1 | 12 | 9 |
| [弹性IP（Elastic IP，EIP）](#service-81753d5799) | 5 | 24 | 27 |
| [弹性云主机（CT-ECS，Elastic Cloud Server）](#service-ab5ebe0a39) | 12 | 91 | 49 |
| [弹性伸缩服务（CT-AS，Auto Scaling）](#service-d42ebc61e3) | 4 | 76 | 6 |
| [弹性文件服务（CT-SFS，Scalable File Service）](#service-0cec95b794) | 4 | 25 | 20 |
| [弹性网卡（Elastic Network Interface）](#service-6ab6c74051) | 1 | 10 | 6 |
| [弹性负载均衡（CT-ELB ，Elastic Load Balancing）](#service-54cad1bbd2) | 8 | 101 | 35 |
| [文档数据库服务（MongoDB）](#service-d8462460a7) | 6 | 52 | 14 |
| [海量文件服务OceanFS](#service-1c712ffa34) | 4 | 26 | 13 |
| [物理机服务（CT-DPS，Dedicated Physical Server）](#service-02641bc2d6) | 3 | 34 | 15 |
| [统一身份认证（Identity and Access Management，简称IAM）](#service-a1ffa4ca08) | 9 | 36 | 13 |
| [虚拟IP（Virtual IP，VIP）](#service-b0e63d3331) | 2 | 12 | 4 |
| [虚拟私有云（Virtual Private Cloud，VPC）](#service-f197615898) | 13 | 92 | 26 |
| [镜像服务（CT-IMS，Image Management Service）](#service-ff1c284b79) | 3 | 29 | 3 |

<a id="service-9f2f3e32fb"></a>
### NAT网关（CT-NAT Gateway）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_nat`](details/ctyun_nat.md) | 管理公网NAT网关 | 4 / 10 / 7 | 14 / 7 | 6/14 · 未完整展示 | [.tf](templates/ctyun_nat.tf) |
| [`ctyun_nat_dnat`](details/ctyun_nat_dnat.md) | 管理公网NAT网关dnat规则 | 6 / 5 / 6 | 11 / 6 | 7/11 · 未完整展示 | [.tf](templates/ctyun_nat_dnat.tf) |
| [`ctyun_nat_snat`](details/ctyun_nat_snat.md) | 管理公网NAT网关snat规则 | 2 / 4 / 5 | 6 / 7 | 3/6 · 未完整展示 | [.tf](templates/ctyun_nat_snat.tf) |
| [`ctyun_private_nat`](details/ctyun_private_nat.md) | 管理私网NAT网关 | 5 / 7 / 6 | 12 / 6 | 6/12 · 未完整展示 | [.tf](templates/ctyun_private_nat.tf) |
| [`ctyun_private_nat_dnat`](details/ctyun_private_nat_dnat.md) | 管理私网NAT网关dnat规则 | 5 / 4 / 6 | 9 / 6 | 6/9 · 未完整展示 | [.tf](templates/ctyun_private_nat_dnat.tf) |
| [`ctyun_private_nat_snat`](details/ctyun_private_nat_snat.md) | 管理私网NAT网关snat规则 | 3 / 2 / 4 | 5 / 4 | 4/5 · 未完整展示 | [.tf](templates/ctyun_private_nat_snat.tf) |
| [`ctyun_private_nat_transit_ip`](details/ctyun_private_nat_transit_ip.md) | 管理私网NAT网关的中转IP | 2 / 1 / 4 | 3 / 4 | 2/3 · 未完整展示 | [.tf](templates/ctyun_private_nat_transit_ip.tf) |

<a id="service-90b6174182"></a>
### VPC终端节点（VPC Endpoint）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_vpce`](details/ctyun_vpce.md) | 管理终端节点 | 5 / 7 / 5 | 12 / 5 | 6/12 · 未完整展示 | [.tf](templates/ctyun_vpce.tf) |
| [`ctyun_vpce_service`](details/ctyun_vpce_service.md) | 管理终端节点服务 | 4 / 12 / 3 | 19 / 3 | 11/19 · 未完整展示 | [.tf](templates/ctyun_vpce_service.tf) |
| [`ctyun_vpce_service_connection`](details/ctyun_vpce_service_connection.md) | 接受或拒绝终端节点连接申请 | 3 / 1 / 1 | 4 / 1 | 3/4 · 未完整展示 | [.tf](templates/ctyun_vpce_service_connection.tf) |
| [`ctyun_vpce_service_reverse_rule`](details/ctyun_vpce_service_reverse_rule.md) | 管理终端节点服务反向规则 | 7 / 1 / 3 | 8 / 3 | 7/8 · 未完整展示 | [.tf](templates/ctyun_vpce_service_reverse_rule.tf) |
| [`ctyun_vpce_service_transit_ip`](details/ctyun_vpce_service_transit_ip.md) | 管理终端节点服务中转IP | 2 / 2 / 3 | 4 / 3 | 2/4 · 未完整展示 | [.tf](templates/ctyun_vpce_service_transit_ip.tf) |

<a id="service-b4916ee5f7"></a>
### 云助手

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_cloud_assistant_command`](details/ctyun_cloud_assistant_command.md) | 管理云助手命令 | 3 / 6 / 3 | 9 / 3 | 5/9 · 未完整展示 | [.tf](templates/ctyun_cloud_assistant_command.tf) |
| [`ctyun_cloud_assistant_invocation`](details/ctyun_cloud_assistant_invocation.md) | 触发云助手命令执行并查询执行结果 | 2 / 4 / 2 | 6 / 10 | 3/6 · 未完整展示 | [.tf](templates/ctyun_cloud_assistant_invocation.tf) |
| [`ctyun_cloud_assistant_run_command`](details/ctyun_cloud_assistant_run_command.md) | 在云主机中执行一段Shell、PowerShell、Bat或Python类型的脚本命令 | 1 / 10 / 2 | 11 / 9 | 7/11 · 未完整展示 | [.tf](templates/ctyun_cloud_assistant_run_command.tf) |

<a id="service-322824080d"></a>
### 云容器引擎（CCSE）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_ccse_cluster`](details/ctyun_ccse_cluster.md) | 管理云容器引擎集群 | 2 / 2 / 7 | 63 / 7 | 53/63 · 未完整展示 | [.tf](templates/ctyun_ccse_cluster.tf) |
| [`ctyun_ccse_namespace`](details/ctyun_ccse_namespace.md) | 管理云容器引擎命名空间 | 1 / 2 / 3 | 3 / 3 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ccse_namespace.tf) |
| [`ctyun_ccse_node_association`](details/ctyun_ccse_node_association.md) | 纳管云容器引擎节点 | 4 / 5 / 7 | 9 / 7 | 7/9 · 未完整展示 | [.tf](templates/ctyun_ccse_node_association.tf) |
| [`ctyun_ccse_node_pool`](details/ctyun_ccse_node_pool.md) | 管理云容器引擎节点池 | 7 / 15 / 1 | 27 / 1 | 21/27 · 未完整展示 | [.tf](templates/ctyun_ccse_node_pool.tf) |
| [`ctyun_ccse_plugin`](details/ctyun_ccse_plugin.md) | 管理云容器引擎插件 | 3 / 3 / 2 | 6 / 2 | 4/6 · 未完整展示 | [.tf](templates/ctyun_ccse_plugin.tf) |

<a id="service-df28e210ca"></a>
### 云硬盘（CT-EVS，Elastic Volume Service）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_ebs`](details/ctyun_ebs.md) | 管理云硬盘 | 5 / 11 / 6 | 18 / 6 | 5/18 · 未完整展示 | [.tf](templates/ctyun_ebs.tf) |
| [`ctyun_ebs_association_ecs`](details/ctyun_ebs_association_ecs.md) | 管理云硬盘和云主机的绑定关系（已废弃，请使用ctyun_ecs_data_volume进行绑定） | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ebs_association_ecs.tf) |
| [`ctyun_ebs_backup`](details/ctyun_ebs_backup.md) | 管理云硬盘备份 | 3 / 3 / 12 | 6 / 12 | 4/6 · 未完整展示 | [.tf](templates/ctyun_ebs_backup.tf) |
| [`ctyun_ebs_backup_policy`](details/ctyun_ebs_backup_policy.md) | 管理云硬盘备份策略 | 4 / 11 / 3 | 19 / 5 | 11/19 · 未完整展示 | [.tf](templates/ctyun_ebs_backup_policy.tf) |
| [`ctyun_ebs_backup_policy_bind_disks`](details/ctyun_ebs_backup_policy_bind_disks.md) | 管理云硬盘和备份策略的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ebs_backup_policy_bind_disks.tf) |
| [`ctyun_ebs_backup_policy_bind_repo`](details/ctyun_ebs_backup_policy_bind_repo.md) | 管理云硬盘备份存储库和备份策略的绑定关系 | 2 / 2 / 1 | 4 / 1 | 2/4 · 未完整展示 | [.tf](templates/ctyun_ebs_backup_policy_bind_repo.tf) |
| [`ctyun_ebs_backup_repo`](details/ctyun_ebs_backup_repo.md) | 管理云硬盘备份存储库 | 3 / 5 / 10 | 8 / 10 | 4/8 · 未完整展示 | [.tf](templates/ctyun_ebs_backup_repo.tf) |
| [`ctyun_ebs_snapshot`](details/ctyun_ebs_snapshot.md) | 管理云硬盘快照 | 3 / 3 / 2 | 6 / 2 | 3/6 · 未完整展示 | [.tf](templates/ctyun_ebs_snapshot.tf) |
| [`ctyun_ebs_snapshot_policy`](details/ctyun_ebs_snapshot_policy.md) | 管理云硬盘快照策略 | 4 / 3 / 4 | 7 / 4 | 5/7 · 未完整展示 | [.tf](templates/ctyun_ebs_snapshot_policy.tf) |
| [`ctyun_ebs_snapshot_policy_association`](details/ctyun_ebs_snapshot_policy_association.md) | 管理云硬盘和快照策略的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ebs_snapshot_policy_association.tf) |

<a id="service-b69f8feeb6"></a>
### 云间高速（标准版）（CT-EC, Express Connect Standard）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_ec_cloud_gateway`](details/ctyun_ec_cloud_gateway.md) | 管理云企业路由器 | 3 / 3 / 3 | 6 / 3 | 4/6 · 未完整展示 | [.tf](templates/ctyun_ec_cloud_gateway.tf) |
| [`ctyun_ec_packet`](details/ctyun_ec_packet.md) | 管理云间高速带宽包 | 5 / 4 / 7 | 9 / 7 | 7/9 · 未完整展示 | [.tf](templates/ctyun_ec_packet.tf) |
| [`ctyun_ec_region_peer`](details/ctyun_ec_region_peer.md) | 管理云间高速跨域连接 | 6 / 1 / 4 | 7 / 4 | 7/7 · 字段展示完整 | [.tf](templates/ctyun_ec_region_peer.tf) |
| [`ctyun_ec_route`](details/ctyun_ec_route.md) | 管理云间高速路由 | 5 / 4 / 2 | 9 / 2 | 9/9 · 字段展示完整 | [.tf](templates/ctyun_ec_route.tf) |
| [`ctyun_ec_sdwan_instance`](details/ctyun_ec_sdwan_instance.md) | 管理云间高速SDWAN网络实例 | 4 / 3 / 1 | 7 / 1 | 7/7 · 字段展示完整 | [.tf](templates/ctyun_ec_sdwan_instance.tf) |
| [`ctyun_ec_vpc_instance`](details/ctyun_ec_vpc_instance.md) | 管理云间高速VPC网络实例 | 5 / 4 / 1 | 9 / 1 | 0/9 · 缺少目标资源块 | [.tf](templates/ctyun_ec_vpc_instance.tf) |
| [`ctyun_express_connect`](details/ctyun_express_connect.md) | 管理云间高速实例 | 1 / 2 / 3 | 3 / 3 | 2/3 · 未完整展示 | [.tf](templates/ctyun_express_connect.tf) |

<a id="service-e3e55b487d"></a>
### 共享带宽（Shared Bandwidth）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_bandwidth`](details/ctyun_bandwidth.md) | 管理共享带宽 | 3 / 3 / 4 | 6 / 4 | 4/6 · 未完整展示 | [.tf](templates/ctyun_bandwidth.tf) |
| [`ctyun_bandwidth_association_eip`](details/ctyun_bandwidth_association_eip.md) | 管理共享带宽和弹性IP的绑定关系 | 2 / 2 / 1 | 4 / 1 | 2/4 · 未完整展示 | [.tf](templates/ctyun_bandwidth_association_eip.tf) |
| [`ctyun_ipv6_bandwidth_association`](details/ctyun_ipv6_bandwidth_association.md) | 管理共享带宽和弹性IP的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ipv6_bandwidth_association.tf) |

<a id="service-cc4b7944dc"></a>
### 关系数据库MySQL版

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_mysql_account`](details/ctyun_mysql_account.md) | 管理MySQL实例的账户 | 2 / 5 / 1 | 9 / 1 | 4/9 · 未完整展示 | [.tf](templates/ctyun_mysql_account.tf) |
| [`ctyun_mysql_association_eip`](details/ctyun_mysql_association_eip.md) | 管理MySQL实例和弹性IP的绑定关系 | 2 / 2 / 3 | 4 / 3 | 2/4 · 未完整展示 | [.tf](templates/ctyun_mysql_association_eip.tf) |
| [`ctyun_mysql_audit`](details/ctyun_mysql_audit.md) | 设置MySQL实例的审计开关状态 | 2 / 2 / 0 | 4 / 0 | 3/4 · 未完整展示 | [.tf](templates/ctyun_mysql_audit.tf) |
| [`ctyun_mysql_backup`](details/ctyun_mysql_backup.md) | 管理MySQL实例的备份 | 1 / 4 / 2 | 5 / 2 | 4/5 · 未完整展示 | [.tf](templates/ctyun_mysql_backup.tf) |
| [`ctyun_mysql_backup_cancel`](details/ctyun_mysql_backup_cancel.md) | 取消MySQL实例的备份任务 | 2 / 2 / 0 | 4 / 0 | 2/4 · 未完整展示 | [.tf](templates/ctyun_mysql_backup_cancel.tf) |
| [`ctyun_mysql_backup_recovery`](details/ctyun_mysql_backup_recovery.md) | 根据备份进行MySQL实例恢复 | 2 / 5 / 1 | 7 / 1 | 4/7 · 未完整展示 | [.tf](templates/ctyun_mysql_backup_recovery.tf) |
| [`ctyun_mysql_backup_setting`](details/ctyun_mysql_backup_setting.md) | 管理MySQL实例的备份配置 | 4 / 4 / 1 | 8 / 1 | 4/8 · 未完整展示 | [.tf](templates/ctyun_mysql_backup_setting.tf) |
| [`ctyun_mysql_database`](details/ctyun_mysql_database.md) | 管理MySQL实例的数据库 | 3 / 3 / 2 | 6 / 6 | 3/6 · 未完整展示 | [.tf](templates/ctyun_mysql_database.tf) |
| [`ctyun_mysql_instance`](details/ctyun_mysql_instance.md) | 管理MySQL实例 | 8 / 11 / 19 | 22 / 19 | 10/22 · 未完整展示 | [.tf](templates/ctyun_mysql_instance.tf) |
| [`ctyun_mysql_param_template`](details/ctyun_mysql_param_template.md) | 管理MySQL参数模板 | 2 / 4 / 1 | 6 / 1 | 3/6 · 未完整展示 | [.tf](templates/ctyun_mysql_param_template.tf) |
| [`ctyun_mysql_rds_parameter_template`](details/ctyun_mysql_rds_parameter_template.md) | 配置MySQL实例的参数，同时支持应用参数模板 | 1 / 4 / 1 | 5 / 1 | 2/5 · 未完整展示 | [.tf](templates/ctyun_mysql_rds_parameter_template.tf) |
| [`ctyun_mysql_readonly_instance`](details/ctyun_mysql_readonly_instance.md) | 管理MySQL只读实例 | 5 / 6 / 3 | 11 / 3 | 6/11 · 未完整展示 | [.tf](templates/ctyun_mysql_readonly_instance.tf) |
| [`ctyun_mysql_white_list`](details/ctyun_mysql_white_list.md) | 管理MySQL实例的白名单 | 3 / 2 / 4 | 5 / 4 | 3/5 · 未完整展示 | [.tf](templates/ctyun_mysql_white_list.tf) |

<a id="service-2e84c10d32"></a>
### 关系数据库PostgreSQL版

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_postgresql_account`](details/ctyun_postgresql_account.md) | 管理PostgreSQL实例的账户 | 2 / 7 / 8 | 11 / 8 | 5/11 · 未完整展示 | [.tf](templates/ctyun_postgresql_account.tf) |
| [`ctyun_postgresql_association_eip`](details/ctyun_postgresql_association_eip.md) | 管理PostgreSQL实例和弹性IP的绑定关系 | 2 / 2 / 2 | 4 / 2 | 2/4 · 未完整展示 | [.tf](templates/ctyun_postgresql_association_eip.tf) |
| [`ctyun_postgresql_backup`](details/ctyun_postgresql_backup.md) | 管理PostgreSQL实例的备份 | 2 / 3 / 5 | 5 / 5 | 3/5 · 未完整展示 | [.tf](templates/ctyun_postgresql_backup.tf) |
| [`ctyun_postgresql_database`](details/ctyun_postgresql_database.md) | 管理PostgreSQL实例的数据库 | 3 / 6 / 1 | 9 / 1 | 8/9 · 未完整展示 | [.tf](templates/ctyun_postgresql_database.tf) |
| [`ctyun_postgresql_instance`](details/ctyun_postgresql_instance.md) | 管理PostgreSQL实例 | 8 / 13 / 14 | 24 / 14 | 12/24 · 未完整展示 | [.tf](templates/ctyun_postgresql_instance.tf) |
| [`ctyun_postgresql_param_template`](details/ctyun_postgresql_param_template.md) | 管理PostgreSQL参数模板 | 1 / 5 / 1 | 6 / 1 | 0/6 · 缺少目标资源块 | [.tf](templates/ctyun_postgresql_param_template.tf) |
| [`ctyun_postgresql_readonly_instance`](details/ctyun_postgresql_readonly_instance.md) | 管理PostgreSQL只读实例 | 3 / 6 / 3 | 9 / 3 | 4/9 · 未完整展示 | [.tf](templates/ctyun_postgresql_readonly_instance.tf) |
| [`ctyun_postgresql_white_list`](details/ctyun_postgresql_white_list.md) | 管理PostgreSQL实例的白名单 | 1 / 4 / 2 | 5 / 2 | 3/5 · 未完整展示 | [.tf](templates/ctyun_postgresql_white_list.tf) |

<a id="service-043d7ea8e7"></a>
### 内网DNS（Intranet Domain Name Service，CT-IDNS）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_private_zone`](details/ctyun_private_zone.md) | 管理内网DNS | 2 / 6 / 3 | 10 / 4 | 5/10 · 未完整展示 | [.tf](templates/ctyun_private_zone.tf) |
| [`ctyun_private_zone_record`](details/ctyun_private_zone_record.md) | 管理内网DNS记录 | 4 / 4 / 3 | 8 / 3 | 7/8 · 未完整展示 | [.tf](templates/ctyun_private_zone_record.tf) |

<a id="service-368c04c6f4"></a>
### 函数计算（FaaS）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_function`](details/ctyun_function.md) | 管理函数 | 3 / 21 / 5 | 24 / 5 | 17/24 · 未完整展示 | [.tf](templates/ctyun_function.tf) |
| [`ctyun_function_alias`](details/ctyun_function_alias.md) | 管理函数别名 | 3 / 4 / 2 | 7 / 2 | 6/7 · 存在不支持的参数/块 | [.tf](templates/ctyun_function_alias.tf) |
| [`ctyun_function_domain`](details/ctyun_function_domain.md) | 管理自定义域名 | 1 / 14 / 7 | 15 / 7 | 4/15 · 存在不支持的参数/块 | [.tf](templates/ctyun_function_domain.tf) |
| [`ctyun_function_trigger`](details/ctyun_function_trigger.md) | 管理函数触发器 | 4 / 3 / 4 | 7 / 4 | 0/7 · 缺少目标资源块 | [.tf](templates/ctyun_function_trigger.tf) |
| [`ctyun_function_version`](details/ctyun_function_version.md) | 管理函数版本 | 1 / 2 / 3 | 3 / 3 | 2/3 · 未完整展示 | [.tf](templates/ctyun_function_version.tf) |

<a id="service-a154906fb6"></a>
### 分布式消息服务Kafka

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_kafka_acl`](details/ctyun_kafka_acl.md) | 管理KAFKA的访问控制 | 3 / 2 / 2 | 9 / 2 | 7/9 · 未完整展示 | [.tf](templates/ctyun_kafka_acl.tf) |
| [`ctyun_kafka_consumer_group`](details/ctyun_kafka_consumer_group.md) | 管理KAFKA的消费组 | 2 / 3 / 4 | 11 / 4 | 3/11 · 未完整展示 | [.tf](templates/ctyun_kafka_consumer_group.tf) |
| [`ctyun_kafka_instance`](details/ctyun_kafka_instance.md) | 管理KAFKA实例 | 10 / 13 / 7 | 23 / 7 | 12/23 · 未完整展示 | [.tf](templates/ctyun_kafka_instance.tf) |
| [`ctyun_kafka_topic`](details/ctyun_kafka_topic.md) | 管理KAFKA的主题 | 3 / 15 / 3 | 18 / 17 | 3/18 · 未完整展示 | [.tf](templates/ctyun_kafka_topic.tf) |
| [`ctyun_kafka_user`](details/ctyun_kafka_user.md) | 管理KAFKA的用户 | 2 / 4 / 2 | 10 / 2 | 7/10 · 未完整展示 | [.tf](templates/ctyun_kafka_user.tf) |

<a id="service-1db755ac07"></a>
### 分布式消息服务RabbitMQ

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_rabbitmq_exchange`](details/ctyun_rabbitmq_exchange.md) | 管理RabbitMQ实例的交换器 | 4 / 6 / 1 | 10 / 1 | 4/10 · 未完整展示 | [.tf](templates/ctyun_rabbitmq_exchange.tf) |
| [`ctyun_rabbitmq_instance`](details/ctyun_rabbitmq_instance.md) | 管理RabbitMQ实例 | 9 / 4 / 8 | 13 / 8 | 10/13 · 未完整展示 | [.tf](templates/ctyun_rabbitmq_instance.tf) |
| [`ctyun_rabbitmq_queue`](details/ctyun_rabbitmq_queue.md) | 管理RabbitMQ实例的队列 | 3 / 12 / 1 | 15 / 1 | 12/15 · 未完整展示 | [.tf](templates/ctyun_rabbitmq_queue.tf) |
| [`ctyun_rabbitmq_vhost`](details/ctyun_rabbitmq_vhost.md) | 管理RabbitMQ实例的虚拟主机 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_rabbitmq_vhost.tf) |

<a id="service-99cc20fd00"></a>
### 分布式消息服务RocketMQ

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_rocketmq_group`](details/ctyun_rocketmq_group.md) | 管理 RocketMQ 订阅组 | 3 / 7 / 1 | 10 / 1 | 7/10 · 未完整展示 | [.tf](templates/ctyun_rocketmq_group.tf) |
| [`ctyun_rocketmq_instance`](details/ctyun_rocketmq_instance.md) | 管理 RocketMQ 实例 | 9 / 6 / 5 | 15 / 5 | 12/15 · 未完整展示 | [.tf](templates/ctyun_rocketmq_instance.tf) |
| [`ctyun_rocketmq_topic`](details/ctyun_rocketmq_topic.md) | 管理 RocketMQ 主题 | 4 / 4 / 1 | 8 / 1 | 5/8 · 未完整展示 | [.tf](templates/ctyun_rocketmq_topic.tf) |

<a id="service-783acb15e2"></a>
### 分布式缓存服务Redis版

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_redis_account`](details/ctyun_redis_account.md) | 管理Redis实例的账户 | 2 / 4 / 1 | 6 / 1 | 5/6 · 未完整展示 | [.tf](templates/ctyun_redis_account.tf) |
| [`ctyun_redis_association_eip`](details/ctyun_redis_association_eip.md) | 管理Redis实例和弹性IP的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_redis_association_eip.tf) |
| [`ctyun_redis_backup`](details/ctyun_redis_backup.md) | 管理Redis实例的备份 | 1 / 3 / 6 | 4 / 6 | 1/4 · 未完整展示 | [.tf](templates/ctyun_redis_backup.tf) |
| [`ctyun_redis_instance`](details/ctyun_redis_instance.md) | 管理Redis实例 | 8 / 18 / 10 | 29 / 10 | 15/29 · 未完整展示 | [.tf](templates/ctyun_redis_instance.tf) |
| [`ctyun_redis_instance_whitelist`](details/ctyun_redis_instance_whitelist.md) | 管理Redis实例白名单 | 2 / 2 / 1 | 4 / 1 | 3/4 · 未完整展示 | [.tf](templates/ctyun_redis_instance_whitelist.tf) |
| [`ctyun_redis_migration_task`](details/ctyun_redis_migration_task.md) | 管理Redis迁移任务 | 2 / 4 / 4 | 16 / 4 | 12/16 · 未完整展示 | [.tf](templates/ctyun_redis_migration_task.tf) |
| [`ctyun_redis_param_template`](details/ctyun_redis_param_template.md) | 管理Redis参数模板 | 2 / 4 / 2 | 8 / 8 | 7/8 · 未完整展示 | [.tf](templates/ctyun_redis_param_template.tf) |

<a id="service-552a14ac83"></a>
### 天翼云OpenSearch服务

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_search_instance`](details/ctyun_search_instance.md) | 管理OpenSearch实例 | 10 / 4 / 3 | 19 / 3 | 19/19 · 字段展示完整 | [.tf](templates/ctyun_search_instance.tf) |

<a id="service-5b0e3f7ea5"></a>
### 天翼云SD-WAN

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_sdwan`](details/ctyun_sdwan.md) | 管理SDWAN | 1 / 2 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_sdwan.tf) |

<a id="service-cb783cda73"></a>
### 容器镜像服务（CRS）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_crs_vpc_attach`](details/ctyun_crs_vpc_attach.md) | 将虚拟私有云接入容器镜像服务 | 1 / 2 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_crs_vpc_attach.tf) |

<a id="service-a42f402d5d"></a>
### 对等连接（VPC peering connection）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_vpc_peer_connection`](details/ctyun_vpc_peer_connection.md) | 管理对等连接 | 3 / 5 / 8 | 10 / 9 | 6/10 · 未完整展示 | [.tf](templates/ctyun_vpc_peer_connection.tf) |
| [`ctyun_vpc_peer_connection_attach`](details/ctyun_vpc_peer_connection_attach.md) | 接受或拒绝对等连接申请 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_vpc_peer_connection_attach.tf) |

<a id="service-9719e3fc06"></a>
### 对象存储（CT-ZOS，Zettabyte Object Storage）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_zos_bucket`](details/ctyun_zos_bucket.md) | 管理对象存储桶 | 1 / 14 / 4 | 15 / 4 | 3/15 · 未完整展示 | [.tf](templates/ctyun_zos_bucket.tf) |
| [`ctyun_zos_bucket_object`](details/ctyun_zos_bucket_object.md) | 管理对象存储的对象 | 2 / 9 / 4 | 11 / 4 | 3/11 · 未完整展示 | [.tf](templates/ctyun_zos_bucket_object.tf) |
| [`ctyun_zos_subscribe`](details/ctyun_zos_subscribe.md) | 订阅对象存储服务 | 0 / 1 / 0 | 1 / 0 | 1/1 · 字段展示完整 | [.tf](templates/ctyun_zos_subscribe.tf) |

<a id="service-1f2589ebb1"></a>
### 并行文件服务HPFS（CT-HPFS，High Performance File Storage）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_hpfs`](details/ctyun_hpfs.md) | 管理并行文件服务实例 | 3 / 9 / 9 | 12 / 9 | 4/12 · 未完整展示 | [.tf](templates/ctyun_hpfs.tf) |

<a id="service-81753d5799"></a>
### 弹性IP（Elastic IP，EIP）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_eip`](details/ctyun_eip.md) | 管理弹性IP | 3 / 4 / 9 | 7 / 9 | 4/7 · 未完整展示 | [.tf](templates/ctyun_eip.tf) |
| [`ctyun_eip_association`](details/ctyun_eip_association.md) | 管理弹性IP的绑定 | 2 / 3 / 1 | 5 / 1 | 4/5 · 未完整展示 | [.tf](templates/ctyun_eip_association.tf) |
| [`ctyun_flow_package`](details/ctyun_flow_package.md) | 管理共享流量包 | 2 / 1 / 7 | 3 / 7 | 2/3 · 未完整展示 | [.tf](templates/ctyun_flow_package.tf) |
| [`ctyun_ipv6_bandwidth`](details/ctyun_ipv6_bandwidth.md) | 管理IPv6带宽 | 3 / 3 / 8 | 6 / 8 | 4/6 · 未完整展示 | [.tf](templates/ctyun_ipv6_bandwidth.tf) |
| [`ctyun_ipv6_gateway`](details/ctyun_ipv6_gateway.md) | 管理IPv6网关 | 1 / 2 / 2 | 3 / 2 | 1/3 · 未完整展示 | [.tf](templates/ctyun_ipv6_gateway.tf) |

<a id="service-ab5ebe0a39"></a>
### 弹性云主机（CT-ECS，Elastic Cloud Server）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_ecs`](details/ctyun_ecs.md) | 管理云主机 | 8 / 22 / 10 | 32 / 10 | 10/32 · 未完整展示 | [.tf](templates/ctyun_ecs.tf) |
| [`ctyun_ecs_affinity_group`](details/ctyun_ecs_affinity_group.md) | 管理云主机组 | 2 / 1 / 3 | 3 / 3 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ecs_affinity_group.tf) |
| [`ctyun_ecs_affinity_group_association`](details/ctyun_ecs_affinity_group_association.md) | 管理云主机和主机组的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ecs_affinity_group_association.tf) |
| [`ctyun_ecs_backup`](details/ctyun_ecs_backup.md) | 管理云主机备份 | 3 / 3 / 9 | 6 / 9 | 4/6 · 未完整展示 | [.tf](templates/ctyun_ecs_backup.tf) |
| [`ctyun_ecs_backup_policy`](details/ctyun_ecs_backup_policy.md) | 管理云主机备份策略 | 3 / 11 / 3 | 18 / 5 | 11/18 · 未完整展示 | [.tf](templates/ctyun_ecs_backup_policy.tf) |
| [`ctyun_ecs_backup_policy_bind_instances`](details/ctyun_ecs_backup_policy_bind_instances.md) | 管理云主机和备份策略的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ecs_backup_policy_bind_instances.tf) |
| [`ctyun_ecs_backup_policy_bind_repo`](details/ctyun_ecs_backup_policy_bind_repo.md) | 管理云主机备份存储库和备份策略的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ecs_backup_policy_bind_repo.tf) |
| [`ctyun_ecs_backup_repo`](details/ctyun_ecs_backup_repo.md) | 管理云主机备份存储库 | 3 / 5 / 12 | 8 / 12 | 3/8 · 未完整展示 | [.tf](templates/ctyun_ecs_backup_repo.tf) |
| [`ctyun_ecs_data_volume`](details/ctyun_ecs_data_volume.md) | 配置云主机挂载的云硬盘，支持多块盘 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ecs_data_volume.tf) |
| [`ctyun_ecs_port_association`](details/ctyun_ecs_port_association.md) | 管理云主机和弹性网卡的绑定关系 | 2 / 3 / 1 | 5 / 1 | 2/5 · 未完整展示 | [.tf](templates/ctyun_ecs_port_association.tf) |
| [`ctyun_ecs_snapshot`](details/ctyun_ecs_snapshot.md) | 管理云主机快照 | 2 / 1 / 2 | 3 / 2 | 2/3 · 未完整展示 | [.tf](templates/ctyun_ecs_snapshot.tf) |
| [`ctyun_keypair`](details/ctyun_keypair.md) | 管理密钥对 | 1 / 3 / 3 | 4 / 3 | 2/4 · 未完整展示 | [.tf](templates/ctyun_keypair.tf) |

<a id="service-d42ebc61e3"></a>
### 弹性伸缩服务（CT-AS，Auto Scaling）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_scaling_config`](details/ctyun_scaling_config.md) | 管理弹性伸缩配置 | 6 / 7 / 2 | 19 / 2 | 16/19 · 未完整展示 | [.tf](templates/ctyun_scaling_config.tf) |
| [`ctyun_scaling_ecs_protection`](details/ctyun_scaling_ecs_protection.md) | 配置弹性伸缩组云主机的伸缩保护 | 2 / 2 / 0 | 4 / 0 | 3/4 · 未完整展示 | [.tf](templates/ctyun_scaling_ecs_protection.tf) |
| [`ctyun_scaling_group`](details/ctyun_scaling_group.md) | 管理弹性伸缩组 | 10 / 11 / 3 | 25 / 3 | 18/25 · 未完整展示 | [.tf](templates/ctyun_scaling_group.tf) |
| [`ctyun_scaling_policy`](details/ctyun_scaling_policy.md) | 管理弹性伸缩策略 | 3 / 25 / 1 | 28 / 1 | 14/28 · 未完整展示 | [.tf](templates/ctyun_scaling_policy.tf) |

<a id="service-0cec95b794"></a>
### 弹性文件服务（CT-SFS，Scalable File Service）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_sfs`](details/ctyun_sfs.md) | 管理弹性文件服务 | 5 / 8 / 8 | 13 / 8 | 8/13 · 未完整展示 | [.tf](templates/ctyun_sfs.tf) |
| [`ctyun_sfs_permission_group`](details/ctyun_sfs_permission_group.md) | 管理弹性文件服务权限组 | 1 / 2 / 4 | 3 / 4 | 2/3 · 未完整展示 | [.tf](templates/ctyun_sfs_permission_group.tf) |
| [`ctyun_sfs_permission_group_association`](details/ctyun_sfs_permission_group_association.md) | 管理弹性文件服务和权限组的绑定关系 | 3 / 1 / 6 | 4 / 6 | 3/4 · 未完整展示 | [.tf](templates/ctyun_sfs_permission_group_association.tf) |
| [`ctyun_sfs_permission_rule`](details/ctyun_sfs_permission_rule.md) | 管理弹性文件服务权限组规则 | 4 / 1 / 2 | 5 / 2 | 4/5 · 未完整展示 | [.tf](templates/ctyun_sfs_permission_rule.tf) |

<a id="service-6ab6c74051"></a>
### 弹性网卡（Elastic Network Interface）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_port`](details/ctyun_port.md) | 管理弹性网卡 | 1 / 9 / 6 | 10 / 6 | 5/10 · 未完整展示 | [.tf](templates/ctyun_port.tf) |

<a id="service-54cad1bbd2"></a>
### 弹性负载均衡（CT-ELB ，Elastic Load Balancing）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_elb_acl`](details/ctyun_elb_acl.md) | 管理弹性负载均衡ACL | 2 / 3 / 2 | 5 / 2 | 2/5 · 未完整展示 | [.tf](templates/ctyun_elb_acl.tf) |
| [`ctyun_elb_certificate`](details/ctyun_elb_certificate.md) | 管理弹性负载均衡访问证书 | 3 / 4 / 4 | 7 / 4 | 4/7 · 未完整展示 | [.tf](templates/ctyun_elb_certificate.tf) |
| [`ctyun_elb_health_check`](details/ctyun_elb_health_check.md) | 管理弹性负载均衡健康检查 | 2 / 10 / 3 | 12 / 3 | 9/12 · 未完整展示 | [.tf](templates/ctyun_elb_health_check.tf) |
| [`ctyun_elb_listener`](details/ctyun_elb_listener.md) | 管理弹性负载均衡监听器 | 5 / 18 / 3 | 25 / 3 | 9/25 · 未完整展示 | [.tf](templates/ctyun_elb_listener.tf) |
| [`ctyun_elb_loadbalancer`](details/ctyun_elb_loadbalancer.md) | 管理弹性负载均衡 | 6 / 10 / 8 | 16 / 8 | 7/16 · 未完整展示 | [.tf](templates/ctyun_elb_loadbalancer.tf) |
| [`ctyun_elb_rule`](details/ctyun_elb_rule.md) | 管理弹性负载均衡转发规则 | 3 / 5 / 5 | 14 / 5 | 7/14 · 未完整展示 | [.tf](templates/ctyun_elb_rule.tf) |
| [`ctyun_elb_target`](details/ctyun_elb_target.md) | 管理弹性负载均衡后端主机 | 4 / 5 / 6 | 9 / 6 | 4/9 · 未完整展示 | [.tf](templates/ctyun_elb_target.tf) |
| [`ctyun_elb_target_group`](details/ctyun_elb_target_group.md) | 管理弹性负载均衡后端服务组 | 3 / 10 / 4 | 13 / 4 | 8/13 · 未完整展示 | [.tf](templates/ctyun_elb_target_group.tf) |

<a id="service-d8462460a7"></a>
### 文档数据库服务（MongoDB）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_mongodb_account`](details/ctyun_mongodb_account.md) | 管理MongoDB实例的账户 | 3 / 4 / 1 | 9 / 1 | 7/9 · 未完整展示 | [.tf](templates/ctyun_mongodb_account.tf) |
| [`ctyun_mongodb_association_eip`](details/ctyun_mongodb_association_eip.md) | 管理MongoDB实例和弹性IP的绑定关系 | 2 / 2 / 1 | 4 / 1 | 2/4 · 未完整展示 | [.tf](templates/ctyun_mongodb_association_eip.tf) |
| [`ctyun_mongodb_backup`](details/ctyun_mongodb_backup.md) | 管理MongoDB实例的备份 | 2 / 3 / 1 | 5 / 1 | 3/5 · 未完整展示 | [.tf](templates/ctyun_mongodb_backup.tf) |
| [`ctyun_mongodb_instance`](details/ctyun_mongodb_instance.md) | 管理MongoDB实例 | 5 / 16 / 8 | 24 / 8 | 11/24 · 未完整展示 | [.tf](templates/ctyun_mongodb_instance.tf) |
| [`ctyun_mongodb_restart_db`](details/ctyun_mongodb_restart_db.md) | 重启MongoDB实例 | 1 / 2 / 1 | 3 / 1 | 1/3 · 未完整展示 | [.tf](templates/ctyun_mongodb_restart_db.tf) |
| [`ctyun_mongodb_white_list`](details/ctyun_mongodb_white_list.md) | 管理MongoDB实例的白名单 | 5 / 2 / 2 | 7 / 2 | 5/7 · 未完整展示 | [.tf](templates/ctyun_mongodb_white_list.tf) |

<a id="service-1c712ffa34"></a>
### 海量文件服务OceanFS

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_oceanfs`](details/ctyun_oceanfs.md) | 管理海量文件服务 | 5 / 7 / 8 | 14 / 8 | 10/14 · 未完整展示 | [.tf](templates/ctyun_oceanfs.tf) |
| [`ctyun_oceanfs_permission_group`](details/ctyun_oceanfs_permission_group.md) | 管理海量文件服务权限组 | 1 / 2 / 3 | 3 / 3 | 2/3 · 未完整展示 | [.tf](templates/ctyun_oceanfs_permission_group.tf) |
| [`ctyun_oceanfs_permission_group_association`](details/ctyun_oceanfs_permission_group_association.md) | 管理海量文件服务和权限组的绑定关系 | 3 / 1 / 1 | 4 / 1 | 3/4 · 未完整展示 | [.tf](templates/ctyun_oceanfs_permission_group_association.tf) |
| [`ctyun_oceanfs_permission_rule`](details/ctyun_oceanfs_permission_rule.md) | 管理海量文件服务权限组规则 | 3 / 2 / 1 | 5 / 1 | 4/5 · 未完整展示 | [.tf](templates/ctyun_oceanfs_permission_rule.tf) |

<a id="service-02641bc2d6"></a>
### 物理机服务（CT-DPS，Dedicated Physical Server）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_ebm`](details/ctyun_ebm.md) | 管理物理机 | 7 / 17 / 12 | 24 / 12 | 16/24 · 未完整展示 | [.tf](templates/ctyun_ebm.tf) |
| [`ctyun_ebm_association_ebs`](details/ctyun_ebm_association_ebs.md) | 管理物理机与云硬盘的绑定关系 | 2 / 2 / 1 | 4 / 1 | 2/4 · 未完整展示 | [.tf](templates/ctyun_ebm_association_ebs.tf) |
| [`ctyun_ebm_interface`](details/ctyun_ebm_interface.md) | 管理物理机的弹性网卡 | 4 / 2 / 2 | 6 / 2 | 4/6 · 未完整展示 | [.tf](templates/ctyun_ebm_interface.tf) |

<a id="service-a1ffa4ca08"></a>
### 统一身份认证（Identity and Access Management，简称IAM）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_enterprise_project`](details/ctyun_enterprise_project.md) | 管理企业项目 | 1 / 1 / 1 | 2 / 1 | 2/2 · 字段展示完整 | [.tf](templates/ctyun_enterprise_project.tf) |
| [`ctyun_enterprise_project_association_user_group`](details/ctyun_enterprise_project_association_user_group.md) | 管理企业项目和用户组的绑定关系 | 2 / 1 / 0 | 3 / 0 | 3/3 · 字段展示完整 | [.tf](templates/ctyun_enterprise_project_association_user_group.tf) |
| [`ctyun_iam_policy`](details/ctyun_iam_policy.md) | 管理权限策略 | 2 / 2 / 1 | 9 / 1 | 9/9 · 字段展示完整 | [.tf](templates/ctyun_iam_policy.tf) |
| [`ctyun_iam_policy_association_user`](details/ctyun_iam_policy_association_user.md) | 管理策略和用户的绑定关系 | 2 / 1 / 1 | 3 / 1 | 3/3 · 字段展示完整 | [.tf](templates/ctyun_iam_policy_association_user.tf) |
| [`ctyun_iam_policy_association_user_group`](details/ctyun_iam_policy_association_user_group.md) | 管理策略和用户组的绑定关系 | 2 / 1 / 1 | 3 / 1 | 3/3 · 字段展示完整 | [.tf](templates/ctyun_iam_policy_association_user_group.tf) |
| [`ctyun_iam_user`](details/ctyun_iam_user.md) | 管理用户 | 4 / 2 / 2 | 6 / 2 | 6/6 · 字段展示完整 | [.tf](templates/ctyun_iam_user.tf) |
| [`ctyun_iam_user_ak`](details/ctyun_iam_user_ak.md) | 用户AK/SK | 1 / 1 / 4 | 2 / 4 | 2/2 · 字段展示完整 | [.tf](templates/ctyun_iam_user_ak.tf) |
| [`ctyun_iam_user_group`](details/ctyun_iam_user_group.md) | 管理用户组 | 2 / 0 / 1 | 2 / 1 | 2/2 · 字段展示完整 | [.tf](templates/ctyun_iam_user_group.tf) |
| [`ctyun_idp`](details/ctyun_idp.md) | 管理身份认证信息 | 3 / 3 / 2 | 6 / 2 | 6/6 · 字段展示完整 | [.tf](templates/ctyun_idp.tf) |

<a id="service-b0e63d3331"></a>
### 虚拟IP（Virtual IP，VIP）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_vip`](details/ctyun_vip.md) | 管理虚拟IP | 1 / 5 / 3 | 6 / 3 | 4/6 · 未完整展示 | [.tf](templates/ctyun_vip.tf) |
| [`ctyun_vip_association`](details/ctyun_vip_association.md) | 管理虚拟IP的绑定 | 1 / 5 / 1 | 6 / 1 | 4/6 · 未完整展示 | [.tf](templates/ctyun_vip_association.tf) |

<a id="service-f197615898"></a>
### 虚拟私有云（Virtual Private Cloud，VPC）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_acl`](details/ctyun_acl.md) | 管理访问控制 | 2 / 5 / 3 | 7 / 3 | 5/7 · 未完整展示 | [.tf](templates/ctyun_acl.tf) |
| [`ctyun_acl_rule`](details/ctyun_acl_rule.md) | 管理访问控制规则 | 7 / 7 / 1 | 14 / 1 | 12/14 · 未完整展示 | [.tf](templates/ctyun_acl_rule.tf) |
| [`ctyun_dhcpoptionset`](details/ctyun_dhcpoptionset.md) | 管理DHCP选项集 | 3 / 2 / 1 | 5 / 1 | 4/5 · 未完整展示 | [.tf](templates/ctyun_dhcpoptionset.tf) |
| [`ctyun_dhcpoptionset_association_vpc`](details/ctyun_dhcpoptionset_association_vpc.md) | 管理DHCP选项集和VPC的绑定关系 | 2 / 1 / 1 | 3 / 1 | 2/3 · 未完整展示 | [.tf](templates/ctyun_dhcpoptionset_association_vpc.tf) |
| [`ctyun_net_tags`](details/ctyun_net_tags.md) | 管理网络资源的标签 | 2 / 2 / 1 | 6 / 2 | 5/6 · 未完整展示 | [.tf](templates/ctyun_net_tags.tf) |
| [`ctyun_prefix_list`](details/ctyun_prefix_list.md) | 管理前缀列表 | 4 / 2 / 3 | 8 / 3 | 7/8 · 未完整展示 | [.tf](templates/ctyun_prefix_list.tf) |
| [`ctyun_security_group`](details/ctyun_security_group.md) | 管理安全组 | 2 / 3 / 2 | 5 / 2 | 3/5 · 未完整展示 | [.tf](templates/ctyun_security_group.tf) |
| [`ctyun_security_group_rule`](details/ctyun_security_group_rule.md) | 管理安全组规则 | 5 / 5 / 1 | 10 / 1 | 9/10 · 未完整展示 | [.tf](templates/ctyun_security_group_rule.tf) |
| [`ctyun_subnet`](details/ctyun_subnet.md) | 管理子网 | 4 / 6 / 6 | 10 / 6 | 6/10 · 未完整展示 | [.tf](templates/ctyun_subnet.tf) |
| [`ctyun_subnet_association_acl`](details/ctyun_subnet_association_acl.md) | 管理访问控制和子网的绑定关系 | 2 / 2 / 1 | 4 / 1 | 2/4 · 未完整展示 | [.tf](templates/ctyun_subnet_association_acl.tf) |
| [`ctyun_vpc`](details/ctyun_vpc.md) | 管理虚拟私有云 | 2 / 5 / 1 | 7 / 1 | 4/7 · 未完整展示 | [.tf](templates/ctyun_vpc.tf) |
| [`ctyun_vpc_route_table`](details/ctyun_vpc_route_table.md) | 管理虚拟私有云路由表 | 2 / 4 / 2 | 6 / 2 | 2/6 · 未完整展示 | [.tf](templates/ctyun_vpc_route_table.tf) |
| [`ctyun_vpc_route_table_rule`](details/ctyun_vpc_route_table_rule.md) | 管理虚拟私有云路由表规则 | 5 / 2 / 2 | 7 / 2 | 6/7 · 未完整展示 | [.tf](templates/ctyun_vpc_route_table_rule.tf) |

<a id="service-ff1c284b79"></a>
### 镜像服务（CT-IMS，Image Management Service）

| Resource / 详情 | 用途 | 顶层 必 / 选 / 只读 | 全层级 输入 / 只读 | 原 docs 示例覆盖 | 模板 |
| --- | --- | --- | --- | --- | --- |
| [`ctyun_image`](details/ctyun_image.md) | 管理私有镜像（从镜像文件创建） | 3 / 8 / 2 | 11 / 2 | 10/11 · 未完整展示 | [.tf](templates/ctyun_image.tf) |
| [`ctyun_image_association_user`](details/ctyun_image_association_user.md) | 管理私有镜像共享 | 2 / 2 / 0 | 4 / 0 | 3/4 · 未完整展示 | [.tf](templates/ctyun_image_association_user.tf) |
| [`ctyun_image_from_ecs`](details/ctyun_image_from_ecs.md) | 管理私有镜像（从云主机创建） | 3 / 9 / 1 | 14 / 1 | 12/14 · 未完整展示 | [.tf](templates/ctyun_image_from_ecs.tf) |

## 更新目录

生成器位于 [`scripts/resource_catalog`](../../scripts/resource_catalog/README.md)。它会重新核对注册、递归属性、示例以及全部模板的输入路径/类型/可选标记，并格式化 TF。不支持的动态 Schema 结构会显式报错，不会静默漏掉属性。
