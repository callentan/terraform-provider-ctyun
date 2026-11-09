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
  description = "Complete configurable shape for ctyun_elb_listener; consult constraints before use."
  nullable    = false
  type = object({
    access_control_id     = optional(string)
    access_control_type   = optional(string)
    ca_enabled            = optional(bool)
    certificate_id        = optional(string)
    client_certificate_id = optional(string)
    default_action_type   = string
    description           = optional(string)
    enable_nat_64         = optional(bool)
    establish_timeout     = optional(number)
    forwarded_for_enabled = optional(bool)
    idle_timeout          = optional(number)
    listener_cps          = optional(number)
    listener_qps          = optional(number)
    loadbalancer_id       = string
    name                  = string
    project_id            = optional(string)
    protocol              = string
    protocol_port         = number
    redirect_listener_id  = optional(string)
    region_id             = optional(string)
    response_timeout      = optional(number)
    status                = optional(string)
    target_groups = optional(list(object({
      target_group_id = string
      weight          = optional(number)
    })))
  })
}

resource "ctyun_elb_listener" "example" {
  access_control_id     = var.config.access_control_id
  access_control_type   = var.config.access_control_type
  ca_enabled            = var.config.ca_enabled
  certificate_id        = var.config.certificate_id
  client_certificate_id = var.config.client_certificate_id
  default_action_type   = var.config.default_action_type
  description           = var.config.description
  enable_nat_64         = var.config.enable_nat_64
  establish_timeout     = var.config.establish_timeout
  forwarded_for_enabled = var.config.forwarded_for_enabled
  idle_timeout          = var.config.idle_timeout
  listener_cps          = var.config.listener_cps
  listener_qps          = var.config.listener_qps
  loadbalancer_id       = var.config.loadbalancer_id
  name                  = var.config.name
  project_id            = var.config.project_id
  protocol              = var.config.protocol
  protocol_port         = var.config.protocol_port
  redirect_listener_id  = var.config.redirect_listener_id
  region_id             = var.config.region_id
  response_timeout      = var.config.response_timeout
  status                = var.config.status
  target_groups         = var.config.target_groups
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_listener.example.create_time : string
# ctyun_elb_listener.example.id : string
# ctyun_elb_listener.example.update_time : string
