
# Global naming convention: <env-short>-<project>
locals {
  # Consistent RG name built from the naming convention + sequence  
  name_prefix = "${var.environment_short}-${var.project}"
  # Merge required environment tag with optional custom tags
  common_tags = merge({ environment = var.environment }, var.tags)

  # Ressource names
  rg_name   = "${local.name_prefix}-rg-${var.seq}"
  vnet_name = "${local.name_prefix}-vnet-${var.seq}"
  nsg_name  = "${local.name_prefix}-nsg-${var.seq}"
  snet_name = "${local.name_prefix}-snet-${var.seq}"
  vm_name   = "${local.name_prefix}-vm-${var.seq}"
  nic_name  = "${local.name_prefix}-nic-${var.seq}"
  # Windows hostname must be <= 15 chars
  computer_name = "${var.environment_short}-pc-${var.seq}"
}
