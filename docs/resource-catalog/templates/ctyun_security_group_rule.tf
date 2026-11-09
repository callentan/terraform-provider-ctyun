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
  description = "Complete configurable shape for ctyun_security_group_rule; consult constraints before use."
  nullable    = false
  type = object({
    action            = string
    description       = optional(string)
    dest_cidr_ip      = optional(string)
    direction         = string
    ether_type        = string
    priority          = optional(number)
    protocol          = string
    range             = optional(string)
    region_id         = optional(string)
    security_group_id = string
  })
}

resource "ctyun_security_group_rule" "example" {
  action            = var.config.action
  description       = var.config.description
  dest_cidr_ip      = var.config.dest_cidr_ip
  direction         = var.config.direction
  ether_type        = var.config.ether_type
  priority          = var.config.priority
  protocol          = var.config.protocol
  range             = var.config.range
  region_id         = var.config.region_id
  security_group_id = var.config.security_group_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_security_group_rule.example.id : string
