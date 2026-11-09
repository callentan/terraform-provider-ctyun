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
  description = "Complete configurable shape for ctyun_idp; consult constraints before use."
  nullable    = false
  type = object({
    description = optional(string)
    file        = string
    file_name   = string
    name        = string
    protocol    = optional(string)
    type        = optional(string)
  })
}

resource "ctyun_idp" "example" {
  description = var.config.description
  file        = var.config.file
  file_name   = var.config.file_name
  name        = var.config.name
  protocol    = var.config.protocol
  type        = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_idp.example.account_id : string
# ctyun_idp.example.id : number
