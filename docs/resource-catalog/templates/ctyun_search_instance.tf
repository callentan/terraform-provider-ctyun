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
  description = "Complete configurable shape for ctyun_search_instance; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    cluster_type = number
    cycle_count  = optional(number)
    cycle_type   = string
    enable_https = optional(string)
    enable_ipv6  = bool
    name         = string
    node_details = set(object({
      flavor_name     = string
      host_num        = number
      node_group_type = string
      storage_space   = number
      storage_type    = string
    }))
    os_type           = string
    password          = optional(string)
    region_id         = optional(string)
    security_group_id = string
    subnet_id         = string
    vpc_id            = string
    zone_list         = set(string)
  })
}

resource "ctyun_search_instance" "example" {
  cluster_type      = var.config.cluster_type
  cycle_count       = var.config.cycle_count
  cycle_type        = var.config.cycle_type
  enable_https      = var.config.enable_https
  enable_ipv6       = var.config.enable_ipv6
  name              = var.config.name
  node_details      = var.config.node_details
  os_type           = var.config.os_type
  password          = var.config.password
  region_id         = var.config.region_id
  security_group_id = var.config.security_group_id
  subnet_id         = var.config.subnet_id
  vpc_id            = var.config.vpc_id
  zone_list         = var.config.zone_list
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_search_instance.example.id : string
# ctyun_search_instance.example.status : string
# ctyun_search_instance.example.version : string
