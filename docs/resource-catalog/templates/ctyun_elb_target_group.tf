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
  description = "Complete configurable shape for ctyun_elb_target_group; consult constraints before use."
  nullable    = false
  type = object({
    algorithm           = string
    cookie_expire       = optional(number)
    description         = optional(string)
    health_check_id     = optional(string)
    name                = string
    project_id          = optional(string)
    protocol            = optional(string)
    proxy_protocol      = optional(number)
    region_id           = optional(string)
    rewrite_cookie_name = optional(string)
    session_sticky_mode = optional(string)
    source_ip_timeout   = optional(number)
    vpc_id              = string
  })
}

resource "ctyun_elb_target_group" "example" {
  algorithm           = var.config.algorithm
  cookie_expire       = var.config.cookie_expire
  description         = var.config.description
  health_check_id     = var.config.health_check_id
  name                = var.config.name
  project_id          = var.config.project_id
  protocol            = var.config.protocol
  proxy_protocol      = var.config.proxy_protocol
  region_id           = var.config.region_id
  rewrite_cookie_name = var.config.rewrite_cookie_name
  session_sticky_mode = var.config.session_sticky_mode
  source_ip_timeout   = var.config.source_ip_timeout
  vpc_id              = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_target_group.example.create_time : string
# ctyun_elb_target_group.example.id : string
# ctyun_elb_target_group.example.status : string
# ctyun_elb_target_group.example.update_time : string
