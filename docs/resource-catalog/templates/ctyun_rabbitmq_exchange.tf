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
  description = "Complete configurable shape for ctyun_rabbitmq_exchange; consult constraints before use."
  nullable    = false
  type = object({
    alternate_exchange = optional(string)
    auto_delete        = optional(bool)
    durable            = optional(bool)
    instance_id        = string
    internal           = optional(bool)
    name               = string
    region_id          = optional(string)
    type               = string
    vhost              = string
    x_delayed_type     = optional(string)
  })
}

resource "ctyun_rabbitmq_exchange" "example" {
  alternate_exchange = var.config.alternate_exchange
  auto_delete        = var.config.auto_delete
  durable            = var.config.durable
  instance_id        = var.config.instance_id
  internal           = var.config.internal
  name               = var.config.name
  region_id          = var.config.region_id
  type               = var.config.type
  vhost              = var.config.vhost
  x_delayed_type     = var.config.x_delayed_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rabbitmq_exchange.example.id : string
