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
  description = "Complete configurable shape for ctyun_mongodb_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew = optional(bool)
    availability_zone_info = optional(list(object({
      availability_zone_count = number
      availability_zone_name  = string
      node_type               = string
    })))
    backup_storage_type = optional(string)
    cycle_count         = optional(number)
    cycle_type          = string
    flavor_name         = optional(string)
    mongos_num          = optional(number)
    name                = string
    password            = optional(string)
    prod_id             = optional(string)
    project_id          = optional(string)
    read_only_count     = optional(number)
    read_port           = optional(number)
    region_id           = optional(string)
    security_group_id   = string
    shard_num           = optional(number)
    storage_space       = optional(number)
    storage_type        = optional(string)
    subnet_id           = string
    upgrade_node_type   = optional(string)
    vpc_id              = string
  })
}

resource "ctyun_mongodb_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_info = var.config.availability_zone_info
  backup_storage_type    = var.config.backup_storage_type
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  mongos_num             = var.config.mongos_num
  name                   = var.config.name
  password               = var.config.password
  prod_id                = var.config.prod_id
  project_id             = var.config.project_id
  read_only_count        = var.config.read_only_count
  read_port              = var.config.read_port
  region_id              = var.config.region_id
  security_group_id      = var.config.security_group_id
  shard_num              = var.config.shard_num
  storage_space          = var.config.storage_space
  storage_type           = var.config.storage_type
  subnet_id              = var.config.subnet_id
  upgrade_node_type      = var.config.upgrade_node_type
  vpc_id                 = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mongodb_instance.example.backup_storage_space : number
# ctyun_mongodb_instance.example.create_time : string
# ctyun_mongodb_instance.example.eip_id : string
# ctyun_mongodb_instance.example.expire_time : string
# ctyun_mongodb_instance.example.host_ip : string
# ctyun_mongodb_instance.example.id : string
# ctyun_mongodb_instance.example.master_order_id : string
# ctyun_mongodb_instance.example.prod_running_status : number
