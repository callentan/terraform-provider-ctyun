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
  description = "Complete configurable shape for ctyun_private_nat_dnat; consult constraints before use."
  nullable    = false
  type = object({
    description    = optional(string)
    external_ip    = string
    external_port  = number
    internal_ip    = optional(string)
    internal_port  = number
    nat_gateway_id = string
    port_id        = optional(string)
    protocol       = string
    region_id      = optional(string)
  })
}

resource "ctyun_private_nat_dnat" "example" {
  description    = var.config.description
  external_ip    = var.config.external_ip
  external_port  = var.config.external_port
  internal_ip    = var.config.internal_ip
  internal_port  = var.config.internal_port
  nat_gateway_id = var.config.nat_gateway_id
  port_id        = var.config.port_id
  protocol       = var.config.protocol
  region_id      = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_nat_dnat.example.create_time : string
# ctyun_private_nat_dnat.example.device_id : string
# ctyun_private_nat_dnat.example.dnat_id : string
# ctyun_private_nat_dnat.example.id : string
# ctyun_private_nat_dnat.example.port_name : string
# ctyun_private_nat_dnat.example.state : string
