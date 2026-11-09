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
  description = "Complete configurable shape for ctyun_ipv6_bandwidth; consult constraints before use."
  nullable    = false
  type = object({
    bandwidth         = number
    cycle_count       = optional(number)
    cycle_type        = string
    name              = string
    pay_voucher_price = optional(string)
    region_id         = optional(string)
  })
}

resource "ctyun_ipv6_bandwidth" "example" {
  bandwidth         = var.config.bandwidth
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  region_id         = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ipv6_bandwidth.example.create_time : string
# ctyun_ipv6_bandwidth.example.expire_time : string
# ctyun_ipv6_bandwidth.example.expired : bool
# ctyun_ipv6_bandwidth.example.id : string
# ctyun_ipv6_bandwidth.example.ip_address : string
# ctyun_ipv6_bandwidth.example.ipv6_gateway_id : string
# ctyun_ipv6_bandwidth.example.resource_spec : string
# ctyun_ipv6_bandwidth.example.status : string
