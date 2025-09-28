variable "location" {
  type        = string
  description = "Azure-region for ressursene"
  default     = "westeurope"
}

variable "saname" {
  type        = string
  description = "Storage Account name"
}

#terraform plan -var="rgname=rg-demo-lisek" -var.....

variable "project" {
  type        = string
  description = "Project name"
}

variable "costcenter" {
  type        = string
  description = "Billing code"
}

variable "environment" {
  type        = string
  description = "Environment name"
}
