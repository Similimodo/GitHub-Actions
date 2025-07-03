resource "google_container_cluster" "gke_cluster_demo" {
  name     = "${var.project_id}-my-gke"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

}

resource "google_container_node_pool" "primary_gke_cluster_nodes" {
  name       = google_container_cluster.gke_cluster_demo.name
  cluster    = google_container_cluster.gke_cluster_demo.id
  node_count = var.gke_num_nodes

  node_config {
    # preemptible  = true
    machine_type = "n1-standard-1"
    disk_size_gb = 30
    tags         = ["gke-node", "${var.project_id}-my-gke"]
    metadata = {
      disable-legacy-endpoints = true
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
    labels = {
      env = var.project_id
    }
  }
}