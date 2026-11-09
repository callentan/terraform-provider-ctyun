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
  description = "Complete configurable shape for ctyun_nat; consult constraints before use."
  nullable    = false
  type = object({
    az_name              = optional(string)
    cycle_count          = optional(number)
    cycle_type           = string
    description          = optional(string)
    icmp_expire_time     = optional(number)
    name                 = string
    pay_voucher_price    = optional(string)
    project_id           = optional(string)
    region_id            = optional(string)
    spec                 = number
    tcp_delay_close_time = optional(number)
    tcp_expire_time      = optional(number)
    udp_expire_time      = optional(number)
    vpc_id               = string
  })
}

resource "ctyun_nat" "example" {
  az_name              = var.config.az_name
  cycle_count          = var.config.cycle_count
  cycle_type           = var.config.cycle_type
  description          = var.config.description
  icmp_expire_time     = var.config.icmp_expire_time
  name                 = var.config.name
  pay_voucher_price    = var.config.pay_voucher_price
  project_id           = var.config.project_id
  region_id            = var.config.region_id
  spec                 = var.config.spec
  tcp_delay_close_time = var.config.tcp_delay_close_time
  tcp_expire_time      = var.config.tcp_expire_time
  udp_expire_time      = var.config.udp_expire_time
  vpc_id               = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_nat.example.create_time : string
# ctyun_nat.example.expire_time : string
# ctyun_nat.example.id : string
# ctyun_nat.example.master_order_id : string
# ctyun_nat.example.nat_gateway_id : string
# ctyun_nat.example.vpc_cidr : string
# ctyun_nat.example.vpc_name : string
