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
  description = "Complete configurable shape for ctyun_ecs_port_association; consult constraints before use."
  nullable    = false
  type = object({
    az_name     = optional(string)
    instance_id = string
    port_id     = string
    project_id  = optional(string)
    region_id   = optional(string)
  })
}

resource "ctyun_ecs_port_association" "example" {
  az_name     = var.config.az_name
  instance_id = var.config.instance_id
  port_id     = var.config.port_id
  project_id  = var.config.project_id
  region_id   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_port_association.example.id : string
