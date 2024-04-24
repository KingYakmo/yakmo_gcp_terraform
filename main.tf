terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "bigmos-project-2024-419920"
region = "us-central1"
zone = "us-central1-b"
credentials = "bigmos-project-2024-419920-7a822197abbc.json"
}

resource "google_storage_bucket" "bigmos-bucket-1" {
  name          = "drizzle_drizzle"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
