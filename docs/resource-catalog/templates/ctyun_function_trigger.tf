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
  description = "Complete configurable shape for ctyun_function_trigger; consult constraints before use."
  nullable    = false
  type = object({
    enable        = optional(bool)
    event_data    = string
    function_name = string
    region_id     = optional(string)
    trigger_name  = string
    trigger_type  = string
    version       = optional(string)
  })
}

resource "ctyun_function_trigger" "example" {
  enable        = var.config.enable
  event_data    = var.config.event_data
  function_name = var.config.function_name
  region_id     = var.config.region_id
  trigger_name  = var.config.trigger_name
  trigger_type  = var.config.trigger_type
  version       = var.config.version
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function_trigger.example.created_at : string
# ctyun_function_trigger.example.id : string
# ctyun_function_trigger.example.status : number
# ctyun_function_trigger.example.updated_at : string
