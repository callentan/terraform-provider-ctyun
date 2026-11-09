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
  description = "Complete configurable shape for ctyun_function_domain; consult constraints before use."
  nullable    = false
  sensitive   = true
  type = object({
    auth_jwt_jwks       = optional(string)
    auth_type           = optional(string)
    cert_certificate    = optional(string)
    cert_name           = optional(string)
    cert_private_key    = optional(string)
    cname_check         = optional(bool)
    description         = optional(string)
    domain_name         = string
    protocol            = optional(string)
    region_id           = optional(string)
    route_enable_jwt    = optional(number)
    route_function_name = optional(string)
    route_methods       = optional(list(string))
    route_path          = optional(string)
    route_qualifier     = optional(string)
  })
}

resource "ctyun_function_domain" "example" {
  auth_jwt_jwks       = var.config.auth_jwt_jwks
  auth_type           = var.config.auth_type
  cert_certificate    = var.config.cert_certificate
  cert_name           = var.config.cert_name
  cert_private_key    = var.config.cert_private_key
  cname_check         = var.config.cname_check
  description         = var.config.description
  domain_name         = var.config.domain_name
  protocol            = var.config.protocol
  region_id           = var.config.region_id
  route_enable_jwt    = var.config.route_enable_jwt
  route_function_name = var.config.route_function_name
  route_methods       = var.config.route_methods
  route_path          = var.config.route_path
  route_qualifier     = var.config.route_qualifier
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_function_domain.example.cname_valid : bool
# ctyun_function_domain.example.created_at : string
# ctyun_function_domain.example.domain_status : string
# ctyun_function_domain.example.id : string
# ctyun_function_domain.example.route_function_id : number
# ctyun_function_domain.example.route_function_unique_name : string
# ctyun_function_domain.example.updated_at : string
