terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://<IP_ADDRESS_OF_PVE>:8006/api2/json"
  pm_user    = "root@pam"
}

resource "proxmox_vm_qemu" "init_master" {
  name        = ""
  desc        = ""
  target_node = "<pve_node>"
  onboot      = "true"
  full_clone  = "true"
  clone       = "<template_name>"
  cores       = 3
  sockets     = 1
  memory      = 2048
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "<cloud_init_user>"
  sshkeys     = "<ssh_pub_key>"

  disk {
    type    = "scsi"
    storage = "<target_storage>"
    size    = "32G"
  }

  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}

resource "proxmox_vm_qemu" "worker1" {
  name        = ""
  desc        = ""
  target_node = "<pve_node>"
  onboot      = "true"
  full_clone  = "true"
  clone       = "<template_name>"
  cores       = 3
  sockets     = 1
  memory      = 2048
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "<cloud_init_user>"
  sshkeys     = "<ssh_pub_key>"

  disk {
    type    = "scsi"
    storage = "<target_storage>"
    size    = "32G"
  }

  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}

resource "proxmox_vm_qemu" "worker2" {
  name        = ""
  desc        = ""
  target_node = "<pve_node>"
  onboot      = "true"
  full_clone  = "true"
  clone       = "<template_name>"
  cores       = 3
  sockets     = 1
  memory      = 2048
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "<cloud_init_user>"
  sshkeys     = "<ssh_pub_key>"

  disk {
    type    = "scsi"
    storage = "<target_storage>"
    size    = "32G"
  }

  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}

resource "proxmox_vm_qemu" "worker3" {
  name        = ""
  desc        = ""
  target_node = "<pve_node>"
  onboot      = "true"
  full_clone  = "true"
  clone       = "<template_name>"
  cores       = 3
  sockets     = 1
  memory      = 2048
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "<cloud_init_user>"
  sshkeys     = "<ssh_pub_key>"

  disk {
    type    = "scsi"
    storage = "<target_storage>"
    size    = "32G"
  }

  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}


output "init_master_address" {
  value = proxmox_vm_qemu.init_master.ssh_host
}

output "worker1_address" {
  value = proxmox_vm_qemu.worker1.ssh_host
}

output "worker2_address" {
  value = proxmox_vm_qemu.worker2.ssh_host
}

output "worker3_address" {
  value = proxmox_vm_qemu.worker3.ssh_host
}