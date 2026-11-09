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
  description = "Complete configurable shape for ctyun_sfs_permission_group_association; consult constraints before use."
  nullable    = false
  type = object({
    permission_group_id = string
    region_id           = optional(string)
    sfs_id              = string
    vpc_id              = string
  })
}

resource "ctyun_sfs_permission_group_association" "example" {
  permission_group_id = var.config.permission_group_id
  region_id           = var.config.region_id
  sfs_id              = var.config.sfs_id
  vpc_id              = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_sfs_permission_group_association.example.id : string
# ctyun_sfs_permission_group_association.example.is_default : bool
# ctyun_sfs_permission_group_association.example.permission_group_description : string
# ctyun_sfs_permission_group_association.example.permission_group_name : string
# ctyun_sfs_permission_group_association.example.vpc_cidr : string
# ctyun_sfs_permission_group_association.example.vpc_name : string
