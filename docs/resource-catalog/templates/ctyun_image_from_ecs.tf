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
  description = "Complete configurable shape for ctyun_image_from_ecs; consult constraints before use."
  nullable    = false
  type = object({
    data_disk_id                 = optional(string)
    description                  = optional(string)
    enable_image_integrity_check = optional(bool)
    image_name                   = string
    image_type                   = string
    instance_id                  = string
    labels = optional(set(object({
      label_key   = optional(string)
      label_value = optional(string)
    })))
    maximum_ram   = optional(number)
    minimum_ram   = optional(number)
    project_id    = optional(string)
    region_id     = optional(string)
    repository_id = optional(string)
  })
}

resource "ctyun_image_from_ecs" "example" {
  data_disk_id                 = var.config.data_disk_id
  description                  = var.config.description
  enable_image_integrity_check = var.config.enable_image_integrity_check
  image_name                   = var.config.image_name
  image_type                   = var.config.image_type
  instance_id                  = var.config.instance_id
  labels                       = var.config.labels
  maximum_ram                  = var.config.maximum_ram
  minimum_ram                  = var.config.minimum_ram
  project_id                   = var.config.project_id
  region_id                    = var.config.region_id
  repository_id                = var.config.repository_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_image_from_ecs.example.id : string
