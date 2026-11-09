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
  description = "Complete configurable shape for ctyun_ebs_snapshot; consult constraints before use."
  nullable    = false
  type = object({
    disk_id          = string
    name             = string
    project_id       = optional(string)
    region_id        = optional(string)
    retention_policy = string
    retention_time   = optional(number)
  })
}

resource "ctyun_ebs_snapshot" "example" {
  disk_id          = var.config.disk_id
  name             = var.config.name
  project_id       = var.config.project_id
  region_id        = var.config.region_id
  retention_policy = var.config.retention_policy
  retention_time   = var.config.retention_time
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_snapshot.example.id : string
# ctyun_ebs_snapshot.example.snapshot_status : string
