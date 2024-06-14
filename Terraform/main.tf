terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.33.0"
    }
  }
}

provider "google" {
  project = "runs-app-terraform"
  region = "europe-central2"
  zone = "europe-central2-a"
}

resource "google_container_cluster" "gke_cluster" {
  name = "running-app-cluster"
  location = "europe-central2"

  initial_node_count = 1
  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 10
  }

  deletion_protection = false
}
