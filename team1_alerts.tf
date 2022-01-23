
module "fe_system_generic_errors" {
  source = "./modules/bingo_alert"
  count                         = var.fe_system_generic_errors_alert_create
  providers = {
    splunk = splunk.frontend
  }

  alert_name                    = "(FE) Generic Errors"
  alert_description             = "Generic errors"
  alert_search                  = "| makeresults count=15 | stats count as total"
  alert_emails_to               = "yu@hotmail.com,yu@gmail.com"
  alert_type                    = "custom"
  alert_condition               = "search total > 11"
  alert_comparator              = "greater than"
  alert_expire_time             = "30d"
  alert_treshold                = "0"
  alert_cron_schedule           = "*/1 * * * *"
  alert_search_range_start_time = "-20m"
  alert_search_range_end_time   = "now"
  alert_actions                 = "email, webhook"
  alert_webhook_param_url       = "https://url"
}


module "fe_system_aggregator_errors" {
  source = "./modules/bingo_alert"
  count                         = var.fe_system_aggregator_errors_alert_create
  providers = {
    splunk = splunk.frontend
  }

  alert_name                    = "(FE) Other errors"
  alert_description             = "Errors related to"
  alert_search                  = "| makeresults count=15 | stats count as total"
  alert_emails_to               = "yu@hotmail.com,yu@gmail.com"
  alert_type                    = "number of events"
  alert_comparator              = "greater than"
  alert_expire_time             = "10d"
  alert_treshold                = "0"
  alert_cron_schedule           = "*/1 * * * *"
  alert_search_range_start_time = "-10m"
  alert_search_range_end_time   = "now"
  alert_actions                 = "email"
}