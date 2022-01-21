resource "splunk_data_ui_views" "dashboard" {
  provider = splunk.backend

  name     = "Terraform_Test_Dashboard1"
  eai_data = <<EOF
  <dashboard>
    <label>Terraform Test Dashboard</label>
    <row>
      <panel>
        <event>
          <title>ae</title>
          <search>
            <query>makeresults 10 | stats count as total</query>
            <earliest>-24h@h</earliest>
            <latest>now</latest>
          </search>
          <option name="list.drilldown">none</option>
        </event>
      </panel>
    </row>
  </dashboard>
  EOF
  acl {
    owner   = "nobody"
    sharing = "app"
    app     = "search"
    read    = ["*"]
  }
}