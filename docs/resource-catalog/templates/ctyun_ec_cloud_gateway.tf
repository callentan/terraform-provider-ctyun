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
  description = "Complete configurable shape for ctyun_ec_cloud_gateway; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    ec_id       = string
    name        = string
    region      = optional(number)
    region_id   = optional(string)
    region_name = string
  })
}

resource "ctyun_ec_cloud_gateway" "example" {
  description = var.config.description
  ec_id       = var.config.ec_id
  name        = var.config.name
  region      = var.config.region
  region_id   = var.config.region_id
  region_name = var.config.region_name
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_cloud_gateway.example.create_time : string
# ctyun_ec_cloud_gateway.example.id : string
# ctyun_ec_cloud_gateway.example.rtb_id : string
