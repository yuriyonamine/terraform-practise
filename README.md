# terraform-practise
This project bla bla

# WARNING
All data stored in the State file is kept in plain text. 
If we include any sensitive data to the state, we have to save it to a remote location with limited access. This can be achieved using a different "Terraform Backend" (https://www.terraform.io/language/settings/backends)

- [Requirements](#requirements)
- [Create resources](#create-resources)
- [Destroy resources](#destroy-resources)

## Requirements
- Terraform
- Docker

## Create resources 
- (Optional) Spin up a Splunk instance. This step is required if you want to test it against a local Splunk
```
docker run -d -p 8000:8000 -p 8089:8089 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='Password1' splunk/splunk:latest
```
- Create an API token
```
curl -k -u Admin:Password1 -X POST https://localhost:8089/services/authorization/tokens?output_mode=json --data name=Admin --data audience=Creation --data type=static
```
- Set environment variables (replace the _REPLACE_HERE_WITH_THE_API_TOKEN_ with the token generated in the previous step)
```
set TF_VAR_backend_splunk_url='localhost:8089'
set TF_VAR_frontend_splunk_url='localhost:8089'
set TF_VAR_backend_splunk_access_token='REPLACE_HERE_WITH_THE_API_TOKEN'
set TF_VAR_frontend_splunk_access_token='REPLACE_HERE_WITH_THE_API_TOKEN'
```
- Initialise the project working directory. (Execute the following command from the root folder) 
```
- terraform init
```
- Select an workspace
```
terraform workspace select dev_one
```
- Create the resources on Splunk
```
terraform apply -var-file='environments/dev_one.tfvars'
```

## Destroy resources
- Create the resources on Splunk
```
terraform destroy -var-file='environments/dev_one.tfvars'
```

