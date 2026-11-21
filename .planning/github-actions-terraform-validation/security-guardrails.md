# Guardrails de segurança

- `permissions: contents: read` no workflow.
- Actions e Terraform usam versões fixadas.
- Sem credenciais, secrets, provider authentication ou acesso de cloud.
- Sem `terraform apply`, `destroy`, `state`, backend migration ou provisionamento.
- Sem `pull_request_target`; o workflow roda no contexto seguro de CI do PR.
- `timeout-minutes` e `concurrency` limitam consumo e execuções obsoletas.
- Validações futuras devem evitar executar módulos com efeitos colaterais e usar
  placeholders somente quando o provider aceitar validação offline.
- A CI deve tratar warnings de runtime das actions como regressões; as versões
  atuais do setup do TFLint e da action Trivy foram escolhidas para evitar as
  versões inválidas/desatualizadas observadas na primeira execução.
