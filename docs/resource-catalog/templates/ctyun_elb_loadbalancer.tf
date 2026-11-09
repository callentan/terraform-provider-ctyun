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
  description = "Complete configurable shape for ctyun_elb_loadbalancer; consult constraints before use."
  nullable    = false
  type = object({
    az_name            = optional(string)
    cycle_count        = optional(number)
    cycle_type         = string
    delete_protection  = optional(bool)
    description        = optional(string)
    eip_id             = optional(string)
    gw_enabled         = optional(number)
    name               = string
    pay_voucher_price  = optional(string)
    private_ip_address = optional(string)
    project_id         = optional(string)
    region_id          = optional(string)
    resource_type      = string
    sla_name           = string
    subnet_id          = string
    vpc_id             = string
  })
}

resource "ctyun_elb_loadbalancer" "example" {
  az_name            = var.config.az_name
  cycle_count        = var.config.cycle_count
  cycle_type         = var.config.cycle_type
  delete_protection  = var.config.delete_protection
  description        = var.config.description
  eip_id             = var.config.eip_id
  gw_enabled         = var.config.gw_enabled
  name               = var.config.name
  pay_voucher_price  = var.config.pay_voucher_price
  private_ip_address = var.config.private_ip_address
  project_id         = var.config.project_id
  region_id          = var.config.region_id
  resource_type      = var.config.resource_type
  sla_name           = var.config.sla_name
  subnet_id          = var.config.subnet_id
  vpc_id             = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_loadbalancer.example.admin_status : string
# ctyun_elb_loadbalancer.example.create_time : string
# ctyun_elb_loadbalancer.example.expired_time : string
# ctyun_elb_loadbalancer.example.id : string
# ctyun_elb_loadbalancer.example.ipv6_address : string
# ctyun_elb_loadbalancer.example.port_id : string
# ctyun_elb_loadbalancer.example.status : string
# ctyun_elb_loadbalancer.example.update_time : string
