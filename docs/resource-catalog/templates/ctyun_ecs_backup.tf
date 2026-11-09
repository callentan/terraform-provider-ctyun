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
  description = "Complete configurable shape for ctyun_ecs_backup; consult constraints before use."
  nullable    = false
  type = object({
    full_backup                 = optional(bool)
    instance_backup_description = optional(string)
    instance_id                 = string
    name                        = string
    region_id                   = optional(string)
    repository_id               = string
  })
}

resource "ctyun_ecs_backup" "example" {
  full_backup                 = var.config.full_backup
  instance_backup_description = var.config.instance_backup_description
  instance_id                 = var.config.instance_id
  name                        = var.config.name
  region_id                   = var.config.region_id
  repository_id               = var.config.repository_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_backup.example.backup_type : string
# ctyun_ecs_backup.example.create_time : string
# ctyun_ecs_backup.example.disk_total_size : number
# ctyun_ecs_backup.example.id : string
# ctyun_ecs_backup.example.instance_backup_status : string
# ctyun_ecs_backup.example.instance_name : string
# ctyun_ecs_backup.example.project_id : string
# ctyun_ecs_backup.example.repository_name : string
# ctyun_ecs_backup.example.used_size : number
