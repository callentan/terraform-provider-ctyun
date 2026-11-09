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
  description = "Complete configurable shape for ctyun_ebs_backup; consult constraints before use."
  nullable    = false
  type = object({
    description   = optional(string)
    disk_id       = string
    full_backup   = optional(bool)
    name          = string
    region_id     = optional(string)
    repository_id = string
  })
}

resource "ctyun_ebs_backup" "example" {
  description   = var.config.description
  disk_id       = var.config.disk_id
  full_backup   = var.config.full_backup
  name          = var.config.name
  region_id     = var.config.region_id
  repository_id = var.config.repository_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs_backup.example.backup_size : number
# ctyun_ebs_backup.example.backup_status : string
# ctyun_ebs_backup.example.disk_size : number
# ctyun_ebs_backup.example.disk_type : string
# ctyun_ebs_backup.example.encrypted : bool
# ctyun_ebs_backup.example.freeze : bool
# ctyun_ebs_backup.example.id : string
# ctyun_ebs_backup.example.instance_id : string
# ctyun_ebs_backup.example.instance_name : string
# ctyun_ebs_backup.example.paas : bool
# ctyun_ebs_backup.example.project_id : string
# ctyun_ebs_backup.example.repository_name : string
