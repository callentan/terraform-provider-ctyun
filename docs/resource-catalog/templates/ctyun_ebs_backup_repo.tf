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
  description = "Complete configurable shape for ctyun_ebs_backup_repo; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew_status = optional(number)
    cycle_count       = number
    cycle_type        = string
    name              = string
    on_demand         = optional(string)
    project_id        = optional(string)
    region_id         = optional(string)
    size              = optional(number)
  })
}

resource "ctyun_ebs_backup_repo" "example" {
  auto_renew_status = var.config.auto_renew_status
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  name              = var.config.name
  on_demand         = var.config.on_demand
  project_id        = var.config.project_id
  region_id         = var.config.region_id
  size              = var.config.size
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_backup_repo.example.backup_list : list(string)
# ctyun_ebs_backup_repo.example.create_time : string
# ctyun_ebs_backup_repo.example.expire_time : string
# ctyun_ebs_backup_repo.example.expired : bool
# ctyun_ebs_backup_repo.example.free_size : number
# ctyun_ebs_backup_repo.example.freeze : bool
# ctyun_ebs_backup_repo.example.id : string
# ctyun_ebs_backup_repo.example.paas : bool
# ctyun_ebs_backup_repo.example.status : string
# ctyun_ebs_backup_repo.example.used_size : number
