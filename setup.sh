#!/bin/bash
################# Cleanup ################
echo "- Removing old local Terraform State"
rm -rf terraform.tfstate.d/local

echo "- Removing old Splunk container"
docker stop local_splunk
###########################################

########## Extract docker host ip #########
echo "- Configuring docker host"
docker_host=$(docker context inspect default | jq -r .[0].Endpoints.docker.Host)

if [[ $docker_host == tcp://* ]]; then
    docker_host_ip=$(echo $docker_host | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
else
    docker_host_ip="localhost"
fi
############################################

###### Splunk container configuration #####
echo "- Creating new Splunk container"
docker run --rm -d --name local_splunk -p 8000:8000 -p 8089:8089 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='Password1' splunk/splunk:latest

status=""
echo "- Initialising Splunk..."
while [[ $status != "200"  ]]
do
    sleep 5;
    #Enable token authentication
    status=$(curl -s -o /dev/null -w "%{http_code}"  -k -u "Admin:Password1" -X POST "https://$docker_host_ip:8089/services/admin/token-auth/tokens_auth?output_mode=json" -d disabled=false)
done

api_token=""
echo "- Creating new authentication API token"
while [ -z "$api_token" ] || [ "$api_token" = "null" ]
do
    sleep 5;
    api_token=$(curl -s -k -u "Admin:Password1" -X POST "https://$docker_host_ip:8089/services/authorization/tokens?output_mode=json" --data name=Admin --data audience=Creation --data type=static | jq -r .entry[0].content.token)
    echo $api_token
done
###########################################

######## Set environment variables #########
echo "- Exporting Splunk host and token API environment variables"
export TF_VAR_backend_splunk_access_token="$api_token"
export TF_VAR_frontend_splunk_access_token="$api_token"
export TF_VAR_backend_splunk_url="$docker_host_ip:8089"
export TF_VAR_frontend_splunk_url="$docker_host_ip:8089"
#############################################


echo "Access Splunk on https://$docker_host_ip:8000"