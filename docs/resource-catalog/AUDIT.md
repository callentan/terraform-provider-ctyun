# 现有资源文档与示例审计

[返回资源汇总](README.md)

对照依据为当前源码中已注册 resource 的 Schema，包括嵌套属性；不把 data source、SDK 字段或注释掉的定义算作支持。Schema 表核对路径、类型与 Required/Optional/Read-Only 类别；不会把描述文本相同当作属性契约一致的依据。

| 指标 | 数量 |
| --- | --- |
| 已注册 resource | 170 |
| 原文档 Schema 三项核对一致 | 170 |
| 字段展示完整 | 14 |
| 未完整展示 | 151 |
| 缺少目标资源块 | 3 |
| 存在不支持的参数/块 | 2 |
| 示例无法解析 | 0 |

## 需要注意的示例

| 资源详情 | 问题 | 不支持参数/块 |
| --- | --- | --- |
| [ctyun_ec_vpc_instance](details/ctyun_ec_vpc_instance.md) | 缺少目标资源块 | — |
| [ctyun_function_alias](details/ctyun_function_alias.md) | 存在不支持的参数/块 | <code>gray_type</code> |
| [ctyun_function_domain](details/ctyun_function_domain.md) | 存在不支持的参数/块 | <code>auth_config</code>、<code>cert_config</code>、<code>route_config</code> |
| [ctyun_function_trigger](details/ctyun_function_trigger.md) | 缺少目标资源块 | — |
| [ctyun_postgresql_param_template](details/ctyun_postgresql_param_template.md) | 缺少目标资源块 | — |

以上仅记录原有示例的问题，不改写原文档/示例；新模板依据源码生成。参数已在 SDK 或结构体中出现、但未在 resource Schema 暴露，仍不能写入 Terraform 配置。

## 统计口径

只统计 `docs/resources` 中 Example 区域实际生效的 `terraform` / `hcl` 代码块；同类型多个 resource 示例合并计算展示覆盖，配套创建的其他类型资源不计入当前资源。被注释的备选场景不计入。`examples/resources/<type>/resource.tf` 另行核对，结果保存在详情页与 JSON 中。

缺少可选字段通常不是示例错误，只说明它不是全属性模板；Required/Optional+Computed 字段仍属于输入。嵌套字段若通过变量/表达式传入，会标为“未静态展开”，不能据此认定实际模块缺字段。“展示完整”只说明字段名覆盖，不证明必填值、依赖关系、敏感处理或云端部署正确。

## 全量审计表

