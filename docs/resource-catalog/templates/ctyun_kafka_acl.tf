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
  description = "Complete configurable shape for ctyun_kafka_acl; consult constraints before use."
  nullable    = false
  type = object({
    instance_id = string
    name        = string
    region_id   = optional(string)
    rules = set(object({
      ip         = optional(string)
      operation  = string
      permission = string
      user_name  = string
    }))
    use_new_topic = optional(bool)
  })
}

resource "ctyun_kafka_acl" "example" {
  instance_id   = var.config.instance_id
  name          = var.config.name
  region_id     = var.config.region_id
  rules         = var.config.rules
  use_new_topic = var.config.use_new_topic
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_acl.example.id : string
# ctyun_kafka_acl.example.topics : set(string)
