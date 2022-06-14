terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.12.0"
    }
  }
}

provider "google" {
  project = "coen-maryama-aden"
  region  = "europe-west2"
  zone    = "europe-west2-a"

}


// INSTANCE TEMPLATE 
resource "google_compute_instance_template" "instance_template" {
  name_prefix  = "sandbox-tf-instance-template-"
  machine_type = "e2-medium"


  disk {
    source_image = "coen-maryama-aden/web-server-image"
  }

  network_interface {
    network = google_compute_network.vpc_network.id
  }

  lifecycle {
    create_before_destroy = true
  }
}
