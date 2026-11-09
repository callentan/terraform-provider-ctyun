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
  description = "Complete configurable shape for ctyun_ebs; consult constraints before use."
  nullable    = false
  type = object({
    az_name              = optional(string)
    backup_id            = optional(string)
    cycle_count          = optional(number)
    cycle_type           = string
    delete_snap_with_ebs = optional(bool)
    encrypted            = optional(bool)
    image_id             = optional(string)
    labels = optional(list(object({
      key   = string
      value = string
    })))
    mode             = string
    multi_attach     = optional(bool)
    name             = string
    project_id       = optional(string)
    provisioned_iops = optional(number)
    region_id        = optional(string)
    size             = number
    type             = string
  })
}

resource "ctyun_ebs" "example" {
  az_name              = var.config.az_name
  backup_id            = var.config.backup_id
  cycle_count          = var.config.cycle_count
  cycle_type           = var.config.cycle_type
  delete_snap_with_ebs = var.config.delete_snap_with_ebs
  encrypted            = var.config.encrypted
  image_id             = var.config.image_id
  labels               = var.config.labels
  mode                 = var.config.mode
  multi_attach         = var.config.multi_attach
  name                 = var.config.name
  project_id           = var.config.project_id
  provisioned_iops     = var.config.provisioned_iops
  region_id            = var.config.region_id
  size                 = var.config.size
  type                 = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ebs.example.create_time : string
# ctyun_ebs.example.expire_time : string
# ctyun_ebs.example.id : string
# ctyun_ebs.example.kms_uuid : string
# ctyun_ebs.example.master_order_id : string
# ctyun_ebs.example.status : string
