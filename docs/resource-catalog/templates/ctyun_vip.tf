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
  description = "Complete configurable shape for ctyun_vip; consult constraints before use."
  nullable    = false
  type = object({
    ip_address = optional(string)
    project_id = optional(string)
    region_id  = optional(string)
    subnet_id  = string
    vip_type   = optional(string)
    vpc_id     = optional(string)
  })
}

resource "ctyun_vip" "example" {
  ip_address = var.config.ip_address
  project_id = var.config.project_id
  region_id  = var.config.region_id
  subnet_id  = var.config.subnet_id
  vip_type   = var.config.vip_type
  vpc_id     = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vip.example.id : string
# ctyun_vip.example.ipv4_address : string
# ctyun_vip.example.ipv6_address : string
