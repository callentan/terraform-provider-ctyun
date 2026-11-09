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
  description = "Complete configurable shape for ctyun_elb_certificate; consult constraints before use."
  nullable    = false
  type = object({
    certificate = string
    description = optional(string)
    name        = string
    private_key = optional(string)
    project_id  = optional(string)
    region_id   = optional(string)
    type        = string
  })
}

resource "ctyun_elb_certificate" "example" {
  certificate = var.config.certificate
  description = var.config.description
  name        = var.config.name
  private_key = var.config.private_key
  project_id  = var.config.project_id
  region_id   = var.config.region_id
  type        = var.config.type
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_certificate.example.create_time : string
# ctyun_elb_certificate.example.id : string
# ctyun_elb_certificate.example.status : string
# ctyun_elb_certificate.example.update_time : string
