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
  description = "Complete configurable shape for ctyun_iam_user; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    description    = optional(string)
    email          = string
    name           = string
    password       = optional(string)
    phone          = string
    user_group_ids = set(string)
  })
}

resource "ctyun_iam_user" "example" {
  description    = var.config.description
  email          = var.config.email
  name           = var.config.name
  password       = var.config.password
  phone          = var.config.phone
  user_group_ids = var.config.user_group_ids
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_iam_user.example.account_id : string
# ctyun_iam_user.example.id : string
