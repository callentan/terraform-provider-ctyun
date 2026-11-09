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
  description = "Complete configurable shape for ctyun_cloud_assistant_run_command; consult constraints before use."
  nullable    = false
  type = object({
    command_content   = optional(string)
    command_name      = optional(string)
    command_type      = optional(string)
    description       = optional(string)
    enabled_parameter = optional(bool)
    instance_ids      = string
    parameter         = optional(map(string))
    region_id         = optional(string)
    save_command      = optional(bool)
    timeout           = optional(number)
    working_directory = optional(string)
  })
}

resource "ctyun_cloud_assistant_run_command" "example" {
  command_content   = var.config.command_content
  command_name      = var.config.command_name
  command_type      = var.config.command_type
  description       = var.config.description
  enabled_parameter = var.config.enabled_parameter
  instance_ids      = var.config.instance_ids
  parameter         = var.config.parameter
  region_id         = var.config.region_id
  save_command      = var.config.save_command
  timeout           = var.config.timeout
  working_directory = var.config.working_directory
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_cloud_assistant_run_command.example.id : string
# ctyun_cloud_assistant_run_command.example.results : list(object)
# ctyun_cloud_assistant_run_command.example.results[*].create_time : string
# ctyun_cloud_assistant_run_command.example.results[*].error_info : string
# ctyun_cloud_assistant_run_command.example.results[*].exit_code : number
# ctyun_cloud_assistant_run_command.example.results[*].instance_id : string
# ctyun_cloud_assistant_run_command.example.results[*].invocation_status : string
# ctyun_cloud_assistant_run_command.example.results[*].output : string
# ctyun_cloud_assistant_run_command.example.results[*].update_time : string
