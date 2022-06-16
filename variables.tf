variable "resource_group_name_hub" {
  type = string
}

variable "hub_vnet" {
  type = object({
    name = string
    id   = string
  })
}

variable "resource_group_name_remote" {
  type = string
}

variable "remote_identifier" {
  type = string
  description = "Short descriptive identifier"
}

variable "remote_vnet" {
  type = object({
    name             = string
    id               = string
    address_prefixes = list(string)
    subnets = list(object({
      id               = string
      address_prefixes = list(string)
    }))
  })
}

variable "lb_internal_ipaddress" {
  type = string
}

variable "location" {
  type = string
}