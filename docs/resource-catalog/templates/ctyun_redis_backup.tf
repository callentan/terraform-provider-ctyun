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
  description = "Complete configurable shape for ctyun_redis_backup; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    ip_type     = optional(string)
    region_id   = optional(string)
    remark      = optional(string)
  })
}

resource "ctyun_redis_backup" "example" {
  instance_id = var.config.instance_id
  ip_type     = var.config.ip_type
  region_id   = var.config.region_id
  remark      = var.config.remark
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_backup.example.create_time : string
# ctyun_redis_backup.example.download_urls : map(string)
# ctyun_redis_backup.example.id : string
# ctyun_redis_backup.example.name : string
# ctyun_redis_backup.example.status : string
# ctyun_redis_backup.example.type : number
