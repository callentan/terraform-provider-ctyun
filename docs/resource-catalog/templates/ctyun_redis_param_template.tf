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
  description = "Complete configurable shape for ctyun_redis_param_template; consult constraints before use."
  nullable    = false
  type = object({
    cache_mode  = string
    description = optional(string)
    name        = string
    params = optional(set(object({
      current_value = string
      param_name    = string
    })))
    region_id    = optional(string)
    sys_template = optional(bool)
  })
}

resource "ctyun_redis_param_template" "example" {
  cache_mode   = var.config.cache_mode
  description  = var.config.description
  name         = var.config.name
  params       = var.config.params
  region_id    = var.config.region_id
  sys_template = var.config.sys_template
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_redis_param_template.example.id : string
# ctyun_redis_param_template.example.params_return : set(object)
# ctyun_redis_param_template.example.params_return[*].current_value : string
# ctyun_redis_param_template.example.params_return[*].default_value : string
# ctyun_redis_param_template.example.params_return[*].description : string
# ctyun_redis_param_template.example.params_return[*].need_restart : bool
# ctyun_redis_param_template.example.params_return[*].param_name : string
# ctyun_redis_param_template.example.params_return[*].value_range : string
