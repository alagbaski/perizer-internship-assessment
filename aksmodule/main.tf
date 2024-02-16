resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_config["name"]
  kubernetes_version  = var.cluster_config["kubernetes_version"]
  location            = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.cluster_config["dns_prefix"]

  default_node_pool {
    name                = var.cluster_config.default_node_pool.name
    node_count          = var.cluster_config.default_node_pool.node_count
    vm_size             = var.cluster_config.default_node_pool.vm_size
    type                = var.cluster_config.default_node_pool.type
    zones  = [1, 2, 3]
    enable_auto_scaling = var.cluster_config.default_node_pool.enable_auto_scaling
  }

  identity {
    type = var.cluster_config.identity.type
  }

  network_profile {
    load_balancer_sku = var.cluster_config.network_profile.load_balancer_sku
    network_plugin    = var.cluster_config.network_profile.network_plugin
  }
}