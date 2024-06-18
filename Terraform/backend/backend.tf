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
}


resource "google_storage_bucket" "backend_bucket" {
  name = "state-bucket-jk"
  location = "europe-central2"

  versioning {
    enabled = true
  }
}


