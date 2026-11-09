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
  description = "Complete configurable shape for ctyun_mysql_rds_parameter_template; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    parameters  = optional(map(string))
    project_id  = optional(string)
    region_id   = optional(string)
    template_id = optional(number)
  })
}

resource "ctyun_mysql_rds_parameter_template" "example" {
  instance_id = var.config.instance_id
  parameters  = var.config.parameters
  project_id  = var.config.project_id
  region_id   = var.config.region_id
  template_id = var.config.template_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_rds_parameter_template.example.id : string
