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
  description = "Complete configurable shape for ctyun_cloud_assistant_command; consult constraints before use."
  nullable    = false
  type = object({
    command_content   = string
    command_name      = string
    command_type      = string
    description       = optional(string)
    enabled_parameter = optional(bool)
    parameter         = optional(map(string))
    region_id         = optional(string)
    timeout           = optional(number)
    working_directory = optional(string)
  })
}

resource "ctyun_cloud_assistant_command" "example" {
  command_content   = var.config.command_content
  command_name      = var.config.command_name
  command_type      = var.config.command_type
  description       = var.config.description
  enabled_parameter = var.config.enabled_parameter
  parameter         = var.config.parameter
  region_id         = var.config.region_id
  timeout           = var.config.timeout
  working_directory = var.config.working_directory
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_cloud_assistant_command.example.create_time : string
# ctyun_cloud_assistant_command.example.id : string
# ctyun_cloud_assistant_command.example.update_time : string
