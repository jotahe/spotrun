# This terraform script permits the provision of a github runner in a spot instance
Prerequisites:
- Terraform
- AWS provider configured with the credentials so tf can interact with aws
- Github token to interact with the api, with admin privileges over the organization or repository
- Credential and parameters for the sdp headless client

### In order to use it you have to override some variables
´´´terraform apply -var GITHUB_TOKEN="personal_github_accesstoken" -var CONTROLLERURL="ControllerUrl_for_sdp -var USERNAME = "Username_for_sdp -var PASSWORD = "Password_for_sdp" -var RUNNER_REPO = "runner_to_which_repo" -var RUNNER_PATH = "path_install_runner" -var RUNNER_VERSION= "linuxver_runner_toinstall"´´´

### Minimum variables
´´´terraform apply -var GITHUB_TOKEN="personal_github_accesstoken" -var PASSWORD = "Password_for_sdp" -var RUNNER_REPO = "runner_to_which_repo"´´´
