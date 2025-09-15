terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# -------------------------
# Instances
# -------------------------
resource "google_compute_instance" "control_plane" {
  name         = "control-plane"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/${var.image_project}/global/images/family/${var.image_family}"
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["control-plane", "ssh"]
}

resource "google_compute_instance" "worker1" {
  name         = "worker-1"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/${var.image_project}/global/images/family/${var.image_family}"
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["worker-1", "http-3000"]
}

resource "google_compute_instance" "worker2" {
  name         = "worker-2"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/${var.image_project}/global/images/family/${var.image_family}"
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["worker-2"]
}

resource "google_compute_instance" "worker3" {
  name         = "worker-3"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/${var.image_project}/global/images/family/${var.image_family}"
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["worker-3"]
}

# -------------------------
# Firewall Rules
# -------------------------
resource "google_compute_firewall" "allow_control_plane_ssh" {
  name      = "allow-control-plane-ssh"
  network   = "default"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["control-plane"]
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH access to control-plane from the Internet"
}

resource "google_compute_firewall" "allow_worker1_3000" {
  name      = "allow-worker1-3000"
  network   = "default"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  target_tags   = ["worker-1"]
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow TCP port 3000 access to worker-1 from the Internet"
}
