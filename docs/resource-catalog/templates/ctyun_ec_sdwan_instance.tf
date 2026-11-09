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
  description = "Complete configurable shape for ctyun_ec_sdwan_instance; consult constraints before use."
  nullable    = false
  type = object({
    cgw_id      = string
    ec_id       = string
    route_learn = optional(number)
    route_sync  = optional(number)
    rtb_id      = string
    sdwan_id    = string
    weights     = optional(number)
  })
}

resource "ctyun_ec_sdwan_instance" "example" {
  cgw_id      = var.config.cgw_id
  ec_id       = var.config.ec_id
  route_learn = var.config.route_learn
  route_sync  = var.config.route_sync
  rtb_id      = var.config.rtb_id
  sdwan_id    = var.config.sdwan_id
  weights     = var.config.weights
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_sdwan_instance.example.id : string
