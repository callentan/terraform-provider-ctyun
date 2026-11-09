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
  description = "Complete configurable shape for ctyun_sfs; consult constraints before use."
  nullable    = false
  type = object({
    az_name     = optional(string)
    cycle_count = optional(number)
    cycle_type  = string
    is_encrypt  = optional(bool)
    kms_uuid    = optional(string)
    name        = string
    project_id  = optional(string)
    protocol    = string
    region_id   = optional(string)
    size        = number
    subnet_id   = optional(string)
    type        = string
    vpc_id      = optional(string)
  })
}

resource "ctyun_sfs" "example" {
  az_name     = var.config.az_name
  cycle_count = var.config.cycle_count
  cycle_type  = var.config.cycle_type
  is_encrypt  = var.config.is_encrypt
  kms_uuid    = var.config.kms_uuid
  name        = var.config.name
  project_id  = var.config.project_id
  protocol    = var.config.protocol
  region_id   = var.config.region_id
  size        = var.config.size
  subnet_id   = var.config.subnet_id
  type        = var.config.type
  vpc_id      = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_sfs.example.create_time : string
# ctyun_sfs.example.expire_time : string
# ctyun_sfs.example.id : string
# ctyun_sfs.example.share_path : string
# ctyun_sfs.example.share_path_windows : string
# ctyun_sfs.example.status : string
# ctyun_sfs.example.update_time : string
# ctyun_sfs.example.used_size : number
