resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "public" {
  for_each             = toset(var.public_subnets)
  name                 = "public-${split("/", each.key)[1]}"
  address_prefixes     = [each.key]
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}

resource "azurerm_subnet" "private" {
  for_each             = toset(var.private_subnets)
  name                 = "private-${split("/", each.key)[1]}"
  address_prefixes     = [each.key]
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = "vprofile-aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "vprofile"

  default_node_pool {
    name           = "default"
    vm_size        = "Standard_DS2_v2"
    node_count     = 2
    vnet_subnet_id = azurerm_subnet.private["172.20.1.0/24"].id
  }

  identity {
    type = "SystemAssigned"
  }
}
