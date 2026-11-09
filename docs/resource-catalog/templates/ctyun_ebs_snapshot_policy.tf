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
  description = "Complete configurable shape for ctyun_ebs_snapshot_policy; consult constraints before use."
  nullable    = false
  type = object({
    enabled         = optional(bool)
    name            = string
    project_id      = optional(string)
    region_id       = optional(string)
    repeat_times    = string
    repeat_weekdays = string
    retention_time  = number
  })
}

resource "ctyun_ebs_snapshot_policy" "example" {
  enabled         = var.config.enabled
  name            = var.config.name
  project_id      = var.config.project_id
  region_id       = var.config.region_id
  repeat_times    = var.config.repeat_times
  repeat_weekdays = var.config.repeat_weekdays
  retention_time  = var.config.retention_time
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_snapshot_policy.example.bound_disk_num : number
# ctyun_ebs_snapshot_policy.example.create_time : string
# ctyun_ebs_snapshot_policy.example.id : string
# ctyun_ebs_snapshot_policy.example.status : string
