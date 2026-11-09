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
  description = "Complete configurable shape for ctyun_sfs_permission_rule; consult constraints before use."
  nullable    = false
  type = object({
    auth_addr           = string
    permission_group_id = string
    priority            = number
    region_id           = optional(string)
    rw_permission       = string
  })
}

resource "ctyun_sfs_permission_rule" "example" {
  auth_addr           = var.config.auth_addr
  permission_group_id = var.config.permission_group_id
  priority            = var.config.priority
  region_id           = var.config.region_id
  rw_permission       = var.config.rw_permission
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_sfs_permission_rule.example.id : string
# ctyun_sfs_permission_rule.example.update_time : string
