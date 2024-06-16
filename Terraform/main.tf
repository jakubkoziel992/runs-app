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
  zone = var.my_zone
}

resource "google_container_cluster" "gke_cluster" {
  name = "running-app-cluster"
  location = var.my_zone

  initial_node_count = 1
  node_config {
    machine_type = var.instance_type
    disk_size_gb = 10
  }

  deletion_protection = false
}
