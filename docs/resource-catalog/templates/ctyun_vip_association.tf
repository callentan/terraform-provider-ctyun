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
  description = "Complete configurable shape for ctyun_vip_association; consult constraints before use."
  nullable    = false
  type = object({
    floating_id          = optional(string)
    instance_id          = optional(string)
    network_interface_id = optional(string)
    region_id            = optional(string)
    resource_type        = optional(string)
    vip_id               = string
  })
}

resource "ctyun_vip_association" "example" {
  floating_id          = var.config.floating_id
  instance_id          = var.config.instance_id
  network_interface_id = var.config.network_interface_id
  region_id            = var.config.region_id
  resource_type        = var.config.resource_type
  vip_id               = var.config.vip_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vip_association.example.id : string
