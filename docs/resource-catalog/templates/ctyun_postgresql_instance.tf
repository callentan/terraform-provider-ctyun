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
  description = "Complete configurable shape for ctyun_postgresql_instance; consult constraints before use."
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
    case_sensitive       = optional(bool)
    cycle_count          = optional(number)
    cycle_type           = string
    flavor_name          = optional(string)
    is_mgr               = optional(bool)
    name                 = string
    password             = optional(string)
    prod_id              = number
    project_id           = optional(string)
    region_id            = optional(string)
    running_control      = optional(string)
    security_group_id    = string
    storage_space        = number
    storage_type         = string
    subnet_id            = string
    vip                  = optional(string)
    vpc_id               = string
  })
}

resource "ctyun_postgresql_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_info = var.config.availability_zone_info
  backup_storage_space   = var.config.backup_storage_space
  backup_storage_type    = var.config.backup_storage_type
  case_sensitive         = var.config.case_sensitive
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  is_mgr                 = var.config.is_mgr
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
  vip                    = var.config.vip
  vpc_id                 = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_instance.example.alive : number
# ctyun_postgresql_instance.example.create_time : string
# ctyun_postgresql_instance.example.disk_rated : number
# ctyun_postgresql_instance.example.expire_time : string
# ctyun_postgresql_instance.example.id : string
# ctyun_postgresql_instance.example.master_order_id : string
# ctyun_postgresql_instance.example.outer_prod_inst_id : string
# ctyun_postgresql_instance.example.prod_db_engine : string
# ctyun_postgresql_instance.example.prod_order_status : number
# ctyun_postgresql_instance.example.prod_running_status : number
# ctyun_postgresql_instance.example.prod_type : number
# ctyun_postgresql_instance.example.read_port : number
# ctyun_postgresql_instance.example.tool_type : number
# ctyun_postgresql_instance.example.write_port : string
