resource "google_compute_instance" "vm_instance" {
  name         = "ado-tfe-instance-01"
  machine_type = "f1-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    # network    = module.network.custom_vpc_id // Use the VPC created in the network module
    subnetwork = var.subnet
    access_config {
      // No public IP
    }
  }
  
  labels = {
    "created-by" = "ADO-Terraform"
    "environment" = "test"
  }

  metadata = {
    ssh-keys = "terraform:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
  }

  tags = ["ssh"]
}
