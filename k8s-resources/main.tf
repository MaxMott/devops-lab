resource "kubernetes_namespace_v1" "lab_namespace" {
  metadata {
    name = "my-first-tf-ns"
  }
}

resource "kubernetes_namespace_v1" "harness_ns" {
  metadata {
    name = "harness-deployments"
  }
}

resource "kubernetes_resource_quota_v1" "mem_limit" {
  metadata {
    name      = "mem-quota"
    namespace = kubernetes_namespace_v1.harness_ns.metadata[0].name
  }
  spec {
    hard = {
      memory = "1Gi"
    }
  }
}