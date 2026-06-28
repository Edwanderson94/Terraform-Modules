locals {
  module_version = "1.1.0"
}

locals {
  repositories_map = {
    for key, repo in var.repositories :
    key => {
      name           = repo.name
      default_branch = repo.default_branch
    }
  }
}
