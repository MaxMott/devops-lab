terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

# Variable definitions (Values are pulled from TFC UI)
variable "kubernetes_host" {}
variable "kubernetes_client_cert" {}
variable "kubernetes_client_key" {}
variable "kubernetes_ca_cert" {}

provider "kubernetes" {
  host                   = var.kubernetes_host
  client_certificate     = base64decode(var.kubernetes_client_cert)
  client_key             = base64decode(var.kubernetes_client_key)
  cluster_ca_certificate = base64decode(var.kubernetes_ca_cert)
  
  # Crucial for local Minikube labs to bypass SSL handshake errors
  insecure = true 
}

# Resource 1: The Lab Namespace
resource "kubernetes_namespace_v1" "lab_namespace" {
  metadata {
    name = "exponential-growth-lab"
  }
}

# Resource 2: The Harness Namespace
resource "kubernetes_namespace_v1" "harness_ns" {
  metadata {
    name = "harness-deployments"
  }
}

# Resource 3: A Quota (To prove Terraform can manage objects)
resource "kubernetes_resource_quota_v1" "mem_limit" {
  metadata {
    name      = "mem-limit"
    namespace = kubernetes_namespace_v1.lab_namespace.metadata[0].name
  }
  spec {
    hard = {
      memory = "1Gi"
    }
  }
}