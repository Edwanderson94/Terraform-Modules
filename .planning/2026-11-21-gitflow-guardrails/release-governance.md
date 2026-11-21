# Governança de releases

1. Criar branch `release/X.Y.Z` a partir de `master`.
2. Promover branches de trabalho para a release por PR, com guardrail e CI obrigatórios.
3. Promover a release para `master` por PR, com os mesmos checks e revisão exigida.
4. Após o merge, criar a tag `vX.Y.Z` exclusivamente no commit resultante de `master`.
5. Publicar a release a partir da tag imutável, com notas derivadas do histórico revisado.

## Regras de segurança

- Nenhuma credencial ou token deve ser gravado no repositório ou no Trello.
- O workflow de validação usa `contents: read`; escrita só deve existir em um job de publicação isolado.
- Tags históricas não devem ser recriadas, movidas ou apagadas.
- O job de publicação deve rejeitar tag existente, versão inválida e divergência entre `master` e o merge commit.
