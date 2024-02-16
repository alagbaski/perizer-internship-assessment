variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "cluster_config" {
  description = <<DESCRIPTION
  name = (Required) The name for the cluster created.
  kubernetes_version = (Optional) Version of Kubernetes specified when creating the AKS managed cluster.
  dns_prefix = (Optional) DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length.
  default_node_pool = (Required) A default_node_pool block as defined below.
  node_count = (Optional) The initial number of nodes which should exist in this Node Pool.
  vm_size = (Required) The size of the Virtual Machine, such as Standard_DS2_v2. temporary_name_for_rotation must be specified when attempting a resize
  enable_auto_scaling = (Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool?
  identity_type = (Required) Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster.
  network_profile = (Optional) A network_profile block as defined below.
  load_balancer_sku = (Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard.
  network_plugin = (Required) Network plugin to use for networking. Currently supported values are azure, kubenet and none.
  DESCRIPTION
  type = object({
    name = string
    kubernetes_version = string
    dns_prefix = string
    default_node_pool = object({
      name = string
      node_count = number
      vm_size = string
      type = string
      enable_auto_scaling = bool
    })
    identity = object({
      type = string
      })
    network_profile = object({
      load_balancer_sku = string
      network_plugin = string
    })
  })
}