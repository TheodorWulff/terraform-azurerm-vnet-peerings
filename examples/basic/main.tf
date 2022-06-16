provider "azurerm" {
  alias           = "remote-subscription"
  subscription_id = "<remote-subscription-id>"
  features {}
}

module "dc2hubpeering" {
  source = "<registry-link>"
  providers = {
    azurerm.remote = azurerm.remote-subscription # pass the provider alias to gain access to the remote vnet that will be peered to the hub 
  }

  resource_group_name_hub = local.resource_group_name_hub
  hub_vnet = {
    name = "<name>"
    id   = "<id>"
  }

  resource_group_name_remote = "<rg-name>"
  remote_identifier  = "<id>"
  remote_vnet = {
    name             = "<vnet-name>"
    id               = "/subscriptions/<remote-sub-id>/resourceGroups/<remote-rg-name>/providers/Microsoft.Network/virtualNetworks/<vnet-name>"
    address_prefixes = ["12.345.6.7/8"]
    subnets = [
      {
        id               = "/subscriptions/<remote-sub-id>/resourceGroups/<remote-rg-name>/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/<snet-name>"
        address_prefixes = ["12.345.6.7/8"]
      }
    ]
  }

  lb_internal_ipaddress = "<ip-address of internal load balancer>"

  location = "<location>"
}