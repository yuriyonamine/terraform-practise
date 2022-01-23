
module "bingo_system_generic" {
  source = "./modules/bingo_alert"
  providers = {
    splunk.be = splunk.backend
  }

  alert_name                    = "ok1"
  alert_description             = "no descr"
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
  alert_actions                 = "email,webhook"
  alert_webhook_param_url       = "https://url"
}