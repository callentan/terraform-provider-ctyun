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
  description = "Complete configurable shape for ctyun_zos_bucket; consult constraints before use."
  nullable    = false
  type = object({
    acl             = optional(string)
    az_policy       = optional(string)
    bucket          = string
    is_encrypted    = optional(bool)
    log_bucket      = optional(string)
    log_enabled     = optional(bool)
    log_prefix      = optional(string)
    project_id      = optional(string)
    region_id       = optional(string)
    retention_day   = optional(number)
    retention_mode  = optional(string)
    retention_year  = optional(number)
    storage_type    = optional(string)
    tags            = optional(map(string))
    version_enabled = optional(bool)
  })
}

resource "ctyun_zos_bucket" "example" {
  acl             = var.config.acl
  az_policy       = var.config.az_policy
  bucket          = var.config.bucket
  is_encrypted    = var.config.is_encrypted
  log_bucket      = var.config.log_bucket
  log_enabled     = var.config.log_enabled
  log_prefix      = var.config.log_prefix
  project_id      = var.config.project_id
  region_id       = var.config.region_id
  retention_day   = var.config.retention_day
  retention_mode  = var.config.retention_mode
  retention_year  = var.config.retention_year
  storage_type    = var.config.storage_type
  tags            = var.config.tags
  version_enabled = var.config.version_enabled
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_zos_bucket.example.cmk_uuid : string
# ctyun_zos_bucket.example.create_time : string
# ctyun_zos_bucket.example.id : string
# ctyun_zos_bucket.example.name : string
