variable "environment" {
  description = "deployment environment"
  default = "default"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "europe-west1-b"
}

variable "machine_type" {
  description = "Machine type for VM"
  type        = string
  default     = "e2-micro"
}

variable "image_family" {
  description = "OS image family"
  type        = string
  default     = "debian-12"
}

variable "image_project" {
  description = "OS image project"
  type        = string
  default     = "debian-cloud"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-balanced"
}
