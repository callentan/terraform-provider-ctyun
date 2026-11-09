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
  description = "Complete configurable shape for ctyun_vpc_peer_connection_attach; consult constraints before use."
  nullable    = false
  type = object({
    operation          = string
    peer_connection_id = string
    region_id          = optional(string)
  })
}

resource "ctyun_vpc_peer_connection_attach" "example" {
  operation          = var.config.operation
  peer_connection_id = var.config.peer_connection_id
  region_id          = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_peer_connection_attach.example.id : string
