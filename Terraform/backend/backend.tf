terraform {
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
 address = "http://34.118.84.82:40404"
}


data "vault_generic_secret" "service_account" {
  path = "terraform/service-account-key"
}


provider "google" {
  credentials = jsonencode(data.vault_generic_secret.service_account.data)
}


resource "google_storage_bucket" "backend_bucket" {
  name = "state-bucket-jk"
  location = "europe-central2"

  versioning {
    enabled = true
  }
}
