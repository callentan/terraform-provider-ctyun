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
  description = "Complete configurable shape for ctyun_vpc; consult constraints before use."
  nullable    = false
  type = object({
    cidr        = string
    description = optional(string)
    enable_dns  = optional(bool)
    enable_ipv6 = optional(bool)
    name        = string
    project_id  = optional(string)
    region_id   = optional(string)
  })
}

resource "ctyun_vpc" "example" {
  cidr        = var.config.cidr
  description = var.config.description
  enable_dns  = var.config.enable_dns
  enable_ipv6 = var.config.enable_ipv6
  name        = var.config.name
  project_id  = var.config.project_id
  region_id   = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_vpc.example.id : string
