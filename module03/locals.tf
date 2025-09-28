locals {
  resource_group_name = "${var.project}-modul03"

  storage_account_name = "${var.saname}modul03"

  tags = {
    costcenter  = var.costcenter
    owner       = "Tomasz Lisowski"
    project     = var.project
    environment = var.environment
  }
}
