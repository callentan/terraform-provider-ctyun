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
  description = "Complete configurable shape for ctyun_zos_bucket_object; consult constraints before use."
  nullable    = false
  type = object({
    acl              = optional(string)
    bucket           = string
    cache_control    = optional(string)
    content          = optional(string)
    content_encoding = optional(string)
    content_type     = optional(string)
    key              = string
    region_id        = optional(string)
    source           = optional(string)
    storage_type     = optional(string)
    tags             = optional(map(string))
  })
}

resource "ctyun_zos_bucket_object" "example" {
  acl              = var.config.acl
  bucket           = var.config.bucket
  cache_control    = var.config.cache_control
  content          = var.config.content
  content_encoding = var.config.content_encoding
  content_type     = var.config.content_type
  key              = var.config.key
  region_id        = var.config.region_id
  source           = var.config.source
  storage_type     = var.config.storage_type
  tags             = var.config.tags
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_zos_bucket_object.example.content_disposition : string
# ctyun_zos_bucket_object.example.etag : string
# ctyun_zos_bucket_object.example.id : string
# ctyun_zos_bucket_object.example.version_id : string
