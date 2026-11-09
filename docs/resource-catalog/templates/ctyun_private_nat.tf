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
  description = "Complete configurable shape for ctyun_private_nat; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew        = optional(bool)
    az_name           = optional(string)
    cycle_count       = optional(number)
    cycle_type        = string
    description       = optional(string)
    name              = string
    pay_voucher_price = optional(string)
    project_id        = optional(string)
    region_id         = optional(string)
    spec              = string
    subnet_id         = string
    vpc_id            = string
  })
}

resource "ctyun_private_nat" "example" {
  auto_renew        = var.config.auto_renew
  az_name           = var.config.az_name
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  description       = var.config.description
  name              = var.config.name
  pay_voucher_price = var.config.pay_voucher_price
  project_id        = var.config.project_id
  region_id         = var.config.region_id
  spec              = var.config.spec
  subnet_id         = var.config.subnet_id
  vpc_id            = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_private_nat.example.create_time : string
# ctyun_private_nat.example.expire_time : string
# ctyun_private_nat.example.id : string
# ctyun_private_nat.example.master_order_id : string
# ctyun_private_nat.example.nat_gateway_id : string
# ctyun_private_nat.example.vpc_name : string
