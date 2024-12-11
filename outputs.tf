output "aks_cluster_name" {
  description = "Azure Kubernetes Service cluster name"
  value       = azurerm_kubernetes_cluster.main.name
}

output "aks_cluster_fqdn" {
  description = "Azure Kubernetes Service cluster FQDN"
  value       = azurerm_kubernetes_cluster.main.fqdn
}

output "vnet_id" {
  description = "Azure Virtual Network ID"
  value       = azurerm_virtual_network.main.id
}
