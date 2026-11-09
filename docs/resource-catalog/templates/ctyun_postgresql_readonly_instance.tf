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
  description = "Complete configurable shape for ctyun_postgresql_readonly_instance; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew             = optional(bool)
    availability_zone_name = optional(string)
    cycle_count            = optional(number)
    cycle_type             = string
    flavor_name            = optional(string)
    instance_id            = string
    name                   = string
    project_id             = optional(string)
    region_id              = optional(string)
  })
}

resource "ctyun_postgresql_readonly_instance" "example" {
  auto_renew             = var.config.auto_renew
  availability_zone_name = var.config.availability_zone_name
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  flavor_name            = var.config.flavor_name
  instance_id            = var.config.instance_id
  name                   = var.config.name
  project_id             = var.config.project_id
  region_id              = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_readonly_instance.example.create_time : string
# ctyun_postgresql_readonly_instance.example.expire_time : string
# ctyun_postgresql_readonly_instance.example.id : string
