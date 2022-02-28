# Define the region to deploy the infrastructure
variable "aws_region" {
  description = "The AWS region to create things in."
  # North Virginia
  default     = "us-east-1"
}
# Define the availability zone where you want to deploy the subnet
variable "aws_zone" {
  description = "The AWS availability zone to place subnets"
  # North Virginia zone a
  default     = "us-east-1a"
}

# Access token for interact with github, use secret variable from github to override, or pass by command line
variable "github_token"{
  description = "github token"
  default = "replace_this_with_your_token"
}

# Access token for interact with github organization, use secret variable from github to override, or pass by command line
variable "orggithub_token"{
  description = "organization github token"
  default = "replace_this_with_your_organization_token"
}

# Access Controller url for sdp, use the variable from githubflow to override or pass by command line
variable "ControllerUrl"{
  description = "Controller Url for SDP"
  #default = "dummy_ControllerUrl"
  default = "appgate://sdpct-001.appgate.com/eyJwcm9maWxlTmFtZSI6IkFHSV9TZXJ2ZXJzX0hlYWRsZXNzIiwic3BhIjp7Im1vZGUiOiJUQ1AiLCJuYW1lIjoiQUdJX1NlcnZlcnNfSGVhZGxlc3MiLCJrZXkiOiI5N2FiMTFlZTE4MjhkYmNhOGYzNWQ1YjE0NzczMzFiNDdlZmM4YWM2YTgyMDk4ZWZjZmQ2ZmE5NTAxNDUzYWU4In0sImNhRmluZ2VycHJpbnQiOiI4MWYyNDNhZjM3NGE5ZDBhZTA4NjJmMmI4YzVmNDc4ZWY5ZjIyOGIwMTRhYWYzNzAzYjY3ZTkzOGEyMzAwNmQ1IiwiaWRlbnRpdHlQcm92aWRlck5hbWUiOiJBR0lfU2VydmVyc19IZWFkbGVzcyJ9"
}

# Username for sdp, use the variable from githubflow to override or pass by command line
variable "Username"{
  description = "Username for SDP"
  #default = "dummy_Username"
  default = "svcesdtpjenkinshl@appgate.com"
}

# Password for sdp, use the variable from githubflow to override or pass by command line
variable "Password"{
  description = "Password for SDP"
  default = "dummy_Password"
}