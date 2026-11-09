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
  description = "Complete configurable shape for ctyun_ecs_backup_policy; consult constraints before use."
  nullable    = false
  type = object({
    adv_retention = optional(object({
      adv_day   = optional(number)
      adv_month = optional(number)
      adv_week  = optional(number)
      adv_year  = optional(number)
    }))
    adv_retention_status = optional(bool)
    cycle_day            = optional(number)
    cycle_type           = string
    cycle_week           = optional(string)
    full_backup_interval = optional(number)
    name                 = string
    project_id           = optional(string)
    region_id            = optional(string)
    retention_day        = optional(number)
    retention_num        = optional(number)
    retention_type       = string
    status               = optional(number)
    time                 = optional(string)
  })
}

resource "ctyun_ecs_backup_policy" "example" {
  adv_retention        = var.config.adv_retention
  adv_retention_status = var.config.adv_retention_status
  cycle_day            = var.config.cycle_day
  cycle_type           = var.config.cycle_type
  cycle_week           = var.config.cycle_week
  full_backup_interval = var.config.full_backup_interval
  name                 = var.config.name
  project_id           = var.config.project_id
  region_id            = var.config.region_id
  retention_day        = var.config.retention_day
  retention_num        = var.config.retention_num
  retention_type       = var.config.retention_type
  status               = var.config.status
  time                 = var.config.time
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_backup_policy.example.id : string
# ctyun_ecs_backup_policy.example.repository_list : list(object)
# ctyun_ecs_backup_policy.example.repository_list[*].repository_id : string
# ctyun_ecs_backup_policy.example.repository_list[*].repository_name : string
# ctyun_ecs_backup_policy.example.resource_ids : string
