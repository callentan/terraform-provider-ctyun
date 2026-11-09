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
  description = "Complete configurable shape for ctyun_redis_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew             = optional(bool)
    auto_renew_cycle_count = optional(number)
    az_name                = optional(string)
    backup_policy = optional(object({
      period        = string
      retention_day = number
      time          = number
    }))
    copies_count      = optional(number)
    cycle_count       = optional(number)
    cycle_type        = string
    data_disk_type    = optional(string)
    edition           = string
    engine_version    = string
    host_type         = optional(string)
    instance_name     = string
    maintenance_time  = optional(string)
    password          = optional(string)
    project_id        = optional(string)
    protection_status = optional(bool)
    region_id         = optional(string)
    secondary_az_name = optional(string)
    security_group_id = string
    shard_count       = optional(number)
    shard_mem_size    = number
    ssl_enabled       = optional(bool)
    subnet_id         = string
    template_id       = optional(string)
    version           = optional(string)
    vpc_id            = string
  })
}

resource "ctyun_redis_instance" "example" {
  auto_renew             = var.config.auto_renew
  auto_renew_cycle_count = var.config.auto_renew_cycle_count
  az_name                = var.config.az_name
  backup_policy          = var.config.backup_policy
  copies_count           = var.config.copies_count
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  data_disk_type         = var.config.data_disk_type
  edition                = var.config.edition
  engine_version         = var.config.engine_version
  host_type              = var.config.host_type
  instance_name          = var.config.instance_name
  maintenance_time       = var.config.maintenance_time
  password               = var.config.password
  project_id             = var.config.project_id
  protection_status      = var.config.protection_status
  region_id              = var.config.region_id
  secondary_az_name      = var.config.secondary_az_name
  security_group_id      = var.config.security_group_id
  shard_count            = var.config.shard_count
  shard_mem_size         = var.config.shard_mem_size
  ssl_enabled            = var.config.ssl_enabled
  subnet_id              = var.config.subnet_id
  template_id            = var.config.template_id
  version                = var.config.version
  vpc_id                 = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_instance.example.actual_cycle_type : string
# ctyun_redis_instance.example.connection_address : string
# ctyun_redis_instance.example.create_time : string
# ctyun_redis_instance.example.expire_time : string
# ctyun_redis_instance.example.id : string
# ctyun_redis_instance.example.master_order_id : string
# ctyun_redis_instance.example.name : string
# ctyun_redis_instance.example.protected_conn : string
# ctyun_redis_instance.example.tls_version : string
# ctyun_redis_instance.example.vip : string
