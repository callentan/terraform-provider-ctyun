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
  description = "Complete configurable shape for ctyun_postgresql_database; consult constraints before use."
  nullable    = false
  type = object({
    charset_collate = optional(string)
    charset_name    = string
    charset_type    = optional(string)
    description     = optional(string)
    instance_id     = string
    name            = string
    owner           = optional(string)
    project_id      = optional(string)
    region_id       = optional(string)
  })
}

resource "ctyun_postgresql_database" "example" {
  charset_collate = var.config.charset_collate
  charset_name    = var.config.charset_name
  charset_type    = var.config.charset_type
  description     = var.config.description
  instance_id     = var.config.instance_id
  name            = var.config.name
  owner           = var.config.owner
  project_id      = var.config.project_id
  region_id       = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_postgresql_database.example.id : string
