# terraform-practise
WARNING
All data stored in the State file is kept in plain text. 
If we include any sensitive data to the state, we have to save it to a remote location with limited access. This can be achieved using a different "Terraform Backend" https://www.terraform.io/language/settings/backends
 
fmt before run
workspace navigation
configured through variables
providers
Split environments
how to test
how to run
requirements

Create a workspaces per environment 
terraform workspace create dev_one
terraform workspace create dev_two
terraform workspace create stg_one
terraform workspace create stg_two
terraform workspace create prod_one
terraform workspace create prod_two



Execution
Set environment variables

$env:TF_VAR_backend_splunk_url='localhost:8089'
$env:TF_VAR_frontend_splunk_url='localhost:8089'
$env:TF_VAR_backend_splunk_access_token='eyJraWQiOiJzcGx1bmsuc2VjcmV0IiwiYWxnIjoiSFM1MTIiLCJ2ZXIiOiJ2MiIsInR0eXAiOiJzdGF0aWMifQ.eyJpc3MiOiJhZG1pbiBmcm9tIGIyMjczOTVjMGFhZCIsInN1YiI6ImFkbWluIiwiYXVkIjoiQmluZ28gQ2hlY2siLCJpZHAiOiJTcGx1bmsiLCJqdGkiOiJjMWEyOGM1MmJkNzMzYTJkN2I5MzE0Mjc2ODg1ZjExOTBjYTNmNmVmMmZkNjlkZTA2ZGY1ODgxZDZlMDFjMDkwIiwiaWF0IjoxNjQyNjcxNDIxLCJleHAiOjE2NDUyNjM0MjEsIm5iciI6MTY0MjY3MTQyMX0.7WdUoUlmOMAXTFTeZ008d7vEAQj2Mzcl7omDVsGGv4frWskl6GTapF6A7s-HytGXrZZpM_-LuAqzu7Rx1yWnQg'
$env:TF_VAR_frontend_splunk_access_token='eyJraWQiOiJzcGx1bmsuc2VjcmV0IiwiYWxnIjoiSFM1MTIiLCJ2ZXIiOiJ2MiIsInR0eXAiOiJzdGF0aWMifQ.eyJpc3MiOiJhZG1pbiBmcm9tIGIyMjczOTVjMGFhZCIsInN1YiI6ImFkbWluIiwiYXVkIjoiQmluZ28gQ2hlY2siLCJpZHAiOiJTcGx1bmsiLCJqdGkiOiJjMWEyOGM1MmJkNzMzYTJkN2I5MzE0Mjc2ODg1ZjExOTBjYTNmNmVmMmZkNjlkZTA2ZGY1ODgxZDZlMDFjMDkwIiwiaWF0IjoxNjQyNjcxNDIxLCJleHAiOjE2NDUyNjM0MjEsIm5iciI6MTY0MjY3MTQyMX0.7WdUoUlmOMAXTFTeZ008d7vEAQj2Mzcl7omDVsGGv4frWskl6GTapF6A7s-HytGXrZZpM_-LuAqzu7Rx1yWnQg'

Select and Apply a configuration to one environment
terraform workspace select dev_one
terraform apply -var-file='environments/dev_one.tfvars'

terraform workspace select stg_one
terraform apply -var-file='environments/stg_one.tfvars'  
...


Destroy resources for an environment

terraform workspace select stg_one
terraform destroy -var-file='environments/stg_one.tfvars'  

