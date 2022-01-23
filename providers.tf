provider "splunk" {
  alias                = "backend"
  url                  = var.backend_splunk_url
  auth_token           = var.backend_splunk_access_token
  insecure_skip_verify = true
}

provider "splunk" {
  alias                = "frontend"
  url                  = var.frontend_splunk_url
  auth_token           = var.frontend_splunk_access_token
  insecure_skip_verify = true
}

#eyJraWQiOiJzcGx1bmsuc2VjcmV0IiwiYWxnIjoiSFM1MTIiLCJ2ZXIiOiJ2MiIsInR0eXAiOiJzdGF0aWMifQ.eyJpc3MiOiJhZG1pbiBmcm9tIGIyMjczOTVjMGFhZCIsInN1YiI6ImFkbWluIiwiYXVkIjoiQmluZ28gQ2hlY2siLCJpZHAiOiJTcGx1bmsiLCJqdGkiOiJjMWEyOGM1MmJkNzMzYTJkN2I5MzE0Mjc2ODg1ZjExOTBjYTNmNmVmMmZkNjlkZTA2ZGY1ODgxZDZlMDFjMDkwIiwiaWF0IjoxNjQyNjcxNDIxLCJleHAiOjE2NDUyNjM0MjEsIm5iciI6MTY0MjY3MTQyMX0.7WdUoUlmOMAXTFTeZ008d7vEAQj2Mzcl7omDVsGGv4frWskl6GTapF6A7s-HytGXrZZpM_-LuAqzu7Rx1yWnQg