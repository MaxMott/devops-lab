# k8s-resources/variables.tf

variable "kubernetes_host" {
  type        = string
  description = "The Minikube API server address (e.g. https://192.168.49.2:8443)"
}

variable "kubernetes_client_cert" {
  type        = string
  description = "Base64 encoded client certificate from kubectl config"
  sensitive   = true
}

variable "kubernetes_client_key" {
  type        = string
  description = "Base64 encoded client key from kubectl config"
  sensitive   = true
}

variable "kubernetes_ca_cert" {
  type        = string
  description = "Base64 encoded cluster CA certificate from kubectl config"
  sensitive   = true
}