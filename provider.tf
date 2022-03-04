provider "aws" {
  region = "${var.AWS_REGION}"
  #Local profile with the credentials to aws cli
  profile = "DTP_TEST"
  default_tags {
    tags = {
      Environment = "Testing"
      Owner       = "Devops"
      Type        = "Terraform"
    }
  }
}

