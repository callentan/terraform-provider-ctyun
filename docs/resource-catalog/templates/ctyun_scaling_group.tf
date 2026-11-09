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
  description = "Complete configurable shape for ctyun_scaling_group; consult constraints before use."
  nullable    = false
  type = object({
    add_instance_uuid_list = optional(set(string))
    az_strategy            = string
    config_list            = optional(set(number))
    delete_protection      = optional(string)
    expected_count         = optional(number)
    health_mode            = string
    health_period          = number
    is_destroy             = optional(bool)
    lb_list = optional(list(object({
      host_group_id = string
      lb_id         = string
      port          = number
      weight        = number
    })))
    max_count                 = number
    min_count                 = number
    move_out_strategy         = string
    name                      = string
    project_id                = optional(string)
    region_id                 = optional(string)
    remove_instance_uuid_list = optional(set(string))
    security_group_id_list    = optional(set(string))
    status                    = optional(string)
    subnet_id_list            = set(string)
    use_lb                    = number
    vpc_id                    = string
  })
}

resource "ctyun_scaling_group" "example" {
  add_instance_uuid_list    = var.config.add_instance_uuid_list
  az_strategy               = var.config.az_strategy
  config_list               = var.config.config_list
  delete_protection         = var.config.delete_protection
  expected_count            = var.config.expected_count
  health_mode               = var.config.health_mode
  health_period             = var.config.health_period
  is_destroy                = var.config.is_destroy
  lb_list                   = var.config.lb_list
  max_count                 = var.config.max_count
  min_count                 = var.config.min_count
  move_out_strategy         = var.config.move_out_strategy
  name                      = var.config.name
  project_id                = var.config.project_id
  region_id                 = var.config.region_id
  remove_instance_uuid_list = var.config.remove_instance_uuid_list
  security_group_id_list    = var.config.security_group_id_list
  status                    = var.config.status
  subnet_id_list            = var.config.subnet_id_list
  use_lb                    = var.config.use_lb
  vpc_id                    = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_scaling_group.example.actual_count : number
# ctyun_scaling_group.example.id : number
# ctyun_scaling_group.example.real_count : number
