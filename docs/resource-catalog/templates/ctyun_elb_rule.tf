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
  description = "Complete configurable shape for ctyun_elb_rule; consult constraints before use."
  nullable    = false
  type = object({
    action_redirect_listener_id = optional(string)
    action_target_groups = optional(list(object({
      target_group_id = string
      weight          = optional(number)
    })))
    action_type = string
    conditions = list(object({
      condition_match_type  = optional(string)
      condition_server_name = optional(string)
      condition_type        = string
      condition_url_paths   = optional(string)
    }))
    description = optional(string)
    listener_id = string
    project_id  = optional(string)
    region_id   = optional(string)
  })
}

resource "ctyun_elb_rule" "example" {
  action_redirect_listener_id = var.config.action_redirect_listener_id
  action_target_groups        = var.config.action_target_groups
  action_type                 = var.config.action_type
  conditions                  = var.config.conditions
  description                 = var.config.description
  listener_id                 = var.config.listener_id
  project_id                  = var.config.project_id
  region_id                   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_rule.example.create_time : string
# ctyun_elb_rule.example.id : string
# ctyun_elb_rule.example.load_balancer_id : string
# ctyun_elb_rule.example.status : string
# ctyun_elb_rule.example.update_time : string
