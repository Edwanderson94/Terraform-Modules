module "secret_manager" {
  source = "../../aws/secret-manager"

  secrets = {
    "azuredevops/terraform/" = "password123"
  }

  region = "sa-east-1"
}

output "created_secret_ids" {
  value = module.secret_manager.secret_ids
}