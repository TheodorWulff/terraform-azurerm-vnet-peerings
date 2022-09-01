locals {
  snet_address_prefixes = setsubtract(flatten([ for snet in var.remote_vnet.subnets:  snet.address_prefixes]), var.remote_vnet.address_prefixes)
}
