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
  description = "Complete configurable shape for ctyun_scaling_policy; consult constraints before use."
  nullable    = false
  type = object({
    action                            = optional(string)
    cooldown                          = optional(number)
    cycle                             = optional(string)
    day                               = optional(set(number))
    effective_from                    = optional(string)
    effective_till                    = optional(string)
    execution_time                    = optional(string)
    group_id                          = number
    is_execute                        = optional(bool)
    name                              = string
    operate_count                     = optional(number)
    operate_unit                      = optional(string)
    policy_type                       = string
    region_id                         = optional(string)
    status                            = optional(string)
    target_disable_scale_in           = optional(bool)
    target_metric_name                = optional(string)
    target_operate_range              = optional(number)
    target_scale_in_evaluation_count  = optional(number)
    target_scale_out_evaluation_count = optional(number)
    target_value                      = optional(number)
    trigger_comparison_operator       = optional(string)
    trigger_evaluation_count          = optional(number)
    trigger_metric_name               = optional(string)
    trigger_name                      = optional(string)
    trigger_period                    = optional(string)
    trigger_statistics                = optional(string)
    trigger_threshold                 = optional(number)
  })
}

resource "ctyun_scaling_policy" "example" {
  action                            = var.config.action
  cooldown                          = var.config.cooldown
  cycle                             = var.config.cycle
  day                               = var.config.day
  effective_from                    = var.config.effective_from
  effective_till                    = var.config.effective_till
  execution_time                    = var.config.execution_time
  group_id                          = var.config.group_id
  is_execute                        = var.config.is_execute
  name                              = var.config.name
  operate_count                     = var.config.operate_count
  operate_unit                      = var.config.operate_unit
  policy_type                       = var.config.policy_type
  region_id                         = var.config.region_id
  status                            = var.config.status
  target_disable_scale_in           = var.config.target_disable_scale_in
  target_metric_name                = var.config.target_metric_name
  target_operate_range              = var.config.target_operate_range
  target_scale_in_evaluation_count  = var.config.target_scale_in_evaluation_count
  target_scale_out_evaluation_count = var.config.target_scale_out_evaluation_count
  target_value                      = var.config.target_value
  trigger_comparison_operator       = var.config.trigger_comparison_operator
  trigger_evaluation_count          = var.config.trigger_evaluation_count
  trigger_metric_name               = var.config.trigger_metric_name
  trigger_name                      = var.config.trigger_name
  trigger_period                    = var.config.trigger_period
  trigger_statistics                = var.config.trigger_statistics
  trigger_threshold                 = var.config.trigger_threshold
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_scaling_policy.example.id : number
