variable "alert_name" {
  type        = string
  description = "Alert name displayed to the end user"
}

variable "alert_description" {
  type        = string
  description = "Alert description"
}

variable "alert_search" {
  type        = string
  description = "Alert search string"
}

variable "alert_emails_to" {
  type        = string
  description = "Emails to be notified about the alert"
}

variable "alert_type" {
  type        = string
  description = "Alert type (custom, number of events)"
}

variable "alert_condition" {
  type        = string
  description = "Condition used to decide if the alert will be triggered or not."
  default = ""
}

variable "alert_comparator" {
  type        = string
  description = "Comparator used to evaluate if the alert should be triggered. (greater than, less than, equal to, rises by, drops by, rises by perc, drops by percUsed with alert_threshold to trigger alert actions)"
}

variable "alert_treshold" {
  type        = string
  description = "Defines the alert treshold"
}

variable "alert_expire_time" {
  type        = string
  description = "Defines the alert expiration time. (e.g. 10d)"
}

variable "alert_cron_schedule" {
  type        = string
  description = "Defines when the alert will be triggered (e.g. */20 * * * *)"
}

variable "alert_search_range_start_time" {
  type        = string
  description = "Defines the start time used in your search (e.g. -20m)"
}

variable "alert_search_range_end_time" {
  type        = string
  description = "Defines the end time used in your search (e.g. now)"
}

variable "alert_actions" {
  type        = string
  description = "Defines the actions to be triggered when the alert conditions are met (e.g. emai)"
}

variable "alert_webhook_param_url" {
  type        = string
  description = "URL where Splunk will send the alert notification"
  default = null
}