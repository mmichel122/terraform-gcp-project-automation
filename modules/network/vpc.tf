
resource "google_compute_network" "tf_network" {
  name                    = var.network_name
  description             = "CUSTOM VPC NETWORK"
  routing_mode            = "REGIONAL"
  project                 = var.project
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "region" {
  count                    = 3
  project                 = var.project
  name                     = "${var.region}-${count.index + 1}"
  ip_cidr_range            = cidrsubnet(var.cidr_block, 8, count.index + 1)
  region                   = "${var.region}-west${count.index + 1}"
  network                  = google_compute_network.tf_network.self_link
  private_ip_google_access = true
}

resource "google_compute_firewall" "tf_network" {
  name    = "default-firewall-rule"
  project                 = var.project
  network = google_compute_network.tf_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.ssh_source_ips]
}
