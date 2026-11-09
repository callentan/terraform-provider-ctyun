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
  description = "Complete configurable shape for ctyun_ccse_namespace; consult constraints before use."
  nullable    = false
  type = object({
    cluster_id  = string
    region_id   = optional(string)
    values_yaml = optional(string)
  })
}

resource "ctyun_ccse_namespace" "example" {
  cluster_id  = var.config.cluster_id
  region_id   = var.config.region_id
  values_yaml = var.config.values_yaml
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_namespace.example.actual_config : string
# ctyun_ccse_namespace.example.id : string
# ctyun_ccse_namespace.example.namespace : string
