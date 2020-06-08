##################################
# Azure Resource Group variables #
##################################

variable "resource_group_name" {
  type        = string
  description = "The name of an existing Resource Group"
  default     = "demo-rg"
}

variable "location" {
  type        = string
  description = "Define the region the Azure Key Vault should be created, you should use the Resource Group location"
  default     = "demo-location"
}

variable "storagev2_name" {
  type        = string
  description = "The name of the storage account ADLSv2 to  be connected in the Data Factory"
  default     = "demo-storagev2"
}
################################
# Azure Data Factory variables #
################################

variable "df-name" {
  type        = string
  description = "The name of the Azure Factory"
  default     = "demo-adf"
}

variable "ls-to-keyvault-name" {
  type        = string
  description = "The name of the Azure Data Factory Linked Service to connect to keyvault"
}

variable "ls-service-principal-id" {
  type        = string
  description = "The service principal id in which to authenticate against the Azure Data Lake Storage Gen2 account."

}

variable "ls-service-principal-key" {
  type        = string
  description = "The service principal key in which to authenticate against the Azure Data Lake Storage Gen2 account."
}

variable "ls-storagev2-url" {
  type        = string
  description = "The endpoint for the Azure Data Lake Storage Gen2 service."
}

variable "ds-level1-name" {
  type        = string
  description = "The dataset to connect to level1 container in the Azure Data Lake Storage Gen2 service."
}

variable "ds-level2-name" {
  type        = string
  description = "The dataset to connect to level2 container in the Azure Data Lake Storage Gen2 service."
}



