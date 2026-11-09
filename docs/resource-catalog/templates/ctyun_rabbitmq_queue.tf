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
  description = "Complete configurable shape for ctyun_rabbitmq_queue; consult constraints before use."
  nullable    = false
  type = object({
    auto_delete               = optional(bool)
    durable                   = optional(bool)
    instance_id               = string
    name                      = string
    region_id                 = optional(string)
    vhost                     = string
    x_dead_letter_exchange    = optional(string)
    x_dead_letter_routing_key = optional(string)
    x_expires                 = optional(number)
    x_max_length              = optional(number)
    x_max_length_bytes        = optional(number)
    x_max_priority            = optional(number)
    x_message_ttl             = optional(number)
    x_overflow                = optional(string)
    x_queue_mode              = optional(string)
  })
}

resource "ctyun_rabbitmq_queue" "example" {
  auto_delete               = var.config.auto_delete
  durable                   = var.config.durable
  instance_id               = var.config.instance_id
  name                      = var.config.name
  region_id                 = var.config.region_id
  vhost                     = var.config.vhost
  x_dead_letter_exchange    = var.config.x_dead_letter_exchange
  x_dead_letter_routing_key = var.config.x_dead_letter_routing_key
  x_expires                 = var.config.x_expires
  x_max_length              = var.config.x_max_length
  x_max_length_bytes        = var.config.x_max_length_bytes
  x_max_priority            = var.config.x_max_priority
  x_message_ttl             = var.config.x_message_ttl
  x_overflow                = var.config.x_overflow
  x_queue_mode              = var.config.x_queue_mode
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rabbitmq_queue.example.id : string
