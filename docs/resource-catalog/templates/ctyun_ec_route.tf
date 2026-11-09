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
  description = "Complete configurable shape for ctyun_ec_route; consult constraints before use."
  nullable    = false
  type = object({
    cgw_id              = string
    cidr                = string
    description         = optional(string)
    ec_id               = string
    ip_version          = string
    is_black_hole_route = optional(bool)
    next_hop_id         = optional(string)
    next_hop_type       = optional(string)
    rtb_id              = string
  })
}

resource "ctyun_ec_route" "example" {
  cgw_id              = var.config.cgw_id
  cidr                = var.config.cidr
  description         = var.config.description
  ec_id               = var.config.ec_id
  ip_version          = var.config.ip_version
  is_black_hole_route = var.config.is_black_hole_route
  next_hop_id         = var.config.next_hop_id
  next_hop_type       = var.config.next_hop_type
  rtb_id              = var.config.rtb_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_route.example.create_time : string
# ctyun_ec_route.example.id : string
