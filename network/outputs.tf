output "network_vpc_uri" {
  value = "${google_compute_network.tf_network.self_link}"
}

output "subnetwork_link" {
  value = "${google_compute_subnetwork.region.*.name}"
}

output "vpc_name" {
  value = "${google_compute_network.tf_network.name}"
}
