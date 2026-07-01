terraform {
  backend "azurerm" {
    resource_group_name   = "backendrg1"
    storage_account_name  = "backendstg10"
    container_name        = "backendcnt10"
    key                   = "terraform.tfstate"
  }
}
