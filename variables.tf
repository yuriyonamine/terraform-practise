variable backend_splunk_url {
    description = "Splunk (backend) API URL"
    type = string
}

variable backend_splunk_access_token {
    description = "Token to access Splunk (backend) API"
    sensitive = true
    type = string
} 

variable frontend_splunk_url {
    description = "Splunk (frontend) API URL"
    type = string
}

variable frontend_splunk_access_token {
    description = "Token to access Splunk (frontend) API"
    sensitive = true
    type = string
} 

variable "system_generic_errors_alert_create" {
  type        = number
  description = "Create alert. (0 means no alert will be created and 1 will only create 1 instance)"
  default = 1
}

variable "system_aggregator_errors_alert_create" {
  type        = number
  description = "Create alert. (0 means no alert will be created and 1 will only create 1 instance)"
  default = 1
}

variable "fe_system_generic_errors_alert_create" {
  type        = number
  description = "Create alert. (0 means no alert will be created and 1 will only create 1 instance)"
  default = 1
}

variable "fe_system_aggregator_errors_alert_create" {
  type        = number
  description = "Create alert. (0 means no alert will be created and 1 will only create 1 instance)"
  default = 1
}