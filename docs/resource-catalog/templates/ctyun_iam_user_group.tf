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
  description = "Complete configurable shape for ctyun_iam_user_group; consult constraints before use."
  nullable    = false
  type = object({
    description = string
    name        = string
  })
}

resource "ctyun_iam_user_group" "example" {
  description = var.config.description
  name        = var.config.name
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_iam_user_group.example.id : string