| 资源详情 | 文档 Schema | docs 输入覆盖 | docs 结果 | examples 输入覆盖 |
| --- | --- | --- | --- | --- |
| [ctyun_acl](details/ctyun_acl.md) | 一致 | 5/7 | 未完整展示 | 5/7 |
| [ctyun_acl_rule](details/ctyun_acl_rule.md) | 一致 | 12/14 | 未完整展示 | 12/14 |
| [ctyun_bandwidth](details/ctyun_bandwidth.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_bandwidth_association_eip](details/ctyun_bandwidth_association_eip.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_ccse_cluster](details/ctyun_ccse_cluster.md) | 一致 | 53/63 | 未完整展示 | 53/63 |
| [ctyun_ccse_namespace](details/ctyun_ccse_namespace.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ccse_node_association](details/ctyun_ccse_node_association.md) | 一致 | 7/9 | 未完整展示 | 7/9 |
| [ctyun_ccse_node_pool](details/ctyun_ccse_node_pool.md) | 一致 | 21/27 | 未完整展示 | 21/27 |
| [ctyun_ccse_plugin](details/ctyun_ccse_plugin.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_cloud_assistant_command](details/ctyun_cloud_assistant_command.md) | 一致 | 5/9 | 未完整展示 | 5/9 |
| [ctyun_cloud_assistant_invocation](details/ctyun_cloud_assistant_invocation.md) | 一致 | 3/6 | 未完整展示 | 3/6 |
| [ctyun_cloud_assistant_run_command](details/ctyun_cloud_assistant_run_command.md) | 一致 | 7/11 | 未完整展示 | 7/11 |
| [ctyun_crs_vpc_attach](details/ctyun_crs_vpc_attach.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_dhcpoptionset](details/ctyun_dhcpoptionset.md) | 一致 | 4/5 | 未完整展示 | 4/5 |
| [ctyun_dhcpoptionset_association_vpc](details/ctyun_dhcpoptionset_association_vpc.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ebm](details/ctyun_ebm.md) | 一致 | 16/24 | 未完整展示 | 16/24 |
| [ctyun_ebm_association_ebs](details/ctyun_ebm_association_ebs.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_ebm_interface](details/ctyun_ebm_interface.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_ebs](details/ctyun_ebs.md) | 一致 | 5/18 | 未完整展示 | 5/18 |
| [ctyun_ebs_association_ecs](details/ctyun_ebs_association_ecs.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ebs_backup](details/ctyun_ebs_backup.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_ebs_backup_policy](details/ctyun_ebs_backup_policy.md) | 一致 | 11/19 | 未完整展示 | 11/19 |
| [ctyun_ebs_backup_policy_bind_disks](details/ctyun_ebs_backup_policy_bind_disks.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ebs_backup_policy_bind_repo](details/ctyun_ebs_backup_policy_bind_repo.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_ebs_backup_repo](details/ctyun_ebs_backup_repo.md) | 一致 | 4/8 | 未完整展示 | 4/8 |
| [ctyun_ebs_snapshot](details/ctyun_ebs_snapshot.md) | 一致 | 3/6 | 未完整展示 | 3/6 |
| [ctyun_ebs_snapshot_policy](details/ctyun_ebs_snapshot_policy.md) | 一致 | 5/7 | 未完整展示 | 5/7 |
| [ctyun_ebs_snapshot_policy_association](details/ctyun_ebs_snapshot_policy_association.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ec_cloud_gateway](details/ctyun_ec_cloud_gateway.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_ec_packet](details/ctyun_ec_packet.md) | 一致 | 7/9 | 未完整展示 | 7/9 |
| [ctyun_ec_region_peer](details/ctyun_ec_region_peer.md) | 一致 | 7/7 | 字段展示完整 | 7/7 |
| [ctyun_ec_route](details/ctyun_ec_route.md) | 一致 | 9/9 | 字段展示完整 | 9/9 |
| [ctyun_ec_sdwan_instance](details/ctyun_ec_sdwan_instance.md) | 一致 | 7/7 | 字段展示完整 | 7/7 |
| [ctyun_ec_vpc_instance](details/ctyun_ec_vpc_instance.md) | 一致 | 0/9 | 缺少目标资源块 | 无源示例 |
| [ctyun_ecs](details/ctyun_ecs.md) | 一致 | 10/32 | 未完整展示 | 10/32 |
| [ctyun_ecs_affinity_group](details/ctyun_ecs_affinity_group.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ecs_affinity_group_association](details/ctyun_ecs_affinity_group_association.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ecs_backup](details/ctyun_ecs_backup.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_ecs_backup_policy](details/ctyun_ecs_backup_policy.md) | 一致 | 11/18 | 未完整展示 | 11/18 |
| [ctyun_ecs_backup_policy_bind_instances](details/ctyun_ecs_backup_policy_bind_instances.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ecs_backup_policy_bind_repo](details/ctyun_ecs_backup_policy_bind_repo.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ecs_backup_repo](details/ctyun_ecs_backup_repo.md) | 一致 | 3/8 | 未完整展示 | 3/8 |
| [ctyun_ecs_data_volume](details/ctyun_ecs_data_volume.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ecs_port_association](details/ctyun_ecs_port_association.md) | 一致 | 2/5 | 未完整展示 | 2/5 |
| [ctyun_ecs_snapshot](details/ctyun_ecs_snapshot.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_eip](details/ctyun_eip.md) | 一致 | 4/7 | 未完整展示 | 4/7 |
| [ctyun_eip_association](details/ctyun_eip_association.md) | 一致 | 4/5 | 未完整展示 | 4/5 |
| [ctyun_elb_acl](details/ctyun_elb_acl.md) | 一致 | 2/5 | 未完整展示 | 2/5 |
| [ctyun_elb_certificate](details/ctyun_elb_certificate.md) | 一致 | 4/7 | 未完整展示 | 4/7 |
| [ctyun_elb_health_check](details/ctyun_elb_health_check.md) | 一致 | 9/12 | 未完整展示 | 9/12 |
| [ctyun_elb_listener](details/ctyun_elb_listener.md) | 一致 | 9/25 | 未完整展示 | 9/25 |
| [ctyun_elb_loadbalancer](details/ctyun_elb_loadbalancer.md) | 一致 | 7/16 | 未完整展示 | 7/16 |
| [ctyun_elb_rule](details/ctyun_elb_rule.md) | 一致 | 7/14 | 未完整展示 | 7/14 |
| [ctyun_elb_target](details/ctyun_elb_target.md) | 一致 | 4/9 | 未完整展示 | 4/9 |
| [ctyun_elb_target_group](details/ctyun_elb_target_group.md) | 一致 | 8/13 | 未完整展示 | 8/13 |
| [ctyun_enterprise_project](details/ctyun_enterprise_project.md) | 一致 | 2/2 | 字段展示完整 | 2/2 |
| [ctyun_enterprise_project_association_user_group](details/ctyun_enterprise_project_association_user_group.md) | 一致 | 3/3 | 字段展示完整 | 3/3 |
| [ctyun_express_connect](details/ctyun_express_connect.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_flow_package](details/ctyun_flow_package.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_function](details/ctyun_function.md) | 一致 | 17/24 | 未完整展示 | 17/24 |
| [ctyun_function_alias](details/ctyun_function_alias.md) | 一致 | 6/7 | 存在不支持的参数/块 | 6/7 |
| [ctyun_function_domain](details/ctyun_function_domain.md) | 一致 | 4/15 | 存在不支持的参数/块 | 4/15 |
| [ctyun_function_trigger](details/ctyun_function_trigger.md) | 一致 | 0/7 | 缺少目标资源块 | 无源示例 |
| [ctyun_function_version](details/ctyun_function_version.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_hpfs](details/ctyun_hpfs.md) | 一致 | 4/12 | 未完整展示 | 4/12 |
| [ctyun_iam_policy](details/ctyun_iam_policy.md) | 一致 | 9/9 | 字段展示完整 | 9/9 |
| [ctyun_iam_policy_association_user](details/ctyun_iam_policy_association_user.md) | 一致 | 3/3 | 字段展示完整 | 3/3 |
| [ctyun_iam_policy_association_user_group](details/ctyun_iam_policy_association_user_group.md) | 一致 | 3/3 | 字段展示完整 | 3/3 |
| [ctyun_iam_user](details/ctyun_iam_user.md) | 一致 | 6/6 | 字段展示完整 | 6/6 |
| [ctyun_iam_user_ak](details/ctyun_iam_user_ak.md) | 一致 | 2/2 | 字段展示完整 | 2/2 |
| [ctyun_iam_user_group](details/ctyun_iam_user_group.md) | 一致 | 2/2 | 字段展示完整 | 2/2 |
| [ctyun_idp](details/ctyun_idp.md) | 一致 | 6/6 | 字段展示完整 | 6/6 |
| [ctyun_image](details/ctyun_image.md) | 一致 | 10/11 | 未完整展示 | 10/11 |
| [ctyun_image_association_user](details/ctyun_image_association_user.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_image_from_ecs](details/ctyun_image_from_ecs.md) | 一致 | 12/14 | 未完整展示 | 12/14 |
| [ctyun_ipv6_bandwidth](details/ctyun_ipv6_bandwidth.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_ipv6_bandwidth_association](details/ctyun_ipv6_bandwidth_association.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_ipv6_gateway](details/ctyun_ipv6_gateway.md) | 一致 | 1/3 | 未完整展示 | 1/3 |
| [ctyun_kafka_acl](details/ctyun_kafka_acl.md) | 一致 | 7/9 | 未完整展示 | 7/9 |
| [ctyun_kafka_consumer_group](details/ctyun_kafka_consumer_group.md) | 一致 | 3/11 | 未完整展示 | 3/11 |
| [ctyun_kafka_instance](details/ctyun_kafka_instance.md) | 一致 | 12/23 | 未完整展示 | 12/23 |
| [ctyun_kafka_topic](details/ctyun_kafka_topic.md) | 一致 | 3/18 | 未完整展示 | 3/18 |
| [ctyun_kafka_user](details/ctyun_kafka_user.md) | 一致 | 7/10 | 未完整展示 | 7/10 |
| [ctyun_keypair](details/ctyun_keypair.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_mongodb_account](details/ctyun_mongodb_account.md) | 一致 | 7/9 | 未完整展示 | 7/9 |
| [ctyun_mongodb_association_eip](details/ctyun_mongodb_association_eip.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_mongodb_backup](details/ctyun_mongodb_backup.md) | 一致 | 3/5 | 未完整展示 | 3/5 |
| [ctyun_mongodb_instance](details/ctyun_mongodb_instance.md) | 一致 | 11/24 | 未完整展示 | 11/24 |
| [ctyun_mongodb_restart_db](details/ctyun_mongodb_restart_db.md) | 一致 | 1/3 | 未完整展示 | 1/3 |
| [ctyun_mongodb_white_list](details/ctyun_mongodb_white_list.md) | 一致 | 5/7 | 未完整展示 | 5/7 |
| [ctyun_mysql_account](details/ctyun_mysql_account.md) | 一致 | 4/9 | 未完整展示 | 4/9 |
| [ctyun_mysql_association_eip](details/ctyun_mysql_association_eip.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_mysql_audit](details/ctyun_mysql_audit.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_mysql_backup](details/ctyun_mysql_backup.md) | 一致 | 4/5 | 未完整展示 | 4/5 |
| [ctyun_mysql_backup_cancel](details/ctyun_mysql_backup_cancel.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_mysql_backup_recovery](details/ctyun_mysql_backup_recovery.md) | 一致 | 4/7 | 未完整展示 | 4/7 |
| [ctyun_mysql_backup_setting](details/ctyun_mysql_backup_setting.md) | 一致 | 4/8 | 未完整展示 | 4/8 |
| [ctyun_mysql_database](details/ctyun_mysql_database.md) | 一致 | 3/6 | 未完整展示 | 3/6 |
| [ctyun_mysql_instance](details/ctyun_mysql_instance.md) | 一致 | 10/22 | 未完整展示 | 10/22 |
| [ctyun_mysql_param_template](details/ctyun_mysql_param_template.md) | 一致 | 3/6 | 未完整展示 | 3/6 |
| [ctyun_mysql_rds_parameter_template](details/ctyun_mysql_rds_parameter_template.md) | 一致 | 2/5 | 未完整展示 | 2/5 |
| [ctyun_mysql_readonly_instance](details/ctyun_mysql_readonly_instance.md) | 一致 | 6/11 | 未完整展示 | 6/11 |
| [ctyun_mysql_white_list](details/ctyun_mysql_white_list.md) | 一致 | 3/5 | 未完整展示 | 3/5 |
| [ctyun_nat](details/ctyun_nat.md) | 一致 | 6/14 | 未完整展示 | 6/14 |
| [ctyun_nat_dnat](details/ctyun_nat_dnat.md) | 一致 | 7/11 | 未完整展示 | 7/11 |
| [ctyun_nat_snat](details/ctyun_nat_snat.md) | 一致 | 3/6 | 未完整展示 | 3/6 |
| [ctyun_net_tags](details/ctyun_net_tags.md) | 一致 | 5/6 | 未完整展示 | 5/6 |
| [ctyun_oceanfs](details/ctyun_oceanfs.md) | 一致 | 10/14 | 未完整展示 | 10/14 |
| [ctyun_oceanfs_permission_group](details/ctyun_oceanfs_permission_group.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_oceanfs_permission_group_association](details/ctyun_oceanfs_permission_group_association.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_oceanfs_permission_rule](details/ctyun_oceanfs_permission_rule.md) | 一致 | 4/5 | 未完整展示 | 4/5 |
| [ctyun_port](details/ctyun_port.md) | 一致 | 5/10 | 未完整展示 | 5/10 |
| [ctyun_postgresql_account](details/ctyun_postgresql_account.md) | 一致 | 5/11 | 未完整展示 | 5/11 |
| [ctyun_postgresql_association_eip](details/ctyun_postgresql_association_eip.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_postgresql_backup](details/ctyun_postgresql_backup.md) | 一致 | 3/5 | 未完整展示 | 3/5 |
| [ctyun_postgresql_database](details/ctyun_postgresql_database.md) | 一致 | 8/9 | 未完整展示 | 8/9 |
| [ctyun_postgresql_instance](details/ctyun_postgresql_instance.md) | 一致 | 12/24 | 未完整展示 | 12/24 |
| [ctyun_postgresql_param_template](details/ctyun_postgresql_param_template.md) | 一致 | 0/6 | 缺少目标资源块 | 无源示例 |
| [ctyun_postgresql_readonly_instance](details/ctyun_postgresql_readonly_instance.md) | 一致 | 4/9 | 未完整展示 | 4/9 |
| [ctyun_postgresql_white_list](details/ctyun_postgresql_white_list.md) | 一致 | 3/5 | 未完整展示 | 3/5 |
| [ctyun_prefix_list](details/ctyun_prefix_list.md) | 一致 | 7/8 | 未完整展示 | 7/8 |
| [ctyun_private_nat](details/ctyun_private_nat.md) | 一致 | 6/12 | 未完整展示 | 6/12 |
| [ctyun_private_nat_dnat](details/ctyun_private_nat_dnat.md) | 一致 | 6/9 | 未完整展示 | 6/9 |
| [ctyun_private_nat_snat](details/ctyun_private_nat_snat.md) | 一致 | 4/5 | 未完整展示 | 4/5 |
| [ctyun_private_nat_transit_ip](details/ctyun_private_nat_transit_ip.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_private_zone](details/ctyun_private_zone.md) | 一致 | 5/10 | 未完整展示 | 5/10 |
| [ctyun_private_zone_record](details/ctyun_private_zone_record.md) | 一致 | 7/8 | 未完整展示 | 7/8 |
| [ctyun_rabbitmq_exchange](details/ctyun_rabbitmq_exchange.md) | 一致 | 4/10 | 未完整展示 | 4/10 |
| [ctyun_rabbitmq_instance](details/ctyun_rabbitmq_instance.md) | 一致 | 10/13 | 未完整展示 | 10/13 |
| [ctyun_rabbitmq_queue](details/ctyun_rabbitmq_queue.md) | 一致 | 12/15 | 未完整展示 | 12/15 |
| [ctyun_rabbitmq_vhost](details/ctyun_rabbitmq_vhost.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_redis_account](details/ctyun_redis_account.md) | 一致 | 5/6 | 未完整展示 | 5/6 |
| [ctyun_redis_association_eip](details/ctyun_redis_association_eip.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_redis_backup](details/ctyun_redis_backup.md) | 一致 | 1/4 | 未完整展示 | 1/4 |
| [ctyun_redis_instance](details/ctyun_redis_instance.md) | 一致 | 15/29 | 未完整展示 | 15/29 |
| [ctyun_redis_instance_whitelist](details/ctyun_redis_instance_whitelist.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_redis_migration_task](details/ctyun_redis_migration_task.md) | 一致 | 12/16 | 未完整展示 | 12/16 |
| [ctyun_redis_param_template](details/ctyun_redis_param_template.md) | 一致 | 7/8 | 未完整展示 | 7/8 |
| [ctyun_rocketmq_group](details/ctyun_rocketmq_group.md) | 一致 | 7/10 | 未完整展示 | 7/10 |
| [ctyun_rocketmq_instance](details/ctyun_rocketmq_instance.md) | 一致 | 12/15 | 未完整展示 | 12/15 |
| [ctyun_rocketmq_topic](details/ctyun_rocketmq_topic.md) | 一致 | 5/8 | 未完整展示 | 5/8 |
| [ctyun_scaling_config](details/ctyun_scaling_config.md) | 一致 | 16/19 | 未完整展示 | 16/19 |
| [ctyun_scaling_ecs_protection](details/ctyun_scaling_ecs_protection.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_scaling_group](details/ctyun_scaling_group.md) | 一致 | 18/25 | 未完整展示 | 18/25 |
| [ctyun_scaling_policy](details/ctyun_scaling_policy.md) | 一致 | 14/28 | 未完整展示 | 14/28 |
| [ctyun_sdwan](details/ctyun_sdwan.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_search_instance](details/ctyun_search_instance.md) | 一致 | 19/19 | 字段展示完整 | 19/19 |
| [ctyun_security_group](details/ctyun_security_group.md) | 一致 | 3/5 | 未完整展示 | 3/5 |
| [ctyun_security_group_rule](details/ctyun_security_group_rule.md) | 一致 | 9/10 | 未完整展示 | 9/10 |
| [ctyun_sfs](details/ctyun_sfs.md) | 一致 | 8/13 | 未完整展示 | 8/13 |
| [ctyun_sfs_permission_group](details/ctyun_sfs_permission_group.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_sfs_permission_group_association](details/ctyun_sfs_permission_group_association.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_sfs_permission_rule](details/ctyun_sfs_permission_rule.md) | 一致 | 4/5 | 未完整展示 | 4/5 |
| [ctyun_subnet](details/ctyun_subnet.md) | 一致 | 6/10 | 未完整展示 | 6/10 |
| [ctyun_subnet_association_acl](details/ctyun_subnet_association_acl.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_vip](details/ctyun_vip.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_vip_association](details/ctyun_vip_association.md) | 一致 | 4/6 | 未完整展示 | 4/6 |
| [ctyun_vpc](details/ctyun_vpc.md) | 一致 | 4/7 | 未完整展示 | 4/7 |
| [ctyun_vpc_peer_connection](details/ctyun_vpc_peer_connection.md) | 一致 | 6/10 | 未完整展示 | 6/10 |
| [ctyun_vpc_peer_connection_attach](details/ctyun_vpc_peer_connection_attach.md) | 一致 | 2/3 | 未完整展示 | 2/3 |
| [ctyun_vpc_route_table](details/ctyun_vpc_route_table.md) | 一致 | 2/6 | 未完整展示 | 2/6 |
| [ctyun_vpc_route_table_rule](details/ctyun_vpc_route_table_rule.md) | 一致 | 6/7 | 未完整展示 | 6/7 |
| [ctyun_vpce](details/ctyun_vpce.md) | 一致 | 6/12 | 未完整展示 | 6/12 |
| [ctyun_vpce_service](details/ctyun_vpce_service.md) | 一致 | 11/19 | 未完整展示 | 11/19 |
| [ctyun_vpce_service_connection](details/ctyun_vpce_service_connection.md) | 一致 | 3/4 | 未完整展示 | 3/4 |
| [ctyun_vpce_service_reverse_rule](details/ctyun_vpce_service_reverse_rule.md) | 一致 | 7/8 | 未完整展示 | 7/8 |
| [ctyun_vpce_service_transit_ip](details/ctyun_vpce_service_transit_ip.md) | 一致 | 2/4 | 未完整展示 | 2/4 |
| [ctyun_zos_bucket](details/ctyun_zos_bucket.md) | 一致 | 3/15 | 未完整展示 | 3/15 |
| [ctyun_zos_bucket_object](details/ctyun_zos_bucket_object.md) | 一致 | 3/11 | 未完整展示 | 3/11 |
| [ctyun_zos_subscribe](details/ctyun_zos_subscribe.md) | 一致 | 1/1 | 字段展示完整 | 1/1 |

## 注册边界

源码存在但未注册的有效 resource 定义：无。

docs 中存在但未注册的 resource 文档：无。
注册列表中的注释行（例如 CCSE 模板实例、SD-WAN ACL）不计入支持清单。

## 核对限制

使用 Go AST 静态提取和 HCL 解析；未执行 provider、云端认证或任何 plan/apply/destroy。本地缺少 Go 工具链，未能进行编译后的 `terraform providers schema -json` 交叉验证。属性范围已经与全部显式注册的静态 Schema 逐项对应，但业务方法或远端 API 的行为不能由此推出。
