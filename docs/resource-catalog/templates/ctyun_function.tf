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
  description = "Complete configurable shape for ctyun_function; consult constraints before use."
  nullable    = false
  type = object({
    code_bucket                  = optional(string)
    code_content                 = optional(string)
    code_key                     = optional(string)
    code_version                 = optional(string)
    container_cpu                = optional(number)
    container_disk_size          = optional(number)
    container_fast_start         = optional(number)
    container_image              = optional(string)
    container_listen_port        = optional(number)
    container_max_scale          = optional(number)
    container_memory_size        = optional(number)
    container_run_command        = optional(string)
    container_time_zone          = optional(string)
    create_type                  = optional(number)
    description                  = optional(string)
    environment                  = optional(map(string))
    name                         = string
    region_id                    = optional(string)
    role                         = optional(string)
    runtime_execute_timeout      = optional(number)
    runtime_handle_type          = optional(string)
    runtime_handler              = string
    runtime_instance_concurrency = optional(number)
    runtime_runtime              = string
  })
}

resource "ctyun_function" "example" {
  code_bucket                  = var.config.code_bucket
  code_content                 = var.config.code_content
  code_key                     = var.config.code_key
  code_version                 = var.config.code_version
  container_cpu                = var.config.container_cpu
  container_disk_size          = var.config.container_disk_size
  container_fast_start         = var.config.container_fast_start
  container_image              = var.config.container_image
  container_listen_port        = var.config.container_listen_port
  container_max_scale          = var.config.container_max_scale
  container_memory_size        = var.config.container_memory_size
  container_run_command        = var.config.container_run_command
  container_time_zone          = var.config.container_time_zone
  create_type                  = var.config.create_type
  description                  = var.config.description
  environment                  = var.config.environment
  name                         = var.config.name
  region_id                    = var.config.region_id
  role                         = var.config.role
  runtime_execute_timeout      = var.config.runtime_execute_timeout
  runtime_handle_type          = var.config.runtime_handle_type
  runtime_handler              = var.config.runtime_handler
  runtime_instance_concurrency = var.config.runtime_instance_concurrency
  runtime_runtime              = var.config.runtime_runtime
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function.example.created_at : string
# ctyun_function.example.function_id : string
# ctyun_function.example.id : string
# ctyun_function.example.status : string
# ctyun_function.example.updated_at : string
