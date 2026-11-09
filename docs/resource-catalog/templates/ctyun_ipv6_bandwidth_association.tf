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
  description = "Complete configurable shape for ctyun_ipv6_bandwidth_association; consult constraints before use."
  nullable    = false
  type = object({
    ipv6              = string
    ipv6_bandwidth_id = string
    region_id         = optional(string)
  })
}

resource "ctyun_ipv6_bandwidth_association" "example" {
  ipv6              = var.config.ipv6
  ipv6_bandwidth_id = var.config.ipv6_bandwidth_id
  region_id         = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ipv6_bandwidth_association.example.id : string
