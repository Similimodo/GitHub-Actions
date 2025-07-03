variable "project_id" {
  description = "The Project ID"
}

variable "region" {
  description = "The Region"
}
variable "gke_num_nodes" {
  default     = 3
  description = "Number of the GKE Nodes"
}