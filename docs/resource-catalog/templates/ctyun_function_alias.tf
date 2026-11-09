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
  description = "Complete configurable shape for ctyun_function_alias; consult constraints before use."
  nullable    = false
  type = object({
    alias_name      = string
    description     = optional(string)
    function_name   = string
    gray_version_id = optional(string)
    gray_weight     = optional(number)
    region_id       = optional(string)
    version_id      = string
  })
}

resource "ctyun_function_alias" "example" {
  alias_name      = var.config.alias_name
  description     = var.config.description
  function_name   = var.config.function_name
  gray_version_id = var.config.gray_version_id
  gray_weight     = var.config.gray_weight
  region_id       = var.config.region_id
  version_id      = var.config.version_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function_alias.example.create_time : string
# ctyun_function_alias.example.id : string
