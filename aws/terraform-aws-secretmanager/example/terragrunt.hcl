terraform {
  source = "github.com/Edwanderson94/Terraform-Modules//aws/terraform-aws-secretmanager?ref=develop"
}

inputs = {
  aws_profile = "default"
  region      = "sa-east-1"
  secrets = {
    "azuredevops/terraform/" = "password123"
  }
}