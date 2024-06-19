terraform {
  backend "gcs" {
    bucket = "state-bucket-jk"
    prefix = "projects"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.33.0"
    }
  }
}

provider "google" {
}

resource "google_container_cluster" "gke_cluster" {
  name = "running-app-cluster"
  location = var.my_location

  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "gke_nodes"{
  name = "my-node-pool"
  cluster = google_container_cluster.gke_cluster.name
  node_count = var.my_nodes

  node_config {
    preemptible = true
    machine_type = var.instance_type
    disk_size_gb = var.disk_size
  }
}









