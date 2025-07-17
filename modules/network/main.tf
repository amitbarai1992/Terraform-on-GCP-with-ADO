resource "google_compute_network" "custom_vpc" {
  name                    = "my-custom-vpc1"
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = "subnet-1"
  ip_cidr_range = "10.1.1.0/24"
  region        = var.region
  network       = google_compute_network.custom_vpc.id
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
