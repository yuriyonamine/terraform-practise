# terraform-practise
This project bla bla

# WARNING
All data stored in the **_State_** file is kept in plain text. 
If we include any sensitive data to the _**State**_, we have to save it to a remote location with limited access. This can be achieved using a different [_Terraform Backend_ ](https://www.terraform.io/language/settings/backends)

- [Requirements](#requirements)
- [Local testing](#local-testing)
  - [Create resources](#create-resources)
  - [Destroy resources](#destroy-resources)
  - [Pipelines configuration (to be automated)](#pipelines-configuration-to-be-automated)
  - [Include new environment](#include-new-environment)
  - [Exposing new Alert module property](#exposing-new-alert-module-property)
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
- Set environment variables (replace the _**REPLACE_HERE_WITH_THE_API_TOKEN**_ with the token generated in the previous step)
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
- Destroy the resources on Splunk
```
terraform destroy -var-file='environments/local.tfvars'
```

## Pipelines configuration (to be automated)

- Set environment variables (replace the _**REPLACE_HERE_WITH_THE_API_TOKEN_BACKEND**_ and _**REPLACE_HERE_WITH_THE_API_TOKEN_FRONTEND**_ with the token provided by PEG)
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

## Include new environment
- Create a file to hold the properties for the new environment in [here](/environments/)
- Include the new environment to the pipeline

## Exposing new Alert module property
The Alert module sets few properties that are common to all of our alerts. You can find them hardcoded in [here](/modules/bingo_alert/main.tf).
In case you need to make them customizable (per environment or per alert), you can define a new variable in [here](/modules/bingo_alert/variables.tf) and set it in the previous file. After that, the new varianble will be available to be configured in your alerts.
