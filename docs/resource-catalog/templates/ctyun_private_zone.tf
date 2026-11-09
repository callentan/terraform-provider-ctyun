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
  description = "Complete configurable shape for ctyun_private_zone; consult constraints before use."
  nullable    = false
  type = object({
    description   = optional(string)
    name          = string
    project_id    = optional(string)
    proxy_pattern = optional(string)
    region_id     = optional(string)
    tags = optional(set(object({
      key   = string
      value = string
    })))
    ttl         = optional(number)
    vpc_id_list = set(string)
  })
}

resource "ctyun_private_zone" "example" {
  description   = var.config.description
  name          = var.config.name
  project_id    = var.config.project_id
  proxy_pattern = var.config.proxy_pattern
  region_id     = var.config.region_id
  tags          = var.config.tags
  ttl           = var.config.ttl
  vpc_id_list   = var.config.vpc_id_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_zone.example.create_time : string
# ctyun_private_zone.example.id : string
# ctyun_private_zone.example.tags[*].tag_id : string
# ctyun_private_zone.example.update_time : string
