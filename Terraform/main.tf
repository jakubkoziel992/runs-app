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

resource "google_storage_bucket" "GCS1" {
  name = "first_bucket_from_jk"
  location = "europe-central2"
}
