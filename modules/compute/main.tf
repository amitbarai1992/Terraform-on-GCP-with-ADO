resource "google_compute_instance" "vm_instance" {
  name         = "ubuntu-vm"
  machine_type = "f1-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = var.subnet
    access_config {
      // No public IP
    }
  }

  metadata = {
    ssh-keys = "terraform:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
  }

  tags = ["ssh"]
}
