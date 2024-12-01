terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  subscription_id = "a95dbe9e-bf88-4327-88b8-f85c96e18436"
  features {}
}

resource "azurerm_resource_group" "rg-sud-auto" {
    name    = "rg-sud-auto-1"
    location = "north europe" 
}

resource "azurerm_kubernetes_cluster" "k8s-cluster" {
  name = "k8s-northeurope"
  location = azurerm_resource_group.rg-sud-auto.location
  resource_group_name = azurerm_resource_group.rg-sud-auto.name
  dns_prefix = "k8scluster"
  
  identity {
    type = "SystemAssigned"
  }
  
  default_node_pool {
    name = "default"
    node_count = 1
    vm_size = "Standard_D2_v2"
  }
  
}