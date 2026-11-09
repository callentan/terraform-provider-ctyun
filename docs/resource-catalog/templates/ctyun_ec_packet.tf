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
  description = "Complete configurable shape for ctyun_ec_packet; consult constraints before use."
  nullable    = false
  type = object({
    area_a            = optional(string)
    area_b            = optional(string)
    bandwidth         = number
    cycle_count       = number
    cycle_type        = string
    ec_id             = string
    name              = string
    pay_voucher_price = optional(string)
    resource_id       = optional(string)
  })
}

resource "ctyun_ec_packet" "example" {
  area_a            = var.config.area_a
  area_b            = var.config.area_b
  bandwidth         = var.config.bandwidth
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  ec_id             = var.config.ec_id
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  resource_id       = var.config.resource_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ec_packet.example.create_time : string
# ctyun_ec_packet.example.expire_time : string
# ctyun_ec_packet.example.id : string
# ctyun_ec_packet.example.master_order_id : string
# ctyun_ec_packet.example.master_order_no : string
# ctyun_ec_packet.example.master_resource_id : string
# ctyun_ec_packet.example.master_resource_status : string
