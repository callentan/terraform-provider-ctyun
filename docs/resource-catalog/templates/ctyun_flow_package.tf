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
  description = "Complete configurable shape for ctyun_flow_package; consult constraints before use."
  nullable    = false
  type = object({
    cycle_type = string
    region_id  = optional(string)
    spec       = number
  })
}

resource "ctyun_flow_package" "example" {
  cycle_type = var.config.cycle_type
  region_id  = var.config.region_id
  spec       = var.config.spec
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_flow_package.example.effective_time : string
# ctyun_flow_package.example.expire_time : string
# ctyun_flow_package.example.id : string
# ctyun_flow_package.example.left_volume : number
# ctyun_flow_package.example.master_resource_id : string
# ctyun_flow_package.example.package_name : string
# ctyun_flow_package.example.total_volume : number
