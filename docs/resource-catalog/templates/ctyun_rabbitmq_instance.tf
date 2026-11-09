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
  description = "Complete configurable shape for ctyun_rabbitmq_instance; consult constraints before use."
  nullable    = false
  type = object({
    cycle_count       = optional(number)
    cycle_type        = string
    disk_size         = number
    disk_type         = string
    instance_name     = string
    node_num          = number
    project_id        = optional(string)
    region_id         = optional(string)
    security_group_id = string
    spec_name         = string
    subnet_id         = optional(string)
    vpc_id            = string
    zone_list         = set(string)
  })
}

resource "ctyun_rabbitmq_instance" "example" {
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  disk_size         = var.config.disk_size
  disk_type         = var.config.disk_type
  instance_name     = var.config.instance_name
  node_num          = var.config.node_num
  project_id        = var.config.project_id
  region_id         = var.config.region_id
  security_group_id = var.config.security_group_id
  spec_name         = var.config.spec_name
  subnet_id         = var.config.subnet_id
  vpc_id            = var.config.vpc_id
  zone_list         = var.config.zone_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_rabbitmq_instance.example.actual_cycle_type : string
# ctyun_rabbitmq_instance.example.create_time : string
# ctyun_rabbitmq_instance.example.endpoint : string
# ctyun_rabbitmq_instance.example.expire_time : string
# ctyun_rabbitmq_instance.example.id : string
# ctyun_rabbitmq_instance.example.master_order_id : string
# ctyun_rabbitmq_instance.example.name : string
# ctyun_rabbitmq_instance.example.ssl_endpoint : string
