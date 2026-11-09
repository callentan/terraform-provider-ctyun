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
  description = "Complete configurable shape for ctyun_ecs_snapshot; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    name        = string
    region_id   = optional(string)
  })
}

resource "ctyun_ecs_snapshot" "example" {
  instance_id = var.config.instance_id
  name        = var.config.name
  region_id   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ecs_snapshot.example.id : string
# ctyun_ecs_snapshot.example.snapshot_status : string
