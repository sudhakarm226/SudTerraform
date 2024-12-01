resource "local_file" "kubeconfig" {
  depends_on = [ azurerm_kubernetes_cluster.k8s-cluster ]
  filename = "kubeconfig"
  content = azurerm_kubernetes_cluster.k8s-cluster.kube_config_raw
}