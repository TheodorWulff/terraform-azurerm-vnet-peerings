locals {
  snet_address_prefixes = flatten([ for snet in var.remote_vnet.subnets:  snet.address_prefixes])
}