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
  description = "Complete configurable shape for ctyun_image; consult constraints before use."
  nullable    = false
  type = object({
    architecture = optional(string)
    boot_mode    = optional(string)
    description  = optional(string)
    disk_size    = optional(number)
    file_source  = optional(string)
    name         = string
    os_distro    = string
    os_version   = string
    project_id   = optional(string)
    region_id    = optional(string)
    type         = optional(string)
  })
}

resource "ctyun_image" "example" {
  architecture = var.config.architecture
  boot_mode    = var.config.boot_mode
  description  = var.config.description
  disk_size    = var.config.disk_size
  file_source  = var.config.file_source
  name         = var.config.name
  os_distro    = var.config.os_distro
  os_version   = var.config.os_version
  project_id   = var.config.project_id
  region_id    = var.config.region_id
  type         = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_image.example.id : string
# ctyun_image.example.status : string
