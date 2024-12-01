module "secret_manager" {
  source = "github.com/Edwanderson94/Terraform-Modules//aws/terraform-aws-secretmanager?ref=develop"

  secrets = {
    "azuredevops/terraform/" = "password123"
  }

  region = "sa-east-1"
}

output "created_secret_ids" {
  value = module.secret_manager.secret_ids
}