# Steering — módulos Terraform

## Arquitetura

- Mantenha módulos reutilizáveis em pastas por provider/domínio, como
  `azure_devops/pipelines` e `oci/object-storage-bucket`.
- Módulos não devem embutir nomes de organizações, projetos, contas, ambientes,
  caminhos de repositórios consumidores ou credenciais.
- A configuração do provider e a autenticação ficam no consumidor. Módulos
  declaram `required_providers` e limites compatíveis, mas não configuram
  `provider` blocks.
- Consumidores resolvem recursos preexistentes e passam IDs ao módulo; o módulo
  gerencia somente os recursos explicitamente pertencentes ao seu escopo.

## Contrato e compatibilidade

- Declare tipos, descrições, defaults e validações para todos os inputs.
- Exponha somente outputs úteis e estáveis.
- Preserve a compatibilidade com as versões de provider já fixadas pelos
  consumidores; não atualize provider ou state implicitamente.
- Documente proteções `lifecycle`, incluindo `prevent_destroy`, e seu processo
  explícito de exceção quando recursos armazenam dados persistentes.
- Evite `null_resource`/provisioners e efeitos colaterais fora do provider.
- Documente comportamento de triggers, importação, destruição e execução inicial.

## Segurança e operações

- Não aceite segredos como inputs quando a autenticação deve ser feita pelo
  provider. Nunca imprima ou persista credenciais.
- Não execute `apply`, `destroy`, migração de backend ou comandos de state ao
  desenvolver/validar módulos sem aprovação explícita do usuário.
- Não use `-target` como fluxo normal nem desabilite locking.
- Antes de provisionar, reveja um plano salvo e confirme conta/projeto/ambiente,
  recursos existentes, state e dependências.

## Publicação e consumo

- Fixe módulos em tags ou commits imutáveis para ambientes compartilhados.
- Branches podem ser usadas apenas no desenvolvimento/teste e devem ser
  substituídas por referência imutável antes de um fluxo protegido.
- Mantenha exemplos pequenos e sem segredos; credenciais entram por env vars ou
  secret store.
- Valide HCL e documentação antes de publicar; preserve mudanças não relacionadas
  no worktree.
