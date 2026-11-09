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
  description = "Complete configurable shape for ctyun_eip; consult constraints before use."
  nullable    = false
  type = object({
    bandwidth           = number
    cycle_count         = optional(number)
    cycle_type          = string
    demand_billing_type = optional(string)
    name                = string
    project_id          = optional(string)
    region_id           = optional(string)
  })
}

resource "ctyun_eip" "example" {
  bandwidth           = var.config.bandwidth
  cycle_count         = var.config.cycle_count
  cycle_type          = var.config.cycle_type
  demand_billing_type = var.config.demand_billing_type
  name                = var.config.name
  project_id          = var.config.project_id
  region_id           = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_eip.example.address : string
# ctyun_eip.example.bandwidth_type : string
# ctyun_eip.example.create_time : string
# ctyun_eip.example.current_bandwidth : number
# ctyun_eip.example.expire_time : string
# ctyun_eip.example.id : string
# ctyun_eip.example.master_order_id : string
# ctyun_eip.example.status : string
# ctyun_eip.example.update_time : string
