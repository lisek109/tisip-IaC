
variable "location" {
  type        = string
  description = "Location of resource group"
  default     = "westeurope"
}

variable "environment" {
  type        = string
  description = "Environment tag"
  default     = "Production"
}

variable "seq" {
  type        = string
  description = "Sequence number for resource names"
  default     = "001"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to resources"
  default     = {}
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = []
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
  default     = []
}

variable "environment_short" {
  type        = string
  description = "Short name for the environment"
  default     = ""
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "tisip-iac"
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
