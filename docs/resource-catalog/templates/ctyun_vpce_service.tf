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
  description = "Complete configurable shape for ctyun_vpce_service; consult constraints before use."
  nullable    = false
  type = object({
    auto_connection  = bool
    description      = optional(string)
    dns_name         = optional(string)
    force_enable_dns = optional(bool)
    instance_id      = optional(string)
    instance_type    = optional(string)
    name             = string
    oa_type          = optional(string)
    project_id       = optional(string)
    region_id        = optional(string)
    rules = optional(set(object({
      endpoint_port = number
      protocol      = string
      server_port   = number
    })))
    service_charge  = optional(bool)
    subnet_id       = optional(string)
    type            = string
    vpc_id          = string
    whitelist_email = optional(set(string))
  })
}

resource "ctyun_vpce_service" "example" {
  auto_connection  = var.config.auto_connection
  description      = var.config.description
  dns_name         = var.config.dns_name
  force_enable_dns = var.config.force_enable_dns
  instance_id      = var.config.instance_id
  instance_type    = var.config.instance_type
  name             = var.config.name
  oa_type          = var.config.oa_type
  project_id       = var.config.project_id
  region_id        = var.config.region_id
  rules            = var.config.rules
  service_charge   = var.config.service_charge
  subnet_id        = var.config.subnet_id
  type             = var.config.type
  vpc_id           = var.config.vpc_id
  whitelist_email  = var.config.whitelist_email
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpce_service.example.create_time : string
# ctyun_vpce_service.example.id : string
# ctyun_vpce_service.example.update_time : string
