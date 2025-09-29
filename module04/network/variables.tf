variable "nsgname" {
  type        = string
  description = "Name of the Network Security Group"
  default     = "nsg-tisip-iac"
}

variable "vnetname" {
  type        = string
  description = "Name of the Virtual Network"
  default     = "vnet-tisip-iac"
}

variable "rgname" {
  type        = string
  description = "Name of resource group"
  default     = "rg-tisip-iac"
}

variable "location" {
  type        = string
  description = "Location of resource group"
  default     = "westeurope"
}

variable "environment" {
  type        = string
  description = "Environment tag"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to resources"
  default     = {}
}

variable "subnetname" {
  type        = string
  description = "Name of the Subnet"
  default     = "snet-tisip-iac"
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
