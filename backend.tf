# terraform {
#     required_providers {
#         azurerm = {
#             source = "hashicorp/azurerm"
#             version = "~> 3.0"
#         }
#     }
#     backend "azurerm" {
#         resource_group_name = "tfstate_secure"
#         storage_account_name = "backend_tfstate"
#         container_name = "tfstate"
#         key = "terraform.tfstate"
#     }
# }

# provider "azurerm" {
#     features {}
# }

# resource "azurerm_resource_group" "state-secure" {
#     name = "state-secure"
#     location = "westeurope"
# }