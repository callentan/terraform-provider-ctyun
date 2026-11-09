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
  description = "Complete configurable shape for ctyun_net_tags; consult constraints before use."
  nullable    = false
  type = object({
    region_id     = optional(string)
    resource_id   = string
    resource_type = string
    tags = optional(set(object({
      key   = string
      value = string
    })))
  })
}

resource "ctyun_net_tags" "example" {
  region_id     = var.config.region_id
  resource_id   = var.config.resource_id
  resource_type = var.config.resource_type
  tags          = var.config.tags
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_net_tags.example.id : string
# ctyun_net_tags.example.tags[*].id : string
