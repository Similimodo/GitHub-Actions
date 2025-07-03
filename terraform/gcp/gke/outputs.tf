output "project_id" {
  value       = var.project_id
  description = "Project ID"
}

output "region" {
  value       = var.region
  description = "GKE Region"
}

output "kubernetes_cluster_host" {
  value       = google_container_node_pool.primary_gke_cluster_nodes.name
  description = "GKE Nodes"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.gke_cluster_demo.name
  description = "GKE Cluster Name"
}
