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
  description = "Complete configurable shape for ctyun_mysql_database; consult constraints before use."
  nullable    = false
  type = object({
    charset_name = string
    description  = optional(string)
    instance_id  = string
    name         = string
    project_id   = optional(string)
    region_id    = optional(string)
  })
}

resource "ctyun_mysql_database" "example" {
  charset_name = var.config.charset_name
  description  = var.config.description
  instance_id  = var.config.instance_id
  name         = var.config.name
  project_id   = var.config.project_id
  region_id    = var.config.region_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_mysql_database.example.id : string
# ctyun_mysql_database.example.user_grant_privilege : list(object)
# ctyun_mysql_database.example.user_grant_privilege[*].account_name : string
# ctyun_mysql_database.example.user_grant_privilege[*].insert_priv : bool
# ctyun_mysql_database.example.user_grant_privilege[*].read_only : bool
# ctyun_mysql_database.example.user_grant_privilege[*].select_priv : bool
