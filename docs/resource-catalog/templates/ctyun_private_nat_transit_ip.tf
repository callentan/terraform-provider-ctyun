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
  description = "Complete configurable shape for ctyun_private_nat_transit_ip; consult constraints before use."
  nullable    = false
  type = object({
    address        = string
    nat_gateway_id = string
    region_id      = optional(string)
  })
}

resource "ctyun_private_nat_transit_ip" "example" {
  address        = var.config.address
  nat_gateway_id = var.config.nat_gateway_id
  region_id      = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_nat_transit_ip.example.id : string
# ctyun_private_nat_transit_ip.example.is_default : bool
# ctyun_private_nat_transit_ip.example.snat_count : number
# ctyun_private_nat_transit_ip.example.status : string
