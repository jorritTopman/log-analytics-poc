locals {
  base_name = "${var.environment}-${var.team}"
  strg_name = "strgdadp"
  location  = "west europe"
  owner     = "Jacco Bakker"


  common_tags = {
    team        = "dadp"
    afdeling    = "IT & Digital"
    environment = "poc"
    owner       = local.owner
  }
}