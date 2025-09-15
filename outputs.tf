output "control_plane_ip" {
  description = "External IP of the control-plane VM"
  value       = google_compute_instance.control_plane.network_interface[0].access_config[0].nat_ip
}

output "worker1_ip" {
  description = "External IP of the worker-1 VM"
  value       = google_compute_instance.worker1.network_interface[0].access_config[0].nat_ip
}

output "worker2_ip" {
  description = "External IP of the worker-2 VM"
  value       = google_compute_instance.worker2.network_interface[0].access_config[0].nat_ip
}

output "worker3_ip" {
  description = "External IP of the worker-3 VM"
  value       = google_compute_instance.worker3.network_interface[0].access_config[0].nat_ip
}
