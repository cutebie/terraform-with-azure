# Azure Automation using Terraform

## Specifications
1. Create Resource Group 
2. Create Key-Vault 
3. Create ADF 
4. Create pipeline for moving data from level1 to level2 
5. Assuming that the Spark jar file that you did in the exercise 1 is uploaded to dbfs manually, create a pipeline to use that jar for transformation. 

## Usage 
1. Update the name of Azure resources and authentication information (e.g. Tenant ID, Subscription ID, ...) in terraform.tfvars
2. Then run following commands in order

``az login``

``terraform init``

``terraform plan -out=azure-with-terraform-plan``

``terraform apply azure-with-terraform-plan``

``terraform destroy``

## Note
- It's required to have Azure CLI to be installed so that the login step is performed successfully.
- Step #4 and #5 is out of scope of Terraform because it currently doesn't support creating dataset for ADLS Gen2
