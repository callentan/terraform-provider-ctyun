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
  description = "Complete configurable shape for ctyun_kafka_instance; consult constraints before use."
  nullable    = false
  type = object({
    auto_renew             = optional(bool)
    auto_renew_cycle_count = optional(number)
    cycle_count            = optional(number)
    cycle_type             = string
    disk_size              = number
    disk_type              = string
    enable_ipv6            = optional(bool)
    engine_version         = optional(string)
    http_port              = optional(number)
    instance_name          = string
    node_num               = number
    plain_port             = optional(number)
    project_id             = optional(string)
    region_id              = optional(string)
    restart                = optional(bool)
    retention_hours        = optional(number)
    sasl_port              = optional(number)
    security_group_id      = string
    spec_name              = string
    ssl_port               = optional(number)
    subnet_id              = string
    vpc_id                 = string
    zone_list              = set(string)
  })
}

resource "ctyun_kafka_instance" "example" {
  auto_renew             = var.config.auto_renew
  auto_renew_cycle_count = var.config.auto_renew_cycle_count
  cycle_count            = var.config.cycle_count
  cycle_type             = var.config.cycle_type
  disk_size              = var.config.disk_size
  disk_type              = var.config.disk_type
  enable_ipv6            = var.config.enable_ipv6
  engine_version         = var.config.engine_version
  http_port              = var.config.http_port
  instance_name          = var.config.instance_name
  node_num               = var.config.node_num
  plain_port             = var.config.plain_port
  project_id             = var.config.project_id
  region_id              = var.config.region_id
  restart                = var.config.restart
  retention_hours        = var.config.retention_hours
  sasl_port              = var.config.sasl_port
  security_group_id      = var.config.security_group_id
  spec_name              = var.config.spec_name
  ssl_port               = var.config.ssl_port
  subnet_id              = var.config.subnet_id
  vpc_id                 = var.config.vpc_id
  zone_list              = var.config.zone_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_instance.example.actual_cycle_type : string
# ctyun_kafka_instance.example.create_time : string
# ctyun_kafka_instance.example.expire_time : string
# ctyun_kafka_instance.example.id : string
# ctyun_kafka_instance.example.last_restart_time : string
# ctyun_kafka_instance.example.master_order_id : string
# ctyun_kafka_instance.example.name : string
