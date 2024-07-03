terraform {
  #backend "gcs" {
  #  bucket = "state-bucket-jk"
  #  prefix = "projects"
  #}
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.33.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "4.3.0"
    } 
  }
}

provider "vault" {
 address = "http://10.186.0.4:40404"
 skip_child_token = true

 auth_login {
   path = "auth/approle/login"

   parameters = {
     role_id = "<ROLE_ID>"
     secret_id = "<SECRET_ID>"
    }
  }
}


data "vault_generic_secret" "service_account" {
  path = "terraform/service-account-key"
}


provider "google" {
  credentials = jsonencode(data.vault_generic_secret.service_account.data)
}

resource "google_container_cluster" "gke_cluster" {
  name = "running-app-cluster"
  location = var.my_location
  deletion_protection = false  

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
