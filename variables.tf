##################################
# Azure Resource Group variables #
##################################

variable "resource_group_name" {
  type        = string
  description = "The name of an existing Resource Group"
  default     = ""
}

variable "resource_keyvault_name" {
  type        = string
  description = "The name of an existing keyvault"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Define the environment the Azure Key Vault should be created, you should use the Resource Group location"
  default     = ""
}

variable "location" {
  type        = string
  description = "Define the location the Azure Key Vault should be created, you should use the Resource Group location"
  default     = ""
}

variable "resource_adf_name" {
  type        = string
  description = "The name of an existing Resource Group"
  default     = ""
}

variable "resource_storagev2_name" {
  type        = string
  description = "The name of an existing Resource Group"
  default     = ""
}

###############################################
# Data Factory variables to be used in tfvars #
###############################################

variable "resource_ls_kv_name" {
  type        = string
  description = "Specifies the name of the Data Factory Linked Service."
  default     = ""
}

variable "resource_storagev2_sp_id" {
  type        = string
  description = "The service principal id in which to authenticate against the Azure Data Lake Storage Gen2 account."
  default     = ""
}

variable "resource_storagev2_sp_key" {
  type        = string
  description = "The service principal key in which to authenticate against the Azure Data Lake Storage Gen2 account."
  default     = ""
}

variable "resource_storagev2_sp_url" {
  type        = string
  description = "The endpoint for the Azure Data Lake Storage Gen2 service."
  default     = ""
}



############################################
# Key Vault variables to be used in tfvars #
############################################
variable "kv-read-object-id" {
  type        = string
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for READ access to the Azure Key Vault"
  default     = ""
}

variable "kv-secrets" {
  type = map(object({
    value = string
  }))
  description = "Define Azure Key Vault secrets"
  default     = {}
}

#######################################################################################
# Key Vault variables to be used in policies defined for ADF or any other application #
#######################################################################################

variable "kv-key-permissions-read" {
  type        = list(string)
  description = "List of read key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey"
  default     = [ "get", "list" ]
}

variable "kv-secret-permissions-read" {
  type        = list(string)
  description = "List of full secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  default     = [ "get", "list" ]
}

variable "kv-certificate-permissions-read" {
  type        = list(string)
  description = "List of full certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update"
  default     = [ "get", "getissuers", "list", "listissuers" ]
}

variable "kv-storage-permissions-read" {
  type        = list(string)
  description = "List of read storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update"
  default     = [ "get", "getsas", "list", "listsas" ]
}

