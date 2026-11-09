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
  description = "Complete configurable shape for ctyun_ebm; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auto_renew              = optional(bool)
    az_name                 = optional(string)
    bandwidth               = optional(number)
    cycle_count             = optional(number)
    cycle_type              = string
    data_volume_raid_uuid   = optional(string)
    device_type             = string
    fixed_ip                = optional(string)
    hostname                = string
    image_uuid              = string
    instance_name           = string
    key_pair_name           = optional(string)
    metadata                = optional(map(string))
    password                = optional(string)
    project_id              = optional(string)
    region_id               = optional(string)
    security_group_ids      = optional(set(string))
    status                  = optional(string)
    subnet_id               = string
    system_disk_size        = optional(number)
    system_disk_type        = optional(string)
    system_volume_raid_uuid = optional(string)
    user_data               = optional(string)
    vpc_id                  = string
  })
}

resource "ctyun_ebm" "example" {
  auto_renew              = var.config.auto_renew
  az_name                 = var.config.az_name
  bandwidth               = var.config.bandwidth
  cycle_count             = var.config.cycle_count
  cycle_type              = var.config.cycle_type
  data_volume_raid_uuid   = var.config.data_volume_raid_uuid
  device_type             = var.config.device_type
  fixed_ip                = var.config.fixed_ip
  hostname                = var.config.hostname
  image_uuid              = var.config.image_uuid
  instance_name           = var.config.instance_name
  key_pair_name           = var.config.key_pair_name
  metadata                = var.config.metadata
  password                = var.config.password
  project_id              = var.config.project_id
  region_id               = var.config.region_id
  security_group_ids      = var.config.security_group_ids
  status                  = var.config.status
  subnet_id               = var.config.subnet_id
  system_disk_size        = var.config.system_disk_size
  system_disk_type        = var.config.system_disk_type
  system_volume_raid_uuid = var.config.system_volume_raid_uuid
  user_data               = var.config.user_data
  vpc_id                  = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebm.example.actual_image_id : string
# ctyun_ebm.example.create_time : string
# ctyun_ebm.example.eip_address : string
# ctyun_ebm.example.expire_time : string
# ctyun_ebm.example.id : string
# ctyun_ebm.example.instance_id : string
# ctyun_ebm.example.interface_id : string
# ctyun_ebm.example.master_order_id : string
# ctyun_ebm.example.name : string
# ctyun_ebm.example.port_id : string
# ctyun_ebm.example.system_disk_id : string
# ctyun_ebm.example.update_time : string
