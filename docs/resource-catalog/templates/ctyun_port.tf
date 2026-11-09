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
  description = "Complete configurable shape for ctyun_port; consult constraints before use."
  nullable    = false
  type = object({
    description                = optional(string)
    ipv6_address_count         = optional(number)
    ipv6_addresses             = optional(list(string))
    name                       = optional(string)
    primary_ip_address         = optional(string)
    region_id                  = optional(string)
    secondary_private_ip_count = optional(number)
    secondary_private_ips      = optional(set(string))
    security_group_ids         = optional(set(string))
    subnet_id                  = string
  })
}

resource "ctyun_port" "example" {
  description                = var.config.description
  ipv6_address_count         = var.config.ipv6_address_count
  ipv6_addresses             = var.config.ipv6_addresses
  name                       = var.config.name
  primary_ip_address         = var.config.primary_ip_address
  region_id                  = var.config.region_id
  secondary_private_ip_count = var.config.secondary_private_ip_count
  secondary_private_ips      = var.config.secondary_private_ips
  security_group_ids         = var.config.security_group_ids
  subnet_id                  = var.config.subnet_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_port.example.id : string
# ctyun_port.example.instance_id : string
# ctyun_port.example.instance_type : string
# ctyun_port.example.mac_address : string
# ctyun_port.example.port_id : string
# ctyun_port.example.status : string
