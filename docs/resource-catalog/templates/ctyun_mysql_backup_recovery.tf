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
  description = "Complete configurable shape for ctyun_mysql_backup_recovery; consult constraints before use."
  nullable    = false
  type = object({
    dst_instance_id = string
    instance_id     = optional(string)
    project_id      = optional(string)
    region_id       = optional(string)
    src_instance_id = string
    task_id         = optional(string)
    to_timepoint    = optional(string)
  })
}

resource "ctyun_mysql_backup_recovery" "example" {
  dst_instance_id = var.config.dst_instance_id
  instance_id     = var.config.instance_id
  project_id      = var.config.project_id
  region_id       = var.config.region_id
  src_instance_id = var.config.src_instance_id
  task_id         = var.config.task_id
  to_timepoint    = var.config.to_timepoint
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_backup_recovery.example.id : number
