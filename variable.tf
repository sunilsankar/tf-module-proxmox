variable "name" {
  description = "The name of the deployment"
  type        = string
}

variable "description" {
  description = "Description of the VM"
  type        = string
}
variable "nodename" {
  description = "Proxmox Server Name"
  type        = string
  default = "pi5"
}
###############################
variable "vmid" {
  description = "VMid to be used"
  type        = number
}

variable "templatename" {
  description = "Templatename"
  type        = string
  default = "alma9-Template"
}
variable "cores" {
  description = "No of CPU Cores"
  type        = number
  default = 2
}
variable "memory" {
  description = "Memory needed"
  type        = number
  default = 1024
}

variable "disksize" {
  description = "Disk Size"
  type        = string
  default = "10G"
}
#############################
#####Cloud init###############
variable "ipaddress" {
  description = "Ipaddress to be used"
  type        = string
}
variable "nameserver" {
  description = "nameserver to be used"
  type        = string
  default = "192.168.1.9"
}
variable "username" {
  description = "Username to be used"
  type        = string
  default = "sunil"
}
variable "password" {
  description = "Password to be used"
  type        = string
  default = "password@123"
}
variable "PUBLIC_SSH_KEY" {
  description = "Public Key to be used"
  type        = string
}


