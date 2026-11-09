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
  description = "Complete configurable shape for ctyun_elb_target; consult constraints before use."
  nullable    = false
  type = object({
    description     = optional(string)
    instance_id     = string
    instance_ip     = optional(string)
    instance_type   = string
    project_id      = optional(string)
    protocol_port   = number
    region_id       = optional(string)
    target_group_id = string
    weight          = optional(number)
  })
}

resource "ctyun_elb_target" "example" {
  description     = var.config.description
  instance_id     = var.config.instance_id
  instance_ip     = var.config.instance_ip
  instance_type   = var.config.instance_type
  project_id      = var.config.project_id
  protocol_port   = var.config.protocol_port
  region_id       = var.config.region_id
  target_group_id = var.config.target_group_id
  weight          = var.config.weight
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_elb_target.example.create_time : string
# ctyun_elb_target.example.health_check_status : string
# ctyun_elb_target.example.health_check_status_ipv6 : string
# ctyun_elb_target.example.id : string
# ctyun_elb_target.example.status : string
# ctyun_elb_target.example.update_time : string
