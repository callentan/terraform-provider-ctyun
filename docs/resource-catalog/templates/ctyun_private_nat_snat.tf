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
  description = "Complete configurable shape for ctyun_private_nat_snat; consult constraints before use."
  nullable    = false
  type = object({
    addresses        = set(string)
    description      = optional(string)
    nat_gateway_id   = string
    region_id        = optional(string)
    source_subnet_id = string
  })
}

resource "ctyun_private_nat_snat" "example" {
  addresses        = var.config.addresses
  description      = var.config.description
  nat_gateway_id   = var.config.nat_gateway_id
  region_id        = var.config.region_id
  source_subnet_id = var.config.source_subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_nat_snat.example.id : string
# ctyun_private_nat_snat.example.snat_id : string
# ctyun_private_nat_snat.example.source_vpc_name : string
# ctyun_private_nat_snat.example.state : string
