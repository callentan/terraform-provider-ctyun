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
  description = "Complete configurable shape for ctyun_vpce_service_transit_ip; consult constraints before use."
  nullable    = false
  type = object({
    endpoint_service_id = string
    region_id           = optional(string)
    subnet_id           = string
    transit_ip          = optional(string)
  })
}

resource "ctyun_vpce_service_transit_ip" "example" {
  endpoint_service_id = var.config.endpoint_service_id
  region_id           = var.config.region_id
  subnet_id           = var.config.subnet_id
  transit_ip          = var.config.transit_ip
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpce_service_transit_ip.example.create_time : string
# ctyun_vpce_service_transit_ip.example.id : string
# ctyun_vpce_service_transit_ip.example.update_time : string
