# Define the region to deploy the infrastructure
variable "AWS_REGION" {
  description = "The AWS region to create things in."
  # North Virginia
  default     = "us-east-1"
}
# Define the availability zone where you want to deploy the subnet
variable "AWS_ZONE" {
  description = "The AWS availability zone to place subnets"
  # North Virginia zone a
  default     = "us-east-1a"
}

# Version of the runner you want to install, override default value by command line
variable "RUNNER_VERSION"{
  description = "version of the runner you want to install"
  default = "2.287.1"
}


# Repository to associate the runner to, use secret variable from github to override, or pass by command line
variable "RUNNER_REPO"{
  description = "github repository to associate the runner"
  default = "replace_this_with_your_repository"
}

# Workspace for the runner, we assign by the default the actions-runner as path inside the host server as workspace, you can override by command line
variable "RUNNER_PATH"{
  description = "workspace where the runner will be executing commands"
  default = "actions-runner"
}

# Access token for interact with github, use secret variable from github to override, or pass by command line
variable "GITHUB_TOKEN"{
  description = "github token"
  default = "replace_this_with_your_token"
}

# Access token for interact with github organization, use secret variable from github to override, or pass by command line
variable "ORGGITHUB_TOKEN"{
  description = "organization github token"
  default = "replace_this_with_your_organization_token"
}

# Access Controller url for sdp, use the variable from githubflow to override or pass by command line
variable "CONTROLLERURL"{
  description = "Controller Url for SDP"
  #default = "dummy_ControllerUrl"
  default = "appgate://sdpct-001.appgate.com/eyJwcm9maWxlTmFtZSI6IkFHSV9TZXJ2ZXJzX0hlYWRsZXNzIiwic3BhIjp7Im1vZGUiOiJUQ1AiLCJuYW1lIjoiQUdJX1NlcnZlcnNfSGVhZGxlc3MiLCJrZXkiOiI5N2FiMTFlZTE4MjhkYmNhOGYzNWQ1YjE0NzczMzFiNDdlZmM4YWM2YTgyMDk4ZWZjZmQ2ZmE5NTAxNDUzYWU4In0sImNhRmluZ2VycHJpbnQiOiI4MWYyNDNhZjM3NGE5ZDBhZTA4NjJmMmI4YzVmNDc4ZWY5ZjIyOGIwMTRhYWYzNzAzYjY3ZTkzOGEyMzAwNmQ1IiwiaWRlbnRpdHlQcm92aWRlck5hbWUiOiJBR0lfU2VydmVyc19IZWFkbGVzcyJ9"
}

# Username for sdp, use the variable from githubflow to override or pass by command line
variable "USERNAME"{
  description = "Username for SDP"
  #default = "dummy_Username"
  default = "svcesdtpjenkinshl@appgate.com"
}

# Password for sdp, use the variable from githubflow to override or pass by command line
variable "PASSWORD"{
  description = "Password for SDP"
  default = "dummy_Password"
}