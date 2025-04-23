# Example Terraform Script
provider "azurerm" {
  features {}
  subscription_id = "12100be1-d71d-4710-8cf2-d85c7a999be1"
}

resource "azurerm_resource_group" "rg" {
  name     = "devops-project-rg"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "mydevopsacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "devops-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "devops-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
