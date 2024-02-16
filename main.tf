module "aksmodule" {
  source = "./aksmodule"

  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_config      = var.cluster_config
}
