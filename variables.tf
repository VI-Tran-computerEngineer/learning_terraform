##############################################
# Sensitive data variables
variable "aws_access_key" {
  sensitive = true
}

variable "aws_secret_key" {
  sensitive = true
}


##############################################
# Environment configuration variables
variable "region" {
  default = "us-east-1"
}

variable "environment_instance_type" {
  type = map(string)
  default = {
    "DEV" = "t2.micro",
    "QA" = "t2.micro",
    "STAGE" = "t2.micro",
    "PROD" = "t2.micro"
  }
}
