provider "aws" {
  alias = "certificate"

  # retrieve the access key from the variables
  access_key = "${var.aws_access_key}"
  # retrieve the access secret from the variables
  secret_key = "${var.aws_secret_key}"
  # retrieve the region from the variables
  region = "us-east-1"  
}
