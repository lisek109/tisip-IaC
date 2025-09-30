variable "nsgname" {
  type        = string
  description = "Name of the Network Security Group (computed in root)."
}

variable "vnetname" {
  type        = string
  description = "Name of the Virtual Network (computed in root)."
}

variable "rgname" {
  type        = string
  description = "Name of resource group (computed in root)."
}

variable "location" {
  type        = string
  description = "Location of resource group (computed in root)."
  default     = "westeurope"
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

variable "subnetname" {
  type        = string
  description = "Name of the Subnet (computed in root)."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  validation {
    condition     = length(var.vnet_address_space) > 0
    error_message = "Provide at least one CIDR in vnet_address_space."
  }
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
  validation {
    condition     = length(var.subnet_prefixes) > 0
    error_message = "Provide at least one CIDR in subnet_prefixes."
  }
}
