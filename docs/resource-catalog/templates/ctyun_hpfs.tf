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
  description = "Complete configurable shape for ctyun_hpfs; consult constraints before use."
  nullable    = false
  type = object({
    az_name      = optional(string)
    baseline     = optional(string)
    cluster_name = optional(string)
    cycle_count  = optional(number)
    cycle_type   = optional(string)
    name         = string
    project_id   = optional(string)
    protocol     = string
    region_id    = optional(string)
    size         = number
    subnet_id    = optional(string)
    vpc_id       = optional(string)
  })
}

resource "ctyun_hpfs" "example" {
  az_name      = var.config.az_name
  baseline     = var.config.baseline
  cluster_name = var.config.cluster_name
  cycle_count  = var.config.cycle_count
  cycle_type   = var.config.cycle_type
  name         = var.config.name
  project_id   = var.config.project_id
  protocol     = var.config.protocol
  region_id    = var.config.region_id
  size         = var.config.size
  subnet_id    = var.config.subnet_id
  vpc_id       = var.config.vpc_id
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_hpfs.example.create_time : string
# ctyun_hpfs.example.dataflow_list : set(string)
# ctyun_hpfs.example.id : string
# ctyun_hpfs.example.master_order_id : string
# ctyun_hpfs.example.secret_key : string
# ctyun_hpfs.example.share_path : string
# ctyun_hpfs.example.status : string
# ctyun_hpfs.example.update_time : string
# ctyun_hpfs.example.used_size : number
