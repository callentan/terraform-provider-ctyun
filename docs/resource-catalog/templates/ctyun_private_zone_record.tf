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
  description = "Complete configurable shape for ctyun_private_zone_record; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    enabled     = optional(bool)
    name        = string
    region_id   = optional(string)
    ttl         = optional(number)
    type        = string
    value_list  = set(string)
    zone_id     = string
  })
}

resource "ctyun_private_zone_record" "example" {
  description = var.config.description
  enabled     = var.config.enabled
  name        = var.config.name
  region_id   = var.config.region_id
  ttl         = var.config.ttl
  type        = var.config.type
  value_list  = var.config.value_list
  zone_id     = var.config.zone_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_zone_record.example.create_time : string
# ctyun_private_zone_record.example.id : string
# ctyun_private_zone_record.example.update_time : string
