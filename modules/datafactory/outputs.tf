output "out_adf_identify" {
  value = azurerm_data_factory.new_adf.identity.0.principal_id
}

output "out_adf_name" {
  value = azurerm_data_factory.new_adf.name
}
