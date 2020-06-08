####################
# common variables #
####################
environment             = "devops"
location                = "eastasia"
resource_group_name     = "aq-devops-rg"
resource_keyvault_name  = "aq-devops-kv"
resource_adf_name       = "aq-devops-adf"

####################
# ADLSv2           #
####################
resource_storagev2_name     = "aqstoragetransform"
resource_ls_kv_name         = "aq-devops-ls-kv"
resource_storagev2_sp_id   = "6b8cd107-6eb5-4987-bb29-5112ef6ed3bf"
resource_storagev2_sp_key   = ".eg5Q8mfvn6q57Ag~.F-~SZJyFaha~dbuF"
resource_storagev2_sp_url   = "https://aqstoragetransform.dfs.core.windows.net/"

##################
# Authentication #
##################
azure-subscription-id = "dab96408-7675-4604-a97a-5b9fc9b4767c"
azure-client-id       = ""
azure-client-secret   = ""
azure-tenant-id       = "7392954b-403c-4baa-bb7b-85db61345b2b"

#############
# key vault #
#############
kv-read-object-id =""
kv-secrets = {
    secret-devops-databricks = {
          # access token of the key scope defined in DataBricks  named "sparkjob"
          # value = "DefaultEndpointsProtocol=https;AccountName=aqstoragetransform;AccountKey=OFtD/70Di8azVhn9XamJJLUngK9v8uxP9xi0uIEZIqu3gYWClIhd/IMJuDcyOQ2W/V/LuvJzfWi7lw0S9+yNcg==;EndpointSuffix=core.windows.net"
          value = "dapia76977a214913fa4300c02f6bd284cff"
    }
    #sqldb = {
    #  value = "" # setting to "" will auto-generate the password
    #}
    #webadmin = {
    #  value = "hLDmexfL8@m46Suevb!oao"
    #}
  }