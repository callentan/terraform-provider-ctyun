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
  description = "Complete configurable shape for ctyun_kafka_consumer_group; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    instance_id = string
    name        = string
    region_id   = optional(string)
    reset_config = optional(object({
      partition_shift_list = optional(list(object({
        partition = optional(number)
        shift_by  = optional(number)
      })))
      timestamp  = optional(number)
      topic_name = string
      type       = number
    }))
  })
}

resource "ctyun_kafka_consumer_group" "example" {
  description  = var.config.description
  instance_id  = var.config.instance_id
  name         = var.config.name
  region_id    = var.config.region_id
  reset_config = var.config.reset_config
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_consumer_group.example.coordinator_id : number
# ctyun_kafka_consumer_group.example.create_time : string
# ctyun_kafka_consumer_group.example.id : number
# ctyun_kafka_consumer_group.example.state : string
