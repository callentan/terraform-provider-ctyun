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
  description = "Complete configurable shape for ctyun_ccse_cluster; consult constraints before use."
  nullable    = false
  type = object({
    base_info = object({
      auto_renew             = optional(bool)
      cluster_domain         = optional(string)
      cluster_name           = string
      cluster_series         = string
      cluster_version        = string
      container_runtime      = optional(string)
      cycle_count            = optional(number)
      cycle_type             = string
      deploy_type            = optional(string)
      elb_prod_code          = optional(string)
      enable_api_server_eip  = optional(bool)
      enable_snat            = optional(bool)
      end_port               = number
      install_als            = optional(bool)
      install_als_cube_event = optional(bool)
      install_ccse_monitor   = optional(bool)
      install_nginx_ingress  = optional(bool)
      ip_vlan                = optional(bool)
      kube_proxy             = string
      nat_gateway_spec       = optional(string)
      network_plugin         = string
      network_policy         = optional(bool)
      nginx_ingress_lb_spec  = optional(string)
      nginx_ingress_network  = optional(string)
      node_scale             = optional(number)
      pod_cidr               = optional(string)
      pod_subnet_id_list     = optional(set(string))
      project_id             = optional(string)
      security_group_id      = optional(string)
      series_type            = optional(string)
      service_cidr           = optional(string)
      start_port             = number
      subnet_id              = string
      timezone               = string
      vpc_id                 = string
    })
    master_host = optional(object({
      az_infos = list(object({
        az_name = string
        size    = number
      }))
      data_disks = optional(list(object({
        size = number
        type = string
      })))
      item_def_name = string
      sys_disk = optional(object({
        size = number
        type = string
      }))
    }))
    region_id = optional(string)
    slave_host = object({
      az_infos = set(object({
        az_name = string
        size    = number
      }))
      data_disks = optional(list(object({
        size = number
        type = string
      })))
      instance_type = string
      item_def_name = string
      mirror_id     = optional(string)
      mirror_name   = optional(string)
      mirror_type   = number
      sys_disk = optional(object({
        size = number
        type = string
      }))
    })
  })
}

resource "ctyun_ccse_cluster" "example" {
  base_info   = var.config.base_info
  master_host = var.config.master_host
  region_id   = var.config.region_id
  slave_host  = var.config.slave_host
}

# Read-only attributes (reference only; never resource assignments):
# ctyun_ccse_cluster.example.create_time : string
# ctyun_ccse_cluster.example.expire_time : string
# ctyun_ccse_cluster.example.external_kube_config : string
# ctyun_ccse_cluster.example.id : string
# ctyun_ccse_cluster.example.internal_kube_config : string
# ctyun_ccse_cluster.example.master_order_id : string
# ctyun_ccse_cluster.example.name : string
