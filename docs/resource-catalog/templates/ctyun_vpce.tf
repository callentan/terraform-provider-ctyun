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
  description = "Complete configurable shape for ctyun_vpce; consult constraints before use."
  nullable    = false
  type = object({
    delete_protection   = optional(bool)
    description         = optional(string)
    enable_dns          = optional(bool)
    endpoint_service_id = string
    name                = string
    project_id          = optional(string)
    region_id           = optional(string)
    subnet_id           = string
    subnet_ip           = optional(string)
    vpc_id              = string
    whitelist_cidr      = optional(set(string))
    whitelist_flag      = bool
  })
}

resource "ctyun_vpce" "example" {
  delete_protection   = var.config.delete_protection
  description         = var.config.description
  enable_dns          = var.config.enable_dns
  endpoint_service_id = var.config.endpoint_service_id
  name                = var.config.name
  project_id          = var.config.project_id
  region_id           = var.config.region_id
  subnet_id           = var.config.subnet_id
  subnet_ip           = var.config.subnet_ip
  vpc_id              = var.config.vpc_id
  whitelist_cidr      = var.config.whitelist_cidr
  whitelist_flag      = var.config.whitelist_flag
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpce.example.create_time : string
# ctyun_vpce.example.id : string
# ctyun_vpce.example.master_order_id : string
# ctyun_vpce.example.status : number
# ctyun_vpce.example.update_time : string
