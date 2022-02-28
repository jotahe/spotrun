provider "aws" {
  region = "${var.aws_region}"
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

