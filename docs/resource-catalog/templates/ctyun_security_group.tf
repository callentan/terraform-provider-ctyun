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
  description = "Complete configurable shape for ctyun_security_group; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    name        = string
    project_id  = optional(string)
    region_id   = optional(string)
    vpc_id      = string
  })
}

resource "ctyun_security_group" "example" {
  description = var.config.description
  name        = var.config.name
  project_id  = var.config.project_id
  region_id   = var.config.region_id
  vpc_id      = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_security_group.example.create_time : string
# ctyun_security_group.example.id : string
