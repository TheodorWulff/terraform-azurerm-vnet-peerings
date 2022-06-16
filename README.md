# Module
[![GitHub tag](https://img.shields.io/github/tag/qbeyond/terraform-module-template.svg)](https://registry.terraform.io/modules/qbeyond/terraform-module-template/provider/latest)
[![License](https://img.shields.io/github/license/qbeyond/terraform-module-template.svg)](https://github.com/qbeyond/terraform-module-template/blob/main/LICENSE)

----
<!-- BEGIN_TF_DOCS -->
This module creates a vnet peering between two existing vnets.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.2 |
| <a name="provider_azurerm.remote"></a> [azurerm.remote](#provider\_azurerm.remote) | >= 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_route_table.remoteroute](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet_route_table_association.remotert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network_peering.hub2remote](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.remote2hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hub_vnet"></a> [hub\_vnet](#input\_hub\_vnet) | n/a | <pre>object({<br>    name = string<br>    id   = string<br>  })</pre> | n/a | yes |
| <a name="input_lb_internal_ipaddress"></a> [lb\_internal\_ipaddress](#input\_lb\_internal\_ipaddress) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_remote_identifier"></a> [remote\_identifier](#input\_remote\_identifier) | Short descriptive identifier | `string` | n/a | yes |
| <a name="input_remote_vnet"></a> [remote\_vnet](#input\_remote\_vnet) | n/a | <pre>object({<br>    name             = string<br>    id               = string<br>    address_prefixes = list(string)<br>    subnets = list(object({<br>      id               = string<br>      address_prefixes = list(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_resource_group_name_hub"></a> [resource\_group\_name\_hub](#input\_resource\_group\_name\_hub) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name_remote"></a> [resource\_group\_name\_remote](#input\_resource\_group\_name\_remote) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

# Contribute

