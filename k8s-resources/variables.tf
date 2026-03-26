variable "kubernetes_host" {
  type        = string
  description = "Internal cluster API address"
}

variable "kubernetes_client_cert" {
  type        = string
  description = "Base64 encoded client certificate"
}

variable "kubernetes_client_key" {
  type        = string
  description = "Base64 encoded client key"
}

variable "kubernetes_ca_cert" {
  type        = string
  description = "Base64 encoded CA certificate"
}