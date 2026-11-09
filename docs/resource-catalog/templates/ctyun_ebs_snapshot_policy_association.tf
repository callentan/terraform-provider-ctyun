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
  description = "Complete configurable shape for ctyun_ebs_snapshot_policy_association; consult constraints before use."
  nullable    = false
  type = object({
    disk_id            = string
    region_id          = optional(string)
    snapshot_policy_id = string
  })
}

resource "ctyun_ebs_snapshot_policy_association" "example" {
  disk_id            = var.config.disk_id
  region_id          = var.config.region_id
  snapshot_policy_id = var.config.snapshot_policy_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_snapshot_policy_association.example.id : string
