terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
    
  backend "azurerm" {
    resource_group_name  = "RG-storage-account-tfstate"
    storage_account_name = "storageaccountkhalil"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b15571f2-b717-4386-b532-1cf14950102b"
}


resource "azurerm_resource_group" "example" {
  name     = "my-rg-khalil"
  location = "West US"
}

resource "azurerm_virtual_network" "khalil_vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = {
    environment = "Development"
  }
}
