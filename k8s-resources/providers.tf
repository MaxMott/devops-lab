terraform {
  cloud {
    organization = "devops-lab-mm"
    workspaces {
      name = "minikube-lab"
    }
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  host = "https://192.168.49.2:8443"

  # client_certificate     = base64decode(var.kubernetes_client_cert)
  # client_key             = base64decode(var.kubernetes_client_key)
  # cluster_ca_certificate = base64decode(var.kubernetes_ca_cert)
  client_certificate     = var.kubernetes_client_cert
  client_key             = var.kubernetes_client_key
  cluster_ca_certificate = var.kubernetes_ca_cert
}
