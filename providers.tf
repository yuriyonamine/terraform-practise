provider "splunk" {
  alias                = "frontend"
  url                  = "localhost:8089"
  auth_token           = "eyJraWQiOiJzcGx1bmsuc2VjcmV0IiwiYWxnIjoiSFM1MTIiLCJ2ZXIiOiJ2MiIsInR0eXAiOiJzdGF0aWMifQ.eyJpc3MiOiJhZG1pbiBmcm9tIGIyMjczOTVjMGFhZCIsInN1YiI6ImFkbWluIiwiYXVkIjoiQmluZ28gQ2hlY2siLCJpZHAiOiJTcGx1bmsiLCJqdGkiOiJjMWEyOGM1MmJkNzMzYTJkN2I5MzE0Mjc2ODg1ZjExOTBjYTNmNmVmMmZkNjlkZTA2ZGY1ODgxZDZlMDFjMDkwIiwiaWF0IjoxNjQyNjcxNDIxLCJleHAiOjE2NDUyNjM0MjEsIm5iciI6MTY0MjY3MTQyMX0.7WdUoUlmOMAXTFTeZ008d7vEAQj2Mzcl7omDVsGGv4frWskl6GTapF6A7s-HytGXrZZpM_-LuAqzu7Rx1yWnQg"
  insecure_skip_verify = true
}

# provider "splunk" {
#   alias                = "backend"
#   url                  = "localhost:8089"
#   auth_token           = "eyJraWQiOiJzcGx1bmsuc2VjcmV0IiwiYWxnIjoiSFM1MTIiLCJ2ZXIiOiJ2MiIsInR0eXAiOiJzdGF0aWMifQ.eyJpc3MiOiJhZG1pbiBmcm9tIGIyMjczOTVjMGFhZCIsInN1YiI6ImFkbWluIiwiYXVkIjoiQmluZ28gQ2hlY2siLCJpZHAiOiJTcGx1bmsiLCJqdGkiOiJjMWEyOGM1MmJkNzMzYTJkN2I5MzE0Mjc2ODg1ZjExOTBjYTNmNmVmMmZkNjlkZTA2ZGY1ODgxZDZlMDFjMDkwIiwiaWF0IjoxNjQyNjcxNDIxLCJleHAiOjE2NDUyNjM0MjEsIm5iciI6MTY0MjY3MTQyMX0.7WdUoUlmOMAXTFTeZ008d7vEAQj2Mzcl7omDVsGGv4frWskl6GTapF6A7s-HytGXrZZpM_-LuAqzu7Rx1yWnQg"
#   insecure_skip_verify = true
# }