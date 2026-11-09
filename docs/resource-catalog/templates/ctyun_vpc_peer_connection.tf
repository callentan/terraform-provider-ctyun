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
  description = "Complete configurable shape for ctyun_vpc_peer_connection; consult constraints before use."
  nullable    = false
  type = object({
    accept_email   = optional(string)
    accept_vpc_id  = string
    description    = optional(string)
    name           = string
    project_id     = optional(string)
    region_id      = optional(string)
    request_vpc_id = string
    tags = optional(set(object({
      key   = string
      value = string
    })))
  })
}

resource "ctyun_vpc_peer_connection" "example" {
  accept_email   = var.config.accept_email
  accept_vpc_id  = var.config.accept_vpc_id
  description    = var.config.description
  name           = var.config.name
  project_id     = var.config.project_id
  region_id      = var.config.region_id
  request_vpc_id = var.config.request_vpc_id
  tags           = var.config.tags
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc_peer_connection.example.accept_vpc_cidr : string
# ctyun_vpc_peer_connection.example.accept_vpc_name : string
# ctyun_vpc_peer_connection.example.id : string
# ctyun_vpc_peer_connection.example.instance_id : string
# ctyun_vpc_peer_connection.example.request_vpc_cidr : string
# ctyun_vpc_peer_connection.example.request_vpc_name : string
# ctyun_vpc_peer_connection.example.status : string
# ctyun_vpc_peer_connection.example.tags[*].id : string
# ctyun_vpc_peer_connection.example.user_type : string
