# Exemplo de Variable Group

Este exemplo corresponde ao módulo publicado na release `1.4.2` e usa um
projeto Azure DevOps existente. O provider e o PAT devem ser configurados fora
do código.

O exemplo resolve um projeto Azure DevOps existente e cria um Variable Group
com uma variável não secreta. Forneça o PAT por variável de ambiente ou secret
store; não crie um arquivo `*.tfvars` com credenciais.
