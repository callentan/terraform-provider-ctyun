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
  description = "Complete configurable shape for ctyun_mysql_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew = optional(bool)
    availability_zone_info = optional(list(object({
      availability_zone_count = number
      availability_zone_name  = string
      node_type               = string
    })))
    backup_storage_space = optional(number)
    backup_storage_type  = optional(string)
    cycle_count          = optional(number)
    cycle_type           = string
    flavor_name          = optional(string)
    name                 = string
    password             = optional(string)
    prod_id              = string
    project_id           = optional(string)
    region_id            = optional(string)
    running_control      = optional(string)
    security_group_id    = string
    storage_space        = number
    storage_type         = string
    subnet_id            = string
    vpc_id               = string
    write_port           = optional(number)
  })
}

resource "ctyun_mysql_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_info = var.config.availability_zone_info
  backup_storage_space   = var.config.backup_storage_space
  backup_storage_type    = var.config.backup_storage_type
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  name                   = var.config.name
  password               = var.config.password
  prod_id                = var.config.prod_id
  project_id             = var.config.project_id
  region_id              = var.config.region_id
  running_control        = var.config.running_control
  security_group_id      = var.config.security_group_id
  storage_space          = var.config.storage_space
  storage_type           = var.config.storage_type
  subnet_id              = var.config.subnet_id
  vpc_id                 = var.config.vpc_id
  write_port             = var.config.write_port
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_instance.example.audit_log_status : number
# ctyun_mysql_instance.example.create_time : string
# ctyun_mysql_instance.example.eip : string
# ctyun_mysql_instance.example.eip_status : number
# ctyun_mysql_instance.example.expire_time : string
# ctyun_mysql_instance.example.id : string
# ctyun_mysql_instance.example.inst_release_protection_status : number
# ctyun_mysql_instance.example.instance_id : string
# ctyun_mysql_instance.example.master_order_id : string
# ctyun_mysql_instance.example.mysql_port : string
# ctyun_mysql_instance.example.new_mysql_version : string
# ctyun_mysql_instance.example.pause_enable : bool
# ctyun_mysql_instance.example.prod_db_engine : string
# ctyun_mysql_instance.example.prod_order_status : number
# ctyun_mysql_instance.example.prod_running_status : number
# ctyun_mysql_instance.example.read_port : string
# ctyun_mysql_instance.example.security_group_status : number
# ctyun_mysql_instance.example.ssl_status : number
# ctyun_mysql_instance.example.vip : string
