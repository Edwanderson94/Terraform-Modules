module "iam" {
  source = "./.."

  users = {
    svc_codex = {
      name = "svc_codex"
    }
  }
}
