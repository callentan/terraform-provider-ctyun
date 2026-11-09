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
  description = "Complete configurable shape for ctyun_ccse_node_association; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    az_name                     = optional(string)
    cluster_id                  = string
    instance_id                 = string
    instance_type               = string
    mirror_id                   = string
    password                    = optional(string)
    region_id                   = optional(string)
    visibility_host_script      = optional(string)
    visibility_post_host_script = optional(string)
  })
}

resource "ctyun_ccse_node_association" "example" {
  az_name                     = var.config.az_name
  cluster_id                  = var.config.cluster_id
  instance_id                 = var.config.instance_id
  instance_type               = var.config.instance_type
  mirror_id                   = var.config.mirror_id
  password                    = var.config.password
  region_id                   = var.config.region_id
  visibility_host_script      = var.config.visibility_host_script
  visibility_post_host_script = var.config.visibility_post_host_script
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_node_association.example.default_pool_id : string
# ctyun_ccse_node_association.example.id : string
# ctyun_ccse_node_association.example.is_evict : bool
# ctyun_ccse_node_association.example.is_schedule : bool
# ctyun_ccse_node_association.example.name : string
# ctyun_ccse_node_association.example.node_status : string
# ctyun_ccse_node_association.example.node_type : string
