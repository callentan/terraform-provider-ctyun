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
  description = "Complete configurable shape for ctyun_redis_migration_task; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    conflict_mode = optional(number)
    operate_type  = optional(number)
    region_id     = optional(string)
    source_db_info = object({
      account_name     = optional(string)
      ip_addr          = optional(string)
      original_cluster = optional(bool)
      password         = optional(string)
      spu_inst_id      = string
    })
    sync_mode = optional(number)
    target_db_info = object({
      account_name     = optional(string)
      ip_addr          = optional(string)
      original_cluster = optional(bool)
      password         = optional(string)
      spu_inst_id      = string
    })
  })
}

resource "ctyun_redis_migration_task" "example" {
  conflict_mode  = var.config.conflict_mode
  operate_type   = var.config.operate_type
  region_id      = var.config.region_id
  source_db_info = var.config.source_db_info
  sync_mode      = var.config.sync_mode
  target_db_info = var.config.target_db_info
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_migration_task.example.complete_time : string
# ctyun_redis_migration_task.example.create_time : string
# ctyun_redis_migration_task.example.id : string
# ctyun_redis_migration_task.example.status : number
