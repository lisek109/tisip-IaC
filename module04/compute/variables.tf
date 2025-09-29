variable "rgname" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
  type        = string
  description = "Location of resource group"
  default     = "westeurope"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the network interface will be placed"
}

variable "environment" {
  type        = string
  description = "Environment tag"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to resources"
  default     = {}
}

variable "vmname" {
  type        = string
  description = "Name of the Virtual Machine"
  default     = "vm-tisip-iac"
}

variable "computername" {
  type        = string
  description = "Computer name of the Virtual Machine"
  default     = "vm-tisip-iac"
}

variable "vmsize" {
  type        = string
  description = "The size of the Virtual Machine"
  default     = "Standard_B1s"
}

variable "nicname" {
  type        = string
  description = "Name of the Network Interface"
  default     = "nic-tisip-iac"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}
