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
  description = "Complete configurable shape for ctyun_prefix_list; consult constraints before use."
  nullable    = false
  type = object({
    address_type = string
    description  = optional(string)
    limit        = number
    name         = string
    prefix_list_rules = set(object({
      cidr        = string
      description = optional(string)
    }))
    region_id = optional(string)
  })
}

resource "ctyun_prefix_list" "example" {
  address_type      = var.config.address_type
  description       = var.config.description
  limit             = var.config.limit
  name              = var.config.name
  prefix_list_rules = var.config.prefix_list_rules
  region_id         = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_prefix_list.example.create_time : string
# ctyun_prefix_list.example.id : string
# ctyun_prefix_list.example.update_time : string
