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
  description = "Complete configurable shape for ctyun_subnet; consult constraints before use."
  nullable    = false
  type = object({
    cidr           = string
    description    = optional(string)
    dns            = set(string)
    enable_ipv6    = optional(bool)
    name           = string
    project_id     = optional(string)
    region_id      = optional(string)
    route_table_id = optional(string)
    type           = optional(string)
    vpc_id         = string
  })
}

resource "ctyun_subnet" "example" {
  cidr           = var.config.cidr
  description    = var.config.description
  dns            = var.config.dns
  enable_ipv6    = var.config.enable_ipv6
  name           = var.config.name
  project_id     = var.config.project_id
  region_id      = var.config.region_id
  route_table_id = var.config.route_table_id
  type           = var.config.type
  vpc_id         = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_subnet.example.gateway_ip : string
# ctyun_subnet.example.id : string
# ctyun_subnet.example.ipv4_end : string
# ctyun_subnet.example.ipv4_start : string
# ctyun_subnet.example.ipv6_end : string
# ctyun_subnet.example.ipv6_start : string
