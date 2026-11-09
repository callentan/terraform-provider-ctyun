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
  description = "Complete configurable shape for ctyun_ccse_node_pool; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    affinity_group_id = optional(string)
    auto_renew        = optional(bool)
    az_infos = list(object({
      az_name = string
    }))
    cluster_id  = string
    cycle_count = optional(number)
    cycle_type  = string
    data_disks = optional(list(object({
      size = optional(number)
      type = string
    })))
    instance_type = string
    item_def_name = string
    key_pair_name = optional(string)
    max_pod_num   = optional(number)
    mirror_id     = optional(string)
    mirror_name   = optional(string)
    mirror_type   = number
    name          = string
    node_num      = optional(number)
    password      = optional(string)
    region_id     = optional(string)
    sys_disk = optional(object({
      size = number
      type = string
    }))
    use_affinity_group          = optional(bool)
    visibility_host_script      = optional(string)
    visibility_post_host_script = optional(string)
  })
}

resource "ctyun_ccse_node_pool" "example" {
  affinity_group_id           = var.config.affinity_group_id
  auto_renew                  = var.config.auto_renew
  az_infos                    = var.config.az_infos
  cluster_id                  = var.config.cluster_id
  cycle_count                 = var.config.cycle_count
  cycle_type                  = var.config.cycle_type
  data_disks                  = var.config.data_disks
  instance_type               = var.config.instance_type
  item_def_name               = var.config.item_def_name
  key_pair_name               = var.config.key_pair_name
  max_pod_num                 = var.config.max_pod_num
  mirror_id                   = var.config.mirror_id
  mirror_name                 = var.config.mirror_name
  mirror_type                 = var.config.mirror_type
  name                        = var.config.name
  node_num                    = var.config.node_num
  password                    = var.config.password
  region_id                   = var.config.region_id
  sys_disk                    = var.config.sys_disk
  use_affinity_group          = var.config.use_affinity_group
  visibility_host_script      = var.config.visibility_host_script
  visibility_post_host_script = var.config.visibility_post_host_script
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_node_pool.example.id : string
