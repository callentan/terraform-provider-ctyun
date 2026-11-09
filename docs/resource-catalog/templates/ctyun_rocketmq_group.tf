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
  description = "Complete configurable shape for ctyun_rocketmq_group; consult constraints before use."
  nullable    = false
  type = object({
    broker_names             = set(string)
    consume_broadcast_enable = optional(bool)
    consume_enable           = optional(bool)
    first_consume_mechanism  = optional(number)
    instance_id              = string
    name                     = string
    pull_mechanism           = optional(number)
    region_id                = optional(string)
    remark                   = optional(string)
    retry_max_times          = optional(number)
  })
}

resource "ctyun_rocketmq_group" "example" {
  broker_names             = var.config.broker_names
  consume_broadcast_enable = var.config.consume_broadcast_enable
  consume_enable           = var.config.consume_enable
  first_consume_mechanism  = var.config.first_consume_mechanism
  instance_id              = var.config.instance_id
  name                     = var.config.name
  pull_mechanism           = var.config.pull_mechanism
  region_id                = var.config.region_id
  remark                   = var.config.remark
  retry_max_times          = var.config.retry_max_times
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rocketmq_group.example.id : string
