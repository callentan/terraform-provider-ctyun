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
  description = "Complete configurable shape for ctyun_vpc_route_table; consult constraints before use."
  nullable    = false
  type = object({
    bind_gateway = optional(bool)
    name         = string
    project_id   = optional(string)
    region_id    = optional(string)
    route_type   = optional(string)
    vpc_id       = string
  })
}

resource "ctyun_vpc_route_table" "example" {
  bind_gateway = var.config.bind_gateway
  name         = var.config.name
  project_id   = var.config.project_id
  region_id    = var.config.region_id
  route_type   = var.config.route_type
  vpc_id       = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_route_table.example.id : string
# ctyun_vpc_route_table.example.route_table_id : string
