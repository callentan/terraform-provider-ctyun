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
  description = "Complete configurable shape for ctyun_kafka_topic; consult constraints before use."
  nullable    = false
  type = object({
    cleanup_policy                 = optional(string)
    description                    = optional(string)
    factor_num                     = optional(number)
    instance_id                    = string
    local_retention_ms             = optional(number)
    max_message                    = optional(number)
    min_replicas                   = optional(number)
    name                           = string
    need_flush                     = optional(bool)
    partition_capacity             = optional(number)
    partition_num                  = number
    region_id                      = optional(string)
    remote_storage_enable          = optional(bool)
    retention_time                 = optional(number)
    segment_bytes                  = optional(number)
    segment_ms                     = optional(number)
    timestamp_type                 = optional(string)
    unclean_leader_election_enable = optional(bool)
  })
}

resource "ctyun_kafka_topic" "example" {
  cleanup_policy                 = var.config.cleanup_policy
  description                    = var.config.description
  factor_num                     = var.config.factor_num
  instance_id                    = var.config.instance_id
  local_retention_ms             = var.config.local_retention_ms
  max_message                    = var.config.max_message
  min_replicas                   = var.config.min_replicas
  name                           = var.config.name
  need_flush                     = var.config.need_flush
  partition_capacity             = var.config.partition_capacity
  partition_num                  = var.config.partition_num
  region_id                      = var.config.region_id
  remote_storage_enable          = var.config.remote_storage_enable
  retention_time                 = var.config.retention_time
  segment_bytes                  = var.config.segment_bytes
  segment_ms                     = var.config.segment_ms
  timestamp_type                 = var.config.timestamp_type
  unclean_leader_election_enable = var.config.unclean_leader_election_enable
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_kafka_topic.example.group_subscribed : list(string)
# ctyun_kafka_topic.example.id : string
# ctyun_kafka_topic.example.partition_list : list(object)
# ctyun_kafka_topic.example.partition_list[*].offsets : object
# ctyun_kafka_topic.example.partition_list[*].offsets.begin : number
# ctyun_kafka_topic.example.partition_list[*].offsets.end : number
# ctyun_kafka_topic.example.partition_list[*].offsets.hw : number
# ctyun_kafka_topic.example.partition_list[*].offsets.total : number
# ctyun_kafka_topic.example.partition_list[*].offsets.update_timestamp : number
# ctyun_kafka_topic.example.partition_list[*].partition_id : number
# ctyun_kafka_topic.example.partition_list[*].replicas : list(object)
# ctyun_kafka_topic.example.partition_list[*].replicas[*].broker_id : number
# ctyun_kafka_topic.example.partition_list[*].replicas[*].in_sync : bool
# ctyun_kafka_topic.example.partition_list[*].replicas[*].is_leader : bool
# ctyun_kafka_topic.example.partition_list[*].replicas[*].lag : number
# ctyun_kafka_topic.example.partition_list[*].replicas[*].size : number
# ctyun_kafka_topic.example.partition_list[*].topic_name : string
