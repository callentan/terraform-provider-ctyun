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
  description = "Complete configurable shape for ctyun_scaling_config; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    az_names        = optional(set(string))
    bandwidth       = optional(number)
    flavor_name     = string
    image_id        = string
    key_pair_id     = optional(string)
    login_mode      = string
    monitor_service = optional(bool)
    name            = string
    password        = optional(string)
    region_id       = optional(string)
    tags = optional(list(object({
      key   = string
      value = string
    })))
    use_floatings = string
    volumes = list(object({
      disk_mode   = optional(string)
      flag        = string
      volume_size = number
      volume_type = string
    }))
  })
}

resource "ctyun_scaling_config" "example" {
  az_names        = var.config.az_names
  bandwidth       = var.config.bandwidth
  flavor_name     = var.config.flavor_name
  image_id        = var.config.image_id
  key_pair_id     = var.config.key_pair_id
  login_mode      = var.config.login_mode
  monitor_service = var.config.monitor_service
  name            = var.config.name
  password        = var.config.password
  region_id       = var.config.region_id
  tags            = var.config.tags
  use_floatings   = var.config.use_floatings
  volumes         = var.config.volumes
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_scaling_config.example.id : number
# ctyun_scaling_config.example.username : string
