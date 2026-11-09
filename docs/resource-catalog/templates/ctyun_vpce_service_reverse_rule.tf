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
  description = "Complete configurable shape for ctyun_vpce_service_reverse_rule; consult constraints before use."
  nullable    = false
  type = object({
    endpoint_id         = string
    endpoint_service_id = string
    protocol            = string
    region_id           = optional(string)
    target_ip           = string
    target_port         = number
    transit_ip          = string
    transit_port        = number
  })
}

resource "ctyun_vpce_service_reverse_rule" "example" {
  endpoint_id         = var.config.endpoint_id
  endpoint_service_id = var.config.endpoint_service_id
  protocol            = var.config.protocol
  region_id           = var.config.region_id
  target_ip           = var.config.target_ip
  target_port         = var.config.target_port
  transit_ip          = var.config.transit_ip
  transit_port        = var.config.transit_port
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpce_service_reverse_rule.example.create_time : string
# ctyun_vpce_service_reverse_rule.example.id : string
# ctyun_vpce_service_reverse_rule.example.update_time : string
