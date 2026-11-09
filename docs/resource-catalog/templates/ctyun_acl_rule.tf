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
  description = "Complete configurable shape for ctyun_acl_rule; consult constraints before use."
  nullable    = false
  type = object({
    acl_id                 = string
    action                 = string
    description            = optional(string)
    destination_ip_address = string
    destination_port       = optional(string)
    direction              = string
    enabled                = optional(bool)
    ip_version             = string
    priority               = optional(number)
    project_id             = optional(string)
    protocol               = string
    region_id              = optional(string)
    source_ip_address      = string
    source_port            = optional(string)
  })
}

resource "ctyun_acl_rule" "example" {
  acl_id                 = var.config.acl_id
  action                 = var.config.action
  description            = var.config.description
  destination_ip_address = var.config.destination_ip_address
  destination_port       = var.config.destination_port
  direction              = var.config.direction
  enabled                = var.config.enabled
  ip_version             = var.config.ip_version
  priority               = var.config.priority
  project_id             = var.config.project_id
  protocol               = var.config.protocol
  region_id              = var.config.region_id
  source_ip_address      = var.config.source_ip_address
  source_port            = var.config.source_port
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_acl_rule.example.id : string
