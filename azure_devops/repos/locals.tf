locals {
  module_version = "1.3.2"
}

locals {
  repositories_map = {
    for key, repo in var.repositories :
    key => {
      name           = repo.name
      default_branch = repo.default_branch
    }
  }

  repository_branches = distinct(var.repository_branches)
}
