module "aksmodule" {
  source = "./aksmodule"

  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  system_node_count   = var.system_node_count
}
