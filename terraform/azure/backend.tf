terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateonor"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
