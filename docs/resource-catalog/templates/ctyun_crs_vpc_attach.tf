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
  description = "Complete configurable shape for ctyun_crs_vpc_attach; consult constraints before use."
  nullable    = false
  type = object({
    region_id = optional(string)
    subnet_id = optional(string)
    vpc_id    = string
  })
}

resource "ctyun_crs_vpc_attach" "example" {
  region_id = var.config.region_id
  subnet_id = var.config.subnet_id
  vpc_id    = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_crs_vpc_attach.example.id : string
