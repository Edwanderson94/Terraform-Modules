# Arquitetura recomendada

## MVP

Um workflow especializado (`terraform-format.yml`) com jobs independentes no
futuro. O primeiro job usa checkout, Terraform fixado, `fmt -check -recursive`
e verificação de whitespace. Eventos: Pull Requests para `master`/`release/**`
e pushes em `master` limitados a Terraform/workflow.

## Evolução

1. Adicionar job de init/validate por exemplos suportados.
2. Adicionar TFLint em job separado.
3. Separar detecção de módulos impactados e matrix apenas quando o tempo de CI
   justificar a complexidade.
4. Adicionar scanners e documentação como checks independentes.

Não usar `pull_request_target`, secrets de cloud, backend remoto, `apply`,
`destroy`, state ou jobs de publicação neste workflow.
