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
  description = "Complete configurable shape for ctyun_vpc_route_table_rule; consult constraints before use."
  nullable    = false
  type = object({
    description    = optional(string)
    destination    = string
    ip_version     = number
    next_hop_id    = string
    next_hop_type  = string
    region_id      = optional(string)
    route_table_id = string
  })
}

resource "ctyun_vpc_route_table_rule" "example" {
  description    = var.config.description
  destination    = var.config.destination
  ip_version     = var.config.ip_version
  next_hop_id    = var.config.next_hop_id
  next_hop_type  = var.config.next_hop_type
  region_id      = var.config.region_id
  route_table_id = var.config.route_table_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_route_table_rule.example.id : string
# ctyun_vpc_route_table_rule.example.rule_id : string
