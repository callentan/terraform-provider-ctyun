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
  description = "Complete configurable shape for ctyun_enterprise_project_association_user_group; consult constraints before use."
  nullable    = false
  type = object({
    enterprise_project_id = string
    policy_ids            = optional(set(string))
    user_group_id         = string
  })
}

resource "ctyun_enterprise_project_association_user_group" "example" {
  enterprise_project_id = var.config.enterprise_project_id
  policy_ids            = var.config.policy_ids
  user_group_id         = var.config.user_group_id
}

# Read-only attributes (reference only; never resource assignments):
