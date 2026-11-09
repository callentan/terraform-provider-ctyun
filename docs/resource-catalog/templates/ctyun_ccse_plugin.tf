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
  description = "Complete configurable shape for ctyun_ccse_plugin; consult constraints before use."
  nullable    = false
  type = object({
    chart_name    = string
    chart_version = string
    cluster_id    = string
    region_id     = optional(string)
    values_json   = optional(string)
    values_yaml   = optional(string)
  })
}

resource "ctyun_ccse_plugin" "example" {
  chart_name    = var.config.chart_name
  chart_version = var.config.chart_version
  cluster_id    = var.config.cluster_id
  region_id     = var.config.region_id
  values_json   = var.config.values_json
  values_yaml   = var.config.values_yaml
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_plugin.example.id : string
# ctyun_ccse_plugin.example.namespace : string
