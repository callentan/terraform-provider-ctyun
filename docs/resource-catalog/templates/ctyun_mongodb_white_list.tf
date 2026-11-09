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
  description = "Complete configurable shape for ctyun_mongodb_white_list; consult constraints before use."
  nullable    = false
  type = object({
    group_name      = string
    instance_id     = string
    ip_list         = set(string)
    ip_type         = string
    project_id      = optional(string)
    region_id       = optional(string)
    white_list_type = string
  })
}

resource "ctyun_mongodb_white_list" "example" {
  group_name      = var.config.group_name
  instance_id     = var.config.instance_id
  ip_list         = var.config.ip_list
  ip_type         = var.config.ip_type
  project_id      = var.config.project_id
  region_id       = var.config.region_id
  white_list_type = var.config.white_list_type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mongodb_white_list.example.id : string
# ctyun_mongodb_white_list.example.white_list_id : number
