test {
  run "terraform apply -auto-approve"
  assert {
   condition = resoure.proxmox_vm_qemu.vmid != ""
   error_message = "VM not created"
  }
  assert {
   condition = resoure.proxmox_vm_qemu.tags != ""
   error_message = "Tags not present"
  }
}