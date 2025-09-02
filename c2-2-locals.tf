locals {
  owner = var.owner
  environment = var.environment
  lambda1_name = "${var.project}-producer"
  lambda2_name = "${var.project}-consumer"
  common_tags = {
    owners = local.owner
    environment = local.environment
  }
}