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
  description = "Complete configurable shape for ctyun_postgresql_param_template; consult constraints before use."
  nullable    = false
  type = object({
    description         = optional(string)
    name                = string
    project_id          = optional(string)
    region_id           = optional(string)
    source_template_id  = optional(number)
    template_parameters = optional(map(string))
  })
}

resource "ctyun_postgresql_param_template" "example" {
  description         = var.config.description
  name                = var.config.name
  project_id          = var.config.project_id
  region_id           = var.config.region_id
  source_template_id  = var.config.source_template_id
  template_parameters = var.config.template_parameters
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_param_template.example.id : number
