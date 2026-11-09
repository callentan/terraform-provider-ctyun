# Data source 索引

[返回资源汇总](README.md)

data source 用于查询，不是受 Terraform 管理生命周期的 resource；此处仅列索引，不提供创建模板。

| Data source | 分类 | 用途 | 源码 |
| --- | --- | --- | --- |
| [`ctyun_acl_rules`](../../docs/data-sources/acl_rules.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询访问控制规则 | [Schema](../../internal/service/acl/datasource_ctyun_acl_rules.go#L37) |
| [`ctyun_acls`](../../docs/data-sources/acls.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询访问控制列表 | [Schema](../../internal/service/acl/datasource_ctyun_acls.go#L44) |
| [`ctyun_bandwidths`](../../docs/data-sources/bandwidths.md) | 共享带宽（Shared Bandwidth） | 查询共享带宽 | [Schema](../../internal/service/vpc/datasource_ctyun_bandwidths.go#L59) |
| [`ctyun_ccse_clusters`](../../docs/data-sources/ccse_clusters.md) | 云容器引擎（CCSE） | 查询云容器引擎集群 | [Schema](../../internal/service/ccse/datasource_ctyun_ccse_clusters.go#L61) |
| [`ctyun_ccse_images`](../../docs/data-sources/ccse_images.md) | 云容器引擎（CCSE） | 查询云容器引擎可用镜像 | [Schema](../../internal/service/ccse/datasource_ctyun_ccse_images.go#L53) |
| [`ctyun_ccse_namespaces`](../../docs/data-sources/ccse_namespaces.md) | 云容器引擎（CCSE） | 查询云容器引擎命名空间 | [Schema](../../internal/service/ccse/datasource_ctyun_ccse_namespaces.go#L41) |
| [`ctyun_ccse_node_pools`](../../docs/data-sources/ccse_node_pools.md) | 云容器引擎（CCSE） | 查询云容器引擎节点池 | [Schema](../../internal/service/ccse/datasource_ctyun_ccse_node_pools.go#L61) |
| [`ctyun_ccse_plugin_market`](../../docs/data-sources/ccse_plugin_market.md) | 云容器引擎（CCSE） | 查询云容器引擎插件市场 | [Schema](../../internal/service/ccse/datasource_ctyun_ccse_plugin_market.go#L63) |
| [`ctyun_ccse_template_market`](../../docs/data-sources/ccse_template_market.md) | 云容器引擎（CCSE） | 查询云容器引擎模板市场 | [Schema](../../internal/service/ccse/datasource_ctyun_ccse_template_market.go#L63) |
| [`ctyun_cloud_assistant_commands`](../../docs/data-sources/cloud_assistant_commands.md) | 云助手 | 查询云助手命令列表 | [Schema](../../internal/service/cloud-assistant/datasource_ctyun_cloud_assistant_commands.go#L40) |
| [`ctyun_cloud_assistant_invocation_results`](../../docs/data-sources/cloud_assistant_invocation_results.md) | 云助手 | 查询云助手命令执行结果 | [Schema](../../internal/service/cloud-assistant/datasource_ctyun_cloud_assistant_invocation_results.go#L41) |
| [`ctyun_crs_opensource_images`](../../docs/data-sources/crs_opensource_images.md) | 容器镜像服务（CRS） | 查询容器镜像服务中的开源镜像 | [Schema](../../internal/service/crs/datasource_ctyun_crs_opensource_images.go#L52) |
| [`ctyun_dhcpoptionset_association_vpcs`](../../docs/data-sources/dhcpoptionset_association_vpcs.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询DHCP选项集关联的VPC | [Schema](../../internal/service/vpc/datasource_ctyun_dhcpoptionset_association_vpcs.go#L53) |
| [`ctyun_dhcpoptionsets`](../../docs/data-sources/dhcpoptionsets.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询DHCP选项集 | [Schema](../../internal/service/vpc/datasource_ctyun_dhcpoptionsets.go#L61) |
| [`ctyun_ebm_device_images`](../../docs/data-sources/ebm_device_images.md) | 物理机服务（CT-DPS，Dedicated Physical Server） | 查询物理机镜像 | [Schema](../../internal/service/ebm/datasource_ctyun_ebm_device_images.go#L67) |
| [`ctyun_ebm_device_raids`](../../docs/data-sources/ebm_device_raids.md) | 物理机服务（CT-DPS，Dedicated Physical Server） | 查询物理机本地盘RAID | [Schema](../../internal/service/ebm/datasource_ctyun_ebm_device_raids.go#L52) |
| [`ctyun_ebm_device_types`](../../docs/data-sources/ebm_device_types.md) | 物理机服务（CT-DPS，Dedicated Physical Server） | 查询物理机可用的规格列表 | [Schema](../../internal/service/ebm/datasource_ctyun_ebm_device_types.go#L93) |
| [`ctyun_ebms`](../../docs/data-sources/ebms.md) | 物理机服务（CT-DPS，Dedicated Physical Server） | 查询物理机列表 | [Schema](../../internal/service/ebm/datasource_ctyun_ebms.go#L68) |
| [`ctyun_ebs_backup_policies`](../../docs/data-sources/ebs_backup_policies.md) | 云硬盘（CT-EVS，Elastic Volume Service） | 查询云硬盘备份策略 | [Schema](../../internal/service/ebs/datasource_ctyun_ebs_backup_policies.go#L67) |
| [`ctyun_ebs_backup_repos`](../../docs/data-sources/ebs_backup_repos.md) | 云硬盘（CT-EVS，Elastic Volume Service） | 云硬盘备份存储库 | [Schema](../../internal/service/ebs/datasource_ctyun_ebs_backup_repos.go#L66) |
| [`ctyun_ebs_backups`](../../docs/data-sources/ebs_backups.md) | 云硬盘（CT-EVS，Elastic Volume Service） | 查询云硬盘备份列表 | [Schema](../../internal/service/ebs/datasource_ctyun_ebs_backups.go#L68) |
| [`ctyun_ebs_snapshot_policies`](../../docs/data-sources/ebs_snapshot_policies.md) | 云硬盘（CT-EVS，Elastic Volume Service） | 查询云硬盘快照策略 | [Schema](../../internal/service/ebs/datasource_ctyun_ebs_snapshot_policies.go#L53) |
| [`ctyun_ebs_snapshots`](../../docs/data-sources/ebs_snapshots.md) | 云硬盘（CT-EVS，Elastic Volume Service） | 查询云硬盘快照 | [Schema](../../internal/service/ebs/datasource_ctyun_ebs_snapshots.go#L75) |
| [`ctyun_ebs_volumes`](../../docs/data-sources/ebs_volumes.md) | 云硬盘（CT-EVS，Elastic Volume Service） | 查询云硬盘列表 | [Schema](../../internal/service/ebs/datasource_ctyun_ebs_volumes.go#L74) |
| [`ctyun_ec_cloud_gateways`](../../docs/data-sources/ec_cloud_gateways.md) | 云间高速（标准版）（CT-EC, Express Connect Standard） | 查询云企业路由器 | [Schema](../../internal/service/ec/datasource_ctyun_ec_cloud_gateways.go#L26) |
| [`ctyun_ec_region_peers`](../../docs/data-sources/ec_region_peers.md) | 云间高速（标准版）（CT-EC, Express Connect Standard） | 查询云间高速跨域连接 | [Schema](../../internal/service/ec/datasource_ctyun_ec_regions_peers.go#L40) |
| [`ctyun_ec_routes`](../../docs/data-sources/ec_routes.md) | 云间高速（标准版）（CT-EC, Express Connect Standard） | 查询云间高速路由 | [Schema](../../internal/service/ec/datasource_ctyun_ec_routes.go#L41) |
| [`ctyun_ec_sdwan_instances`](../../docs/data-sources/ec_sdwan_instances.md) | 云间高速（标准版）（CT-EC, Express Connect Standard） | 查询云间高速SDWAN网络实例列表 | [Schema](../../internal/service/ec/datasource_ctyun_ec_sdwan_instances.go#L70) |
| [`ctyun_ec_vpc_instances`](../../docs/data-sources/ec_vpc_instances.md) | 云间高速（标准版）（CT-EC, Express Connect Standard） | 查询云间高速VPC网络实例列表 | [Schema](../../internal/service/ec/datasource_ctyun_ec_vpc_instances.go#L41) |
| [`ctyun_ecs_affinity_groups`](../../docs/data-sources/ecs_affinity_groups.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） | 查询云主机组 | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_affinity_groups.go#L47) |
| [`ctyun_ecs_backup_policies`](../../docs/data-sources/ecs_backup_policies.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） | 查询云主机备份策略 | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_backup_policies.go#L66) |
| [`ctyun_ecs_backup_repos`](../../docs/data-sources/ecs_backup_repos.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） |  | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_backup_repo.go#L61) |
| [`ctyun_ecs_backups`](../../docs/data-sources/ecs_backups.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） | 查询云主机备份列表 | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_backups.go#L65) |
| [`ctyun_ecs_flavors`](../../docs/data-sources/ecs_flavors.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） | 查询云主机可用的规格列表 | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_flavors.go#L29) |
| [`ctyun_ecs_instances`](../../docs/data-sources/ecs_instances.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） | 查询云主机列表 | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_instances.go#L120) |
| [`ctyun_ecs_snapshots`](../../docs/data-sources/ecs_snapshots.md) | 弹性云主机（CT-ECS，Elastic Cloud Server） | 查询云主机快照 | [Schema](../../internal/service/ecs/datasource_ctyun_ecs_snapshots.go#L51) |
| [`ctyun_eips`](../../docs/data-sources/eips.md) | 弹性IP（Elastic IP，EIP） | 查询弹性IP | [Schema](../../internal/service/vpc/datasource_ctyun_eips.go#L70) |
| [`ctyun_elb_acls`](../../docs/data-sources/elb_acls.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡ACL | [Schema](../../internal/service/elb/datasource_ctyun_elb_acls.go#L39) |
| [`ctyun_elb_certificates`](../../docs/data-sources/elb_certificates.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡访问证书 | [Schema](../../internal/service/elb/datasource_ctyun_elb_certficates.go#L30) |
| [`ctyun_elb_health_checks`](../../docs/data-sources/elb_health_checks.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡健康检查 | [Schema](../../internal/service/elb/datasource_ctyun_elb_health_checks.go#L45) |
| [`ctyun_elb_listeners`](../../docs/data-sources/elb_listeners.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡监听器 | [Schema](../../internal/service/elb/datasource_ctyun_elb_listeners.go#L40) |
| [`ctyun_elb_loadbalancers`](../../docs/data-sources/elb_loadbalancers.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡列表 | [Schema](../../internal/service/elb/datasource_ctyun_elb_loadbalancers.go#L34) |
| [`ctyun_elb_rules`](../../docs/data-sources/elb_rules.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡转发规则 | [Schema](../../internal/service/elb/datasource_ctyun_elb_rules.go#L42) |
| [`ctyun_elb_target_groups`](../../docs/data-sources/elb_target_groups.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载后端服务组 | [Schema](../../internal/service/elb/datasource_ctyun_elb_target_groups.go#L33) |
| [`ctyun_elb_targets`](../../docs/data-sources/elb_targets.md) | 弹性负载均衡（CT-ELB ，Elastic Load Balancing） | 查询弹性负载均衡后端主机列表 | [Schema](../../internal/service/elb/datasource_ctyun_elb_targets.go#L42) |
| [`ctyun_express_connects`](../../docs/data-sources/express_connects.md) | 云间高速（标准版）（CT-EC, Express Connect Standard） | 查询云间高速实例 | [Schema](../../internal/service/ec/datasource_ctyun_express_connects.go#L26) |
| [`ctyun_flow_packages`](../../docs/data-sources/flow_packages.md) | 弹性IP（Elastic IP，EIP） | 查询流量包列表 | [Schema](../../internal/service/vpc/datasource_ctyun_flow_packages.go#L53) |
| [`ctyun_function_aliases`](../../docs/data-sources/function_aliases.md) | 函数计算（FaaS） | 查询函数别名列表 | [Schema](../../internal/service/faas/datasource_ctyun_function_aliases.go#L30) |
| [`ctyun_function_domains`](../../docs/data-sources/function_domains.md) | 函数计算（FaaS） | 查询自定义域名列表 | [Schema](../../internal/service/faas/dasource_ctyun_function_domains.go#L43) |
| [`ctyun_function_triggers`](../../docs/data-sources/function_triggers.md) | 函数计算（FaaS） | 查询函数触发器列表 | [Schema](../../internal/service/faas/datasource_ctyun_function_triggers.go#L34) |
| [`ctyun_function_versions`](../../docs/data-sources/function_versions.md) | 函数计算（FaaS） | 查询函数版本列表 | [Schema](../../internal/service/faas/datasource_ctyun_function_versions.go#L35) |
| [`ctyun_functions`](../../docs/data-sources/functions.md) | 函数计算（FaaS） | 查询函数列表 | [Schema](../../internal/service/faas/datasource_ctyun_functions.go#L35) |
| [`ctyun_hpfs_clusters`](../../docs/data-sources/hpfs_clusters.md) | 并行文件服务HPFS（CT-HPFS，High Performance File Storage） | 查询并行文件服务支持的集群类型 | [Schema](../../internal/service/hpfs/datasource_ctyun_hpfs_clusters.go#L42) |
| [`ctyun_hpfs_instances`](../../docs/data-sources/hpfs_instances.md) | 并行文件服务HPFS（CT-HPFS，High Performance File Storage） | 查询并行文件服务实例 | [Schema](../../internal/service/hpfs/datasource_cytun_hpfs_instances.go#L43) |
| [`ctyun_iam_authorities`](../../docs/data-sources/iam_authorities.md) | 统一身份认证（Identity and Access Management，简称IAM） | 查询IAM权限点 | [Schema](../../internal/service/iam/datasource_ctyun_iam_authorities.go#L25) |
| [`ctyun_iam_policies`](../../docs/data-sources/iam_policies.md) | 统一身份认证（Identity and Access Management，简称IAM） | 查询IAM策略列表 | [Schema](../../internal/service/iam/datasource_ctyun_iam_policies.go#L32) |
| [`ctyun_iam_user_aks`](../../docs/data-sources/iam_user_aks.md) | 统一身份认证（Identity and Access Management，简称IAM） | 查询用户AK | [Schema](../../internal/service/iam/datasource_ctyun_iam_user_aks.go#L26) |
| [`ctyun_iam_user_groups`](../../docs/data-sources/iam_user_groups.md) | 统一身份认证（Identity and Access Management，简称IAM） | 查询用户组列表 | [Schema](../../internal/service/iam/datasource_ctyun_iam_user_groups.go#L27) |
| [`ctyun_iam_users`](../../docs/data-sources/iam_users.md) | 统一身份认证（Identity and Access Management，简称IAM） | 查询用户列表 | [Schema](../../internal/service/iam/datasource_ctyun_iam_users.go#L28) |
| [`ctyun_images`](../../docs/data-sources/images.md) | 镜像服务（CT-IMS，Image Management Service） | 查询云主机可用的镜像列表 | [Schema](../../internal/service/image/datasource_ctyun_images.go#L30) |
| [`ctyun_ipv6_bandwidths`](../../docs/data-sources/ipv6_bandwidths.md) | 弹性IP（Elastic IP，EIP） | 查询IPv6带宽列表 | [Schema](../../internal/service/vpc/datasource_ctyun_ipv6_bandwidths.go#L60) |
| [`ctyun_kafka_acls`](../../docs/data-sources/kafka_acls.md) | 分布式消息服务Kafka | 查询KAFKA访问控制 | [Schema](../../internal/service/kafka/datasource_ctyun_kafka_acls.go#L51) |
| [`ctyun_kafka_consumer_groups`](../../docs/data-sources/kafka_consumer_groups.md) | 分布式消息服务Kafka | 查询KAFKA消费组 | [Schema](../../internal/service/kafka/datasource_ctyun_kafka_consumer_groups.go#L52) |
| [`ctyun_kafka_instances`](../../docs/data-sources/kafka_instances.md) | 分布式消息服务Kafka | 查询KAFKA实例列表 | [Schema](../../internal/service/kafka/datasource_ctyun_kafka_instances.go#L60) |
| [`ctyun_kafka_specs`](../../docs/data-sources/kafka_specs.md) | 分布式消息服务Kafka | 查询KAFKA可用的规格 | [Schema](../../internal/service/kafka/datasource_ctyun_kafka_specs.go#L79) |
| [`ctyun_kafka_topics`](../../docs/data-sources/kafka_topics.md) | 分布式消息服务Kafka | 查询KAFKA实例的主题 | [Schema](../../internal/service/kafka/datasource_ctyun_kafka_topics.go#L57) |
| [`ctyun_kafka_users`](../../docs/data-sources/kafka_users.md) | 分布式消息服务Kafka | 查询KAFKA实例的用户列表 | [Schema](../../internal/service/kafka/datasource_ctyun_kafka_users.go#L50) |
| [`ctyun_mongodb_backups`](../../docs/data-sources/mongodb_backups.md) | 文档数据库服务（MongoDB） | 查询MongoDB实例的备份 | [Schema](../../internal/service/mongodb/datasource_ctyun_mongodb_backups.go#L61) |
| [`ctyun_mongodb_instances`](../../docs/data-sources/mongodb_instances.md) | 文档数据库服务（MongoDB） | 查询MongoDB实例 | [Schema](../../internal/service/mongodb/datasource_ctyun_mongodb_instances.go#L40) |
| [`ctyun_mongodb_specs`](../../docs/data-sources/mongodb_specs.md) | 文档数据库服务（MongoDB） | 查询MongoDB可用的规格 | [Schema](../../internal/service/mongodb/datasource_ctyun_mongodb_specs.go#L28) |
| [`ctyun_mongodb_white_lists`](../../docs/data-sources/mongodb_white_lists.md) | 文档数据库服务（MongoDB） | 查询MongoDB实例的白名单 | [Schema](../../internal/service/mongodb/data_source_ctyun_mongodb_white_lists.go#L35) |
| [`ctyun_mysql_accounts`](../../docs/data-sources/mysql_accounts.md) | 关系数据库MySQL版 | 查询MySQL实例的账户 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_accounts.go#L42) |
| [`ctyun_mysql_backups`](../../docs/data-sources/mysql_backups.md) | 关系数据库MySQL版 | 查询MySQL实例的备份 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_backups.go#L42) |
| [`ctyun_mysql_character_set`](../../docs/data-sources/mysql_character_set.md) | 关系数据库MySQL版 | 查询MySQL实例的字符集 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_character_set.go#L41) |
| [`ctyun_mysql_databases`](../../docs/data-sources/mysql_databases.md) | 关系数据库MySQL版 | 查询MySQL实例的数据库 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_databases.go#L42) |
| [`ctyun_mysql_instances`](../../docs/data-sources/mysql_instances.md) | 关系数据库MySQL版 | 查询MySQL实例 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_instances.go#L41) |
| [`ctyun_mysql_param_templates`](../../docs/data-sources/mysql_param_templates.md) | 关系数据库MySQL版 | 查询MySQL参数模板 | [Schema](../../internal/service/mysql/datasource_mysql_param_templates.go#L42) |
| [`ctyun_mysql_parameters`](../../docs/data-sources/mysql_parameters.md) | 关系数据库MySQL版 | 查询MySQL实例的参数列表 | [Schema](../../internal/service/mysql/datasource_mysql_parameters.go#L43) |
| [`ctyun_mysql_recoverable_time_points`](../../docs/data-sources/mysql_recoverable_time_points.md) | 关系数据库MySQL版 | 查询MySQL实例的备份可恢复时间点 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_recoverable_time_points.go#L39) |
| [`ctyun_mysql_specs`](../../docs/data-sources/mysql_specs.md) | 关系数据库MySQL版 | 查询MySQL可用的规格 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_specs.go#L43) |
| [`ctyun_mysql_white_lists`](../../docs/data-sources/mysql_white_lists.md) | 关系数据库MySQL版 | 查询MySQL实例的白名单 | [Schema](../../internal/service/mysql/datasource_ctyun_mysql_white_lists.go#L24) |
| [`ctyun_nat_dnats`](../../docs/data-sources/nat_dnats.md) | NAT网关（CT-NAT Gateway） | 查询公网NAT网关dnat规则 | [Schema](../../internal/service/nat/datasource_ctyun_dnat.go#L36) |
| [`ctyun_nat_snats`](../../docs/data-sources/nat_snats.md) | NAT网关（CT-NAT Gateway） | 查询公网NAT网关snat规则 | [Schema](../../internal/service/nat/datasource_ctyun_snat.go#L41) |
| [`ctyun_nats`](../../docs/data-sources/nats.md) | NAT网关（CT-NAT Gateway） | 查询公网NAT网关 | [Schema](../../internal/service/nat/datasource_ctyun_nats.go#L38) |
| [`ctyun_net_resources_by_tag`](../../docs/data-sources/net_resources_by_tag.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 根据标签查询网络资源 | [Schema](../../internal/service/vpc/datasource_ctyun_net_resources_by_tag.go#L53) |
| [`ctyun_net_tagss`](../../docs/data-sources/net_tagss.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询网络资源的标签 | [Schema](../../internal/service/vpc/datasource_ctyun_net_tagss.go#L32) |
| [`ctyun_oceanfs_instances`](../../docs/data-sources/oceanfs_instances.md) | 海量文件服务OceanFS | 查询海量文件服务实例 | [Schema](../../internal/service/oceanfs/datasource_ctyun_oceanfs_instances.go#L35) |
| [`ctyun_ports`](../../docs/data-sources/ports.md) | 弹性网卡（Elastic Network Interface） | 查询弹性网卡 | [Schema](../../internal/service/vpc/datasource_ctyun_port.go#L26) |
| [`ctyun_postgresql_accounts`](../../docs/data-sources/postgresql_accounts.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL实例的账户 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_accounts.go#L42) |
| [`ctyun_postgresql_backups`](../../docs/data-sources/postgresql_backups.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL实例的备份 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_backups.go#L43) |
| [`ctyun_postgresql_character_set`](../../docs/data-sources/postgresql_character_set.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL支持的字符集 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_character_set.go#L41) |
| [`ctyun_postgresql_collation_time_zone`](../../docs/data-sources/postgresql_collation_time_zone.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL的排序规则和时区 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_collation_time_zone.go#L41) |
| [`ctyun_postgresql_databases`](../../docs/data-sources/postgresql_databases.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL实例的数据库 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_databases.go#L41) |
| [`ctyun_postgresql_instances`](../../docs/data-sources/postgresql_instances.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL实例 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_instances.go#L44) |
| [`ctyun_postgresql_param_templates`](../../docs/data-sources/postgresql_param_templates.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL参数模板 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_parameter_templates.go#L41) |
| [`ctyun_postgresql_specs`](../../docs/data-sources/postgresql_specs.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL支持的规格 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_specs.go#L43) |
| [`ctyun_postgresql_white_lists`](../../docs/data-sources/postgresql_white_lists.md) | 关系数据库PostgreSQL版 | 查询PostgreSQL实例的白名单 | [Schema](../../internal/service/pgsql/datasource_ctyun_postgresql_white_lists.go#L41) |
| [`ctyun_prefix_lists`](../../docs/data-sources/prefix_lists.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询前缀列表 | [Schema](../../internal/service/acl/datasource_ctyun_prefixlists.go#L43) |
| [`ctyun_private_nat_cidrs`](../../docs/data-sources/private_nat_cidrs.md) | NAT网关（CT-NAT Gateway） | 查询私网NAT网关的中转网段列表 | [Schema](../../internal/service/nat/datasource_ctyun_private_nat_cidrs.go#L31) |
| [`ctyun_private_nat_dnats`](../../docs/data-sources/private_nat_dnats.md) | NAT网关（CT-NAT Gateway） | 查询私网NAT网关的dnat规则 | [Schema](../../internal/service/nat/datasource_ctyun_private_nat_dnats.go#L34) |
| [`ctyun_private_nat_snats`](../../docs/data-sources/private_nat_snats.md) | NAT网关（CT-NAT Gateway） | 查询私网NAT网关的snat规则 | [Schema](../../internal/service/nat/datasource_ctyun_private_nat_snat.go#L41) |
| [`ctyun_private_nat_transit_ips`](../../docs/data-sources/private_nat_transit_ips.md) | NAT网关（CT-NAT Gateway） | 查询私网NAT网关的中转IP | [Schema](../../internal/service/nat/datasource_ctyun_private_nat_transit_ips.go#L31) |
| [`ctyun_private_nats`](../../docs/data-sources/private_nats.md) | NAT网关（CT-NAT Gateway） | 查询私网NAT网关 | [Schema](../../internal/service/nat/datasource_ctyun_private_nats.go#L33) |
| [`ctyun_private_zone_records`](../../docs/data-sources/private_zone_records.md) | 内网DNS（Intranet Domain Name Service，CT-IDNS） | 查询内网DNS记录 | [Schema](../../internal/service/dns/datasource_ctyun_private_zone_records.go#L42) |
| [`ctyun_private_zones`](../../docs/data-sources/private_zones.md) | 内网DNS（Intranet Domain Name Service，CT-IDNS） | 查询内网DNS列表 | [Schema](../../internal/service/dns/datasource_ctyun_private_zones.go#L42) |
| [`ctyun_rabbitmq_exchanges`](../../docs/data-sources/rabbitmq_exchanges.md) | 分布式消息服务RabbitMQ | 查询RabbitMQ实例的交换器 | [Schema](../../internal/service/rabbitmq/datasource_ctyun_rabbitmq_exchanges.go#L52) |
| [`ctyun_rabbitmq_instances`](../../docs/data-sources/rabbitmq_instances.md) | 分布式消息服务RabbitMQ | 查询RabbitMQ实例 | [Schema](../../internal/service/rabbitmq/datasource_ctyun_rabbitmq_instances.go#L52) |
| [`ctyun_rabbitmq_queues`](../../docs/data-sources/rabbitmq_queues.md) | 分布式消息服务RabbitMQ | 查询RabbitMQ实例的队列 | [Schema](../../internal/service/rabbitmq/datasource_ctyun_rabbitmq_queues.go#L49) |
| [`ctyun_rabbitmq_specs`](../../docs/data-sources/rabbitmq_specs.md) | 分布式消息服务RabbitMQ | 查询RabbitMQ可用的规格 | [Schema](../../internal/service/rabbitmq/datasource_ctyun_rabbitmq_specs.go#L76) |
| [`ctyun_rabbitmq_vhosts`](../../docs/data-sources/rabbitmq_vhosts.md) | 分布式消息服务RabbitMQ | 查询RabbitMQ实例的虚拟主机 | [Schema](../../internal/service/rabbitmq/datasource_ctyun_rabbitmq_vhosts.go#L49) |
| [`ctyun_redis_accounts`](../../docs/data-sources/redis_accounts.md) | 分布式缓存服务Redis版 | 查询Redis实例的账户列表 | [Schema](../../internal/service/redis/datasource_ctyun_redis_accounts.go#L43) |
| [`ctyun_redis_backups`](../../docs/data-sources/redis_backups.md) | 分布式缓存服务Redis版 | 查询Redis实例的备份 | [Schema](../../internal/service/redis/datasource_ctyun_redis_backups.go#L47) |
| [`ctyun_redis_instance_whitelists`](../../docs/data-sources/redis_instance_whitelists.md) | 分布式缓存服务Redis版 | 查询Redis实例的白名单 | [Schema](../../internal/service/redis/datasource_ctyun_redis_instance_whitelists.go#L44) |
| [`ctyun_redis_instances`](../../docs/data-sources/redis_instances.md) | 分布式缓存服务Redis版 | 查询Redis实例 | [Schema](../../internal/service/redis/datasource_ctyun_redis_instances.go#L57) |
| [`ctyun_redis_migration_tasks`](../../docs/data-sources/redis_migration_tasks.md) | 分布式缓存服务Redis版 | 查询Redis迁移任务 | [Schema](../../internal/service/redis/datasource_ctyun_redis_migration_tasks.go#L64) |
| [`ctyun_redis_param_templates`](../../docs/data-sources/redis_param_templates.md) | 分布式缓存服务Redis版 | 查询Redis参数模板 | [Schema](../../internal/service/redis/datasource_ctyun_redis_param_templates.go#L51) |
| [`ctyun_redis_specs`](../../docs/data-sources/redis_specs.md) | 分布式缓存服务Redis版 | 查询Redis实例可用规格 | [Schema](../../internal/service/redis/datasource_ctyun_redis_specs.go#L60) |
| [`ctyun_regions`](../../docs/data-sources/regions.md) | 通用功能（COMMON） | 查询资源池列表 | [Schema](../../internal/service/common/datasource_ctyun_regions.go#L25) |
| [`ctyun_rocketmq_groups`](../../docs/data-sources/rocketmq_groups.md) | 分布式消息服务RocketMQ | 查询 RocketMQ 订阅组列表 | [Schema](../../internal/service/rocketmq/datasource_ctyun_rocketmq_groups.go#L56) |
| [`ctyun_rocketmq_instances`](../../docs/data-sources/rocketmq_instances.md) | 分布式消息服务RocketMQ | 查询 RocketMQ 实例列表 | [Schema](../../internal/service/rocketmq/datasource_ctyun_rocketmq_instances.go#L62) |
| [`ctyun_rocketmq_specs`](../../docs/data-sources/rocketmq_specs.md) | 分布式消息服务RocketMQ | 查询 RocketMQ 可用的规格 | [Schema](../../internal/service/rocketmq/datasource_ctyun_rocketmq_specs.go#L54) |
| [`ctyun_rocketmq_topics`](../../docs/data-sources/rocketmq_topics.md) | 分布式消息服务RocketMQ | 查询 RocketMQ 主题列表 | [Schema](../../internal/service/rocketmq/datasource_ctyun_rocketmq_topics.go#L53) |
| [`ctyun_scaling_activities`](../../docs/data-sources/scaling_activities.md) | 弹性伸缩服务（CT-AS，Auto Scaling） | 查询弹性伸缩组的活动 | [Schema](../../internal/service/scaling/datasource_ctyun_scaling_activities.go#L43) |
| [`ctyun_scaling_configs`](../../docs/data-sources/scaling_configs.md) | 弹性伸缩服务（CT-AS，Auto Scaling） | 查询弹性伸缩配置 | [Schema](../../internal/service/scaling/datasource_ctyun_scaling_configs.go#L44) |
| [`ctyun_scaling_ecs_list`](../../docs/data-sources/scaling_ecs_list.md) | 弹性伸缩服务（CT-AS，Auto Scaling） | 查询弹性伸缩组的云主机列表 | [Schema](../../internal/service/scaling/datasource_ctyun_scaling_ecs_list.go#L43) |
| [`ctyun_scaling_policies`](../../docs/data-sources/scaling_policies.md) | 弹性伸缩服务（CT-AS，Auto Scaling） | 查询弹性伸缩组的策略 | [Schema](../../internal/service/scaling/datasource_ctyun_scaling_policies.go#L43) |
| [`ctyun_scalings`](../../docs/data-sources/scalings.md) | 弹性伸缩服务（CT-AS，Auto Scaling） | 查询弹性伸缩组 | [Schema](../../internal/service/scaling/datasource_ctyun_scalings.go#L44) |
| [`ctyun_sdwans`](../../docs/data-sources/sdwans.md) | 天翼云SD-WAN | 查询SDWAN | [Schema](../../internal/service/sdwan/datasource_ctyun_sdwans.go#L46) |
| [`ctyun_search_instances`](../../docs/data-sources/search_instances.md) | 天翼云OpenSearch服务 | 查询OpenSearch实例列表 | [Schema](../../internal/service/opensearch/datasource_ctyun_search_instances.go#L48) |
| [`ctyun_security_groups`](../../docs/data-sources/security_groups.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询安全组 | [Schema](../../internal/service/vpc/datasource_ctyun_security_groups.go#L73) |
| [`ctyun_services`](../../docs/data-sources/services.md) | 通用功能（COMMON） | 查询服务和产品 | [Schema](../../internal/service/common/datasource_ctyun_servces.go#L28) |
| [`ctyun_sfs_instances`](../../docs/data-sources/sfs_instances.md) | 弹性文件服务（CT-SFS，Scalable File Service） | 查询弹性文件服务 | [Schema](../../internal/service/sfs/datasource_ctyun_sfs_instances.go#L41) |
| [`ctyun_sfs_permission_rules`](../../docs/data-sources/sfs_permission_rules.md) | 弹性文件服务（CT-SFS，Scalable File Service） | 查询弹性文件服务权限组规则 | [Schema](../../internal/service/sfs/datasource_ctyun_sfs_permission_rules.go#L40) |
| [`ctyun_subnets`](../../docs/data-sources/subnets.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询子网列表 | [Schema](../../internal/service/vpc/datasource_ctyun_subnets.go#L70) |
| [`ctyun_vips`](../../docs/data-sources/vips.md) | 虚拟IP（Virtual IP，VIP） | 查询虚拟IP | [Schema](../../internal/service/vpc/datasource_ctyun_vips.go#L54) |
| [`ctyun_vpc_peer_connections`](../../docs/data-sources/vpc_peer_connections.md) | 对等连接（VPC peering connection） | 查询对等连接 | [Schema](../../internal/service/peer-connection/datasource_ctyun_vpc_peer_connections.go#L37) |
| [`ctyun_vpc_route_table_rules`](../../docs/data-sources/vpc_route_table_rules.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询虚拟私有云路由表规则 | [Schema](../../internal/service/vpc/datasource_ctyun_vpc_route_table_rules.go#L53) |
| [`ctyun_vpc_route_tables`](../../docs/data-sources/vpc_route_tables.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询虚拟私有云路由表 | [Schema](../../internal/service/vpc/datasource_ctyun_vpc_route_tables.go#L58) |
| [`ctyun_vpce_service_reverse_rules`](../../docs/data-sources/vpce_service_reverse_rules.md) | VPC终端节点（VPC Endpoint） | 查询终端节点服务反向规则 | [Schema](../../internal/service/vpce/datasource_ctyun_vpce_service_reverse_rules.go#L56) |
| [`ctyun_vpce_service_transit_ips`](../../docs/data-sources/vpce_service_transit_ips.md) | VPC终端节点（VPC Endpoint） | 查询终端节点服务中转IP | [Schema](../../internal/service/vpce/datasource_ctyun_vpce_service_transit_ips.go#L52) |
| [`ctyun_vpce_services`](../../docs/data-sources/vpce_services.md) | VPC终端节点（VPC Endpoint） | 查询终端节点服务 | [Schema](../../internal/service/vpce/datasource_ctyun_vpce_services.go#L64) |
| [`ctyun_vpces`](../../docs/data-sources/vpces.md) | VPC终端节点（VPC Endpoint） | 查询终端节点 | [Schema](../../internal/service/vpce/datasource_ctyun_vpces.go#L60) |
| [`ctyun_vpcs`](../../docs/data-sources/vpcs.md) | 虚拟私有云（Virtual Private Cloud，VPC） | 查询虚拟私有云列表 | [Schema](../../internal/service/vpc/datasource_ctyun_vpcs.go#L60) |
| [`ctyun_zones`](../../docs/data-sources/zones.md) | 通用功能（COMMON） | 查询资源池可用区 | [Schema](../../internal/service/common/datasource_ctyun_zones.go#L26) |
| [`ctyun_zos_bucket_objects`](../../docs/data-sources/zos_bucket_objects.md) | 对象存储（CT-ZOS，Zettabyte Object Storage） | 查询对象存储桶中的对象 | [Schema](../../internal/service/zos/datasource_ctyun_zos_bucket_objects.go#L57) |
| [`ctyun_zos_buckets`](../../docs/data-sources/zos_buckets.md) | 对象存储（CT-ZOS，Zettabyte Object Storage） | 查询对象存储桶列表 | [Schema](../../internal/service/zos/datasource_ctyun_zos_buckets.go#L56) |
