/**
 * This module creates a vnet peering between two existing vnets.
 * 
 */
 
resource "azurerm_virtual_network_peering" "hub2remote" {
  name                         = "hub2${var.remote_identifier}"
  resource_group_name          = var.resource_group_name_hub
  virtual_network_name         = var.hub_vnet.name
  remote_virtual_network_id    = var.remote_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "remote2hub" {
  provider = azurerm.remote
  name                         = "${var.remote_identifier}2hub"
  resource_group_name          = var.resource_group_name_remote
  virtual_network_name         = var.remote_vnet.name
  remote_virtual_network_id    = var.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_subnet_route_table_association" "remotert" {
  provider = azurerm.remote
  for_each = {for snet in var.remote_vnet.subnets: snet.id => snet}

  subnet_id      = each.value.id
  route_table_id = azurerm_route_table.remoteroute.id

  lifecycle {
    ignore_changes = [route_table_id]
  }
}

resource "azurerm_route_table" "remoteroute" {
  provider = azurerm.remote  
  name                = "rt-${var.remote_vnet.name}"
  location            = var.location
  resource_group_name = var.resource_group_name_remote

  dynamic "route" {
    for_each = var.remote_vnet.address_prefixes
    content {
      name                   = "VirtualNetwork-${replace(replace(route.value, ".", "-"),"/", "-")}"
      address_prefix         = route.value
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = var.lb_internal_ipaddress
    }
  }
  
  dynamic "route" {
    for_each = local.snet_address_prefixes

    content {
      name           = "Subnet-${replace(replace(route.value, ".", "-"),"/", "-")}"
      address_prefix = route.value
      next_hop_type  = "VnetLocal"
    }
  }

  route {
    name                   = "Default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.lb_internal_ipaddress
  }
}
