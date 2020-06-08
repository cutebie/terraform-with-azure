####################
# Provider defined #
####################
provider "azurerm" {
  version = "2.2.0"
  subscription_id = var.azure-subscription-id
  features {
      key_vault {
        purge_soft_delete_on_destroy = true
      }
  }
}

provider "azuread" {
  version = "0.7.0"
  subscription_id = var.azure-subscription-id
}

# This provider is to be used for powershell script
provider "null" {
  version = "2.1"
}

##################
# Resource Group #
##################
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

################
# Data Factory #
################
module "datafactory" {
    source              = "./modules/datafactory"

    # override the following options

    df-name                    = var.resource_adf_name
    location                = azurerm_resource_group.rg.location
    resource_group_name     = azurerm_resource_group.rg.name

    ls-to-keyvault-name     = var.resource_ls_kv_name
    ls-service-principal-id = var.resource_storagev2_sp_id
    ls-service-principal-key = var.resource_storagev2_sp_key
    ls-storagev2-url        = var.resource_storagev2_sp_url

    ds-level1-name          = "level1"
    ds-level2-name          = "level2"
}

#############
# key vault #
#############

module "keyvault" {
  source              = "./modules/keyvault"

  # override the following options

  name                = var.resource_keyvault_name
  location            = azurerm_resource_group.rg.location
  environment         = var.environment
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
      environment = var.environment
  }

  secrets             = var.kv-secrets

  policies            = {
    adf               = {
        object_id               = module.datafactory.out_adf_identify
        key_permissions         = var.kv-key-permissions-read
        secret_permissions      = var.kv-secret-permissions-read
        certificate_permissions = var.kv-certificate-permissions-read
        storage_permissions     = var.kv-storage-permissions-read
    }
  }
}
