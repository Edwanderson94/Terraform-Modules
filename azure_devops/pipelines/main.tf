resource "azuredevops_build_definition" "this" {
  project_id      = var.project_id
  name            = var.name
  path            = var.path
  agent_pool_name = var.agent_pool_name
  queue_status    = var.queue_status

  repository {
    repo_type   = "TfsGit"
    repo_id     = var.repository_id
    branch_name = var.branch_name
    yml_path    = var.yml_path
  }

  # Triggers are deliberately controlled by the YAML file, so the module
  # doesn't introduce an independent CI trigger during definition creation.
  ci_trigger {
    use_yaml = true
  }

  features {
    skip_first_run = true
  }
}
