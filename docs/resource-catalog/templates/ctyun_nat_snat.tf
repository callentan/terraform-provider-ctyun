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
  description = "Complete configurable shape for ctyun_nat_snat; consult constraints before use."
  nullable    = false
  type = object({
    description      = optional(string)
    nat_gateway_id   = string
    region_id        = optional(string)
    snat_ips         = set(string)
    source_cidr      = optional(string)
    source_subnet_id = optional(string)
  })
}

resource "ctyun_nat_snat" "example" {
  description      = var.config.description
  nat_gateway_id   = var.config.nat_gateway_id
  region_id        = var.config.region_id
  snat_ips         = var.config.snat_ips
  source_cidr      = var.config.source_cidr
  source_subnet_id = var.config.source_subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_nat_snat.example.create_time : string
# ctyun_nat_snat.example.eips : list(object)
# ctyun_nat_snat.example.eips[*].eip_id : string
# ctyun_nat_snat.example.eips[*].ip_address : string
# ctyun_nat_snat.example.id : string
# ctyun_nat_snat.example.snat_id : string
# ctyun_nat_snat.example.subnet_type : number
