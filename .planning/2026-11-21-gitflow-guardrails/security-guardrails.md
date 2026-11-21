# Segurança e supply chain

- Permissões são declaradas no nível mínimo (`contents: read` no guardrail atual).
- A origem do PR é comparada ao repositório canônico antes de aceitar o fluxo.
- A publicação futura deve usar permissões de escrita somente no job necessário, com condições de evento restritas.
- Actions devem permanecer em versões explícitas e ser revisadas antes de eventual pinagem por SHA.
- Branch protection/rulesets são controles externos ao YAML e devem exigir os checks; sem isso, o workflow é apenas detectivo.
- Não executar comandos Terraform de `apply`, `destroy`, backend ou state como parte do guardrail.
