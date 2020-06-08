data "azurerm_client_config" "current" {}


# Create the Azure Data Factory
resource "azurerm_data_factory" "new_adf" {
  name                = var.df-name
  location            = var.location
  resource_group_name = var.resource_group_name
  identity {
        type = "SystemAssigned"
  }
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "storagev2" {
  name                  = var.ls-to-keyvault-name
  resource_group_name 	= var.resource_group_name
  data_factory_name     = azurerm_data_factory.new_adf.name
  service_principal_id  = var.ls-service-principal-id
  service_principal_key = var.ls-service-principal-key
  tenant                = data.azurerm_client_config.current.tenant_id
  url                   = var.ls-storagev2-url
}

resource "null_resource" "PowerShellScriptRun" {
  provisioner "local-exec" {
          #command = ".'${path.module}\\helpers\\Get-Processes.ps1' -First 10"
          command = ".'E:\\Tasks\\Azure_Training\\hello.ps1'"
          interpreter = ["PowerShell", "-Command"]
   }
   depends_on = [azurerm_data_factory_linked_service_data_lake_storage_gen2.storagev2]
}
