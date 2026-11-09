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
  description = "Complete configurable shape for ctyun_ec_region_peer; consult constraints before use."
  nullable    = false
  type = object({
    dst_cgw_id  = string
    ec_id       = string
    name        = string
    packet_id   = string
    rate        = number
    route_learn = optional(number)
    src_cgw_id  = string
  })
}

resource "ctyun_ec_region_peer" "example" {
  dst_cgw_id  = var.config.dst_cgw_id
  ec_id       = var.config.ec_id
  name        = var.config.name
  packet_id   = var.config.packet_id
  rate        = var.config.rate
  route_learn = var.config.route_learn
  src_cgw_id  = var.config.src_cgw_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_region_peer.example.dst_region_id : string
# ctyun_ec_region_peer.example.id : string
# ctyun_ec_region_peer.example.src_region_id : string
# ctyun_ec_region_peer.example.update_time : string
