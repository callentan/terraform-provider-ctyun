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
  description = "Complete configurable shape for ctyun_ecs; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    affinity_group_id   = optional(string)
    auto_renew          = optional(bool)
    az_name             = optional(string)
    bandwidth           = optional(number)
    cycle_count         = optional(number)
    cycle_type          = string
    deletion_protection = optional(bool)
    demand_billing_type = optional(string)
    display_name        = string
    fixed_ip            = optional(string)
    flavor_id           = optional(string)
    flavor_name         = optional(string)
    image_id            = string
    instance_name       = string
    is_destroy_instance = optional(bool)
    key_pair_name       = optional(string)
    labels = optional(list(object({
      key   = string
      value = string
    })))
    metadata           = optional(map(string))
    password           = optional(string)
    pay_voucher_price  = optional(number)
    project_id         = optional(string)
    region_id          = optional(string)
    security_group_ids = optional(set(string))
    security_product   = optional(string)
    status             = optional(string)
    subnet_id          = string
    system_disk_size   = number
    system_disk_type   = string
    user_data          = optional(string)
    vpc_id             = string
  })
}

resource "ctyun_ecs" "example" {
  affinity_group_id   = var.config.affinity_group_id
  auto_renew          = var.config.auto_renew
  az_name             = var.config.az_name
  bandwidth           = var.config.bandwidth
  cycle_count         = var.config.cycle_count
  cycle_type          = var.config.cycle_type
  deletion_protection = var.config.deletion_protection
  demand_billing_type = var.config.demand_billing_type
  display_name        = var.config.display_name
  fixed_ip            = var.config.fixed_ip
  flavor_id           = var.config.flavor_id
  flavor_name         = var.config.flavor_name
  image_id            = var.config.image_id
  instance_name       = var.config.instance_name
  is_destroy_instance = var.config.is_destroy_instance
  key_pair_name       = var.config.key_pair_name
  labels              = var.config.labels
  metadata            = var.config.metadata
  password            = var.config.password
  pay_voucher_price   = var.config.pay_voucher_price
  project_id          = var.config.project_id
  region_id           = var.config.region_id
  security_group_ids  = var.config.security_group_ids
  security_product    = var.config.security_product
  status              = var.config.status
  subnet_id           = var.config.subnet_id
  system_disk_size    = var.config.system_disk_size
  system_disk_type    = var.config.system_disk_type
  user_data           = var.config.user_data
  vpc_id              = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs.example.actual_image_id : string
# ctyun_ecs.example.create_time : string
# ctyun_ecs.example.eip_address : string
# ctyun_ecs.example.expire_time : string
# ctyun_ecs.example.id : string
# ctyun_ecs.example.master_order_id : string
# ctyun_ecs.example.master_port_id : string
# ctyun_ecs.example.name : string
# ctyun_ecs.example.system_disk_id : string
# ctyun_ecs.example.update_time : string
