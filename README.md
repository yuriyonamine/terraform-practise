# terraform-practise
This project bla bla

# WARNING
All data stored in the State file is kept in plain text. 
If we include any sensitive data to the state, we have to save it to a remote location with limited access. This can be achieved using a different "Terraform Backend" (https://www.terraform.io/language/settings/backends)

- [Requirements](#requirements)
- [Local testing](#local-testing)
  - [Create resources](#create-resources)
  - [Destroy resources](#destroy-resources)
  - [Pipelines configuration (to be automated)](#pipelines-configuration-to-be-automated)

## Requirements
- Terraform
- Docker

## Local testing
### Create resources
- Spin up a Splunk instance. This step is required if you want to test it against a local Splunk
```
docker run -d -p 8000:8000 -p 8089:8089 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='Password1' splunk/splunk:latest
```
- Create an API token
```
curl -k -u Admin:Password1 -X POST https://localhost:8089/services/authorization/tokens?output_mode=json --data name=Admin --data audience=Creation --data type=static
```
- Set environment variables (replace the _REPLACE_HERE_WITH_THE_API_TOKEN_ with the token generated in the previous step)
```
set TF_VAR_backend_splunk_access_token='REPLACE_HERE_WITH_THE_API_TOKEN'
set TF_VAR_frontend_splunk_access_token='REPLACE_HERE_WITH_THE_API_TOKEN'
```
- Initialise the project working directory. (Execute the following command from the root folder) 
```
terraform init
```
- Create the resources on Splunk
```
terraform apply -var-file='environments/local.tfvars' -auto-approve
```

### Destroy resources
- Create the resources on Splunk
```
terraform destroy -var-file='environments/local.tfvars'
```

## Pipelines configuration (to be automated)

- Set environment variables (replace the REPLACE_HERE_WITH_THE_API_TOKEN_BACKEND and REPLACE_HERE_WITH_THE_API_TOKEN_FRONTEND with the token provided by PEG)
```
set TF_VAR_backend_splunk_access_token='REPLACE_HERE_WITH_THE_API_TOKEN_BACKEND'
set TF_VAR_frontend_splunk_access_token='REPLACE_HERE_WITH_THE_API_TOKEN_FRONTEND'
```
- Initialise the project working directory. (Execute the following command from the root folder) 
```
terraform init
```
- Create a workspace
```
terraform workspace new prod
```
- Select a workspace
```
terraform workspace select prod
```
- Create the resources on Splunk
```
terraform apply -var-file='environments/prod.tfvars' -auto-approve
```
