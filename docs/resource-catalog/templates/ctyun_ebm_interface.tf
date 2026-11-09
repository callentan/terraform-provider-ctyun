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
  description = "Complete configurable shape for ctyun_ebm_interface; consult constraints before use."
  nullable    = false
  type = object({
    az_name            = optional(string)
    instance_id        = string
    ipv4               = string
    region_id          = optional(string)
    security_group_ids = set(string)
    subnet_id          = string
  })
}

resource "ctyun_ebm_interface" "example" {
  az_name            = var.config.az_name
  instance_id        = var.config.instance_id
  ipv4               = var.config.ipv4
  region_id          = var.config.region_id
  security_group_ids = var.config.security_group_ids
  subnet_id          = var.config.subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebm_interface.example.id : string
# ctyun_ebm_interface.example.interface_id : string
