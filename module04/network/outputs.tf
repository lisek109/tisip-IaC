
# Outputs used by other modules (compute) to wire dependencies without hard-coding

output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "The ID of the subnet"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "The ID of the network security group"
}
