resource "proxmox_vm_qemu" "vm" {
    name = var.name
    desc = var.description
    agent = 1
    target_node = var.nodename
    qemu_os = "other"  # default other
    bios = "ovmf"
  

    define_connection_info = false

    # -- only important for full clone
    vmid = var.vmid
    clone = var.templatename
    # full_clone = true
    full_clone = true

    # -- boot process
    onboot = true
    startup = ""
    automatic_reboot = true  # refuse auto-reboot when changing a setting
    cpu {
    cores = var.cores
    sockets = 1
    }
    memory = var.memory

    network {
        id = 0
        bridge = "vmbr0"
        model  = "virtio"
    }

    scsihw = "virtio-scsi-pci"  # default virtio-scsi-pci

 disk {
    slot    = "scsi0"
    storage = "local"  # Storage for the cloned disk
    size    = var.disksize        # Can resize during clone (optional)
    type    = "disk"
  }

disk {
  type    = "cloudinit"
  storage = "local"         # Use 'storage' instead of 'disk_file' for cloudinit
  slot    = "scsi1"         # Recommended to use scsi1 for cloudinit
}


    # -- lifecycle
    lifecycle {
        ignore_changes = [
            disk,
            vm_state
        ]
    }
    
    # Cloud Init Settings 
    ipconfig0 = "ip=${var.ipaddress}/24,gw=192.168.1.1"
    nameserver = var.nameserver
    ciuser = var.username
    ciupgrade = "1"
    sshkeys = var.PUBLIC_SSH_KEY
}
