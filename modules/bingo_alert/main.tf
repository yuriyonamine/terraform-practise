terraform {
  required_providers {
    splunk = {
      source  = "splunk/splunk"
      version = "1.4.9"
    }
  }
}

resource "splunk_saved_searches" "alert" {
  name                              = var.alert_name
  description                       = var.alert_description
  search                            = var.alert_search
  disabled                          = false
  is_scheduled                      = true
  is_visible                        = true
  realtime_schedule                 = false
  actions                           = var.alert_actions
  action_email_format               = "table"
  action_email_to                   = var.alert_emails_to
  alert_comparator                  = var.alert_comparator
  alert_condition                   = var.alert_condition
  alert_digest_mode                 = true
  alert_expires                     = var.alert_expire_time
  alert_threshold                   = var.alert_treshold
  alert_type                        = var.alert_type
  cron_schedule                     = var.alert_cron_schedule
  dispatch_earliest_time            = var.alert_search_range_start_time
  dispatch_latest_time              = var.alert_search_range_end_time
  action_email_include_search       = 1
  action_email_include_results_link = 1
  action_email_include_trigger      = 1
  action_email_include_trigger_time = 1
  action_email_include_view_link    = 1
  action_webhook_param_url          = var.alert_webhook_param_url
  acl {
    owner   = "nobody"
    sharing = "app"
    app     = "search"
    read    = ["*"]
  }
}