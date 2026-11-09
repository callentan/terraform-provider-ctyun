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
  description = "Complete configurable shape for ctyun_mysql_backup_setting; consult constraints before use."
  nullable    = false
  type = object({
    allow_earliest_time        = string
    frequency_backup           = optional(bool)
    frequency_backup_unit_time = optional(number)
    instance_id                = string
    project_id                 = optional(string)
    region_id                  = optional(string)
    storage_day                = number
    trigger_days_of_week       = set(number)
  })
}

resource "ctyun_mysql_backup_setting" "example" {
  allow_earliest_time        = var.config.allow_earliest_time
  frequency_backup           = var.config.frequency_backup
  frequency_backup_unit_time = var.config.frequency_backup_unit_time
  instance_id                = var.config.instance_id
  project_id                 = var.config.project_id
  region_id                  = var.config.region_id
  storage_day                = var.config.storage_day
  trigger_days_of_week       = var.config.trigger_days_of_week
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_backup_setting.example.id : string
