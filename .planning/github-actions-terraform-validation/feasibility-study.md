# Estudo de viabilidade

## Diagnóstico

A automação é viável para checks estáticos e validação offline, mas não para
provisionamento. O repositório é pequeno o suficiente para começar com uma
execução completa de formatação e evoluir depois para validação por exemplo.

## Estratégias

| Estratégia | Vantagem | Risco | Decisão |
| --- | --- | --- | --- |
| Completa | Cobertura simples e previsível | Mais minutos conforme crescer | Adequada ao MVP para fmt |
| Incremental | Menor custo em PRs | Detecção de dependências e arquivos compartilhados é complexa | Evolução posterior |
| Híbrida | Equilibra cobertura e custo | Exige regras de evento mais complexas | Recomendação futura |

Recomendação: começar completa para `fmt`; adicionar validação incremental de
exemplos somente após mapear dependências e resolver requisitos de provider.

## Custos e manutenção

O Passo 1 usa um único runner, sem credenciais, sem artifacts e sem chamadas a
APIs de cloud. A manutenção principal será atualizar versões fixadas do
Terraform e das actions, acompanhando o GitFlow e os providers suportados.
