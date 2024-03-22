resource "google_compute_instance" "bastion_host" {
  name         = "acceleratorbastion-host"
  machine_type = "e2-small"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = "accelerator-vpc"
    subnetwork = "subnet-1"

    # Since we are not specifying "access_config", this VM will only have an internal IP
  }

  # Optionally, you can set up SSH keys for the instance

  # Tags for identifying the VM, can be used for firewall rules
  tags = ["bastion-host"]

}












