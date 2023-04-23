locals {
    #rg_name = "${var.azurerm_resource_group}-${var.environment}-${var.team}"
    #storagge_name = "${var.storage_account}-${var.environment}-${var.team}"
    base_name = "${var.environment}-${var.team}"
    strg_name = "strgdadp"
    location = "west europe"
    owner = "Jacco Bakker"


    common_tags = {
        team    = "dadp"
        afdeling = "IT & Digital"
        environment = "poc"
        owner = local.owner
    }
}