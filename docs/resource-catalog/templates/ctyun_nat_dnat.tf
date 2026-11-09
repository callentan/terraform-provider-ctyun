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
  description = "Complete configurable shape for ctyun_nat_dnat; consult constraints before use."
  nullable    = false
  type = object({
    description    = optional(string)
    dnat_type      = string
    external_id    = string
    external_port  = number
    instance_id    = optional(string)
    internal_ip    = optional(string)
    internal_port  = number
    nat_gateway_id = string
    protocol       = string
    region_id      = optional(string)
    server_type    = optional(string)
  })
}

resource "ctyun_nat_dnat" "example" {
  description    = var.config.description
  dnat_type      = var.config.dnat_type
  external_id    = var.config.external_id
  external_port  = var.config.external_port
  instance_id    = var.config.instance_id
  internal_ip    = var.config.internal_ip
  internal_port  = var.config.internal_port
  nat_gateway_id = var.config.nat_gateway_id
  protocol       = var.config.protocol
  region_id      = var.config.region_id
  server_type    = var.config.server_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_nat_dnat.example.create_time : string
# ctyun_nat_dnat.example.dnat_id : string
# ctyun_nat_dnat.example.external_ip : string
# ctyun_nat_dnat.example.id : string
# ctyun_nat_dnat.example.ip_expire_time : string
# ctyun_nat_dnat.example.state : string
