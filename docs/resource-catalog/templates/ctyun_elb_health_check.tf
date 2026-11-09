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
  description = "Complete configurable shape for ctyun_elb_health_check; consult constraints before use."
  nullable    = false
  type = object({
    description         = optional(string)
    http_expected_codes = optional(set(string))
    http_method         = optional(string)
    http_url_path       = optional(string)
    interval            = optional(number)
    max_retry           = optional(number)
    name                = string
    project_id          = optional(string)
    protocol            = string
    protocol_port       = optional(number)
    region_id           = optional(string)
    timeout             = optional(number)
  })
}

resource "ctyun_elb_health_check" "example" {
  description         = var.config.description
  http_expected_codes = var.config.http_expected_codes
  http_method         = var.config.http_method
  http_url_path       = var.config.http_url_path
  interval            = var.config.interval
  max_retry           = var.config.max_retry
  name                = var.config.name
  project_id          = var.config.project_id
  protocol            = var.config.protocol
  protocol_port       = var.config.protocol_port
  region_id           = var.config.region_id
  timeout             = var.config.timeout
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_health_check.example.create_time : string
# ctyun_elb_health_check.example.id : string
# ctyun_elb_health_check.example.status : number
