<!-- BEGIN_TF_DOCS -->
# Repositório Terraform - Documentação Principal.

Bem-vindo à documentação deste repositório Terraform! Este espaço foi criado para compartilhar os conhecimentos que adquiri ao longo da minha jornada como **DevOps** e **SRE**, explorando o uso dessa poderosa ferramenta de **infraestrutura como código**.

## Objetivo

Este repositório tem como objetivo centralizar documentações, projetos pessoais, desenvolvimentos e exemplos práticos relacionados ao uso do **Terraform**. Aqui você encontrará:

- **Projetos Pessoais**: Provisionamento de recursos, desenvolvimentos, estudos e testes.
- **Guia de Comandos**: Facilitando o uso do Terraform.
- **Estruturas de Implementação**: Aplicadas em plataformas como:
  - **Azure DevOps**

---

### Azure DevOps

O **Azure DevOps** é um conjunto de ferramentas e serviços da Microsoft voltado para o gerenciamento completo do ciclo de vida do desenvolvimento de software, com foco em integração contínua (CI), entrega contínua (CD) e colaboração entre equipes de desenvolvimento. Ele oferece uma plataforma baseada em nuvem usada para planejar, construir, testar e implantar aplicações, automatizando e agilizando os fluxos de trabalho das equipes.

#### Organização

No **Azure DevOps**, uma **Organization** (Organização) é a unidade de gerenciamento principal, agrupando todos os recursos, equipes e projetos dentro da plataforma. Ela organiza e gerencia o acesso a diversos projetos e recursos, como repositórios de código, pipelines de CI/CD, boards de tarefas, testes, entre outros. 

Atualmente, a minha organização no Azure DevOps é chamada **Tecnoform**.

#### Project

No **Azure DevOps**, um **Project** (Projeto) é uma estrutura dentro de uma organização que contém todos os artefatos e recursos necessários para gerenciar o desenvolvimento de software de uma equipe ou produto específico. Ele serve como um contêiner para organizar, controlar e permitir o acesso a funcionalidades dentro do Azure DevOps, como repositórios de código, pipelines de CI/CD, boards de tarefas, test suites, entre outros.

#### Azure Repos

**Azure Repos** é um serviço do **Azure DevOps** que oferece repositórios de código-fonte Git (ou **Team Foundation Version Control - TFVC**) para armazenar e versionar o código de uma aplicação. Ele é fundamental para o ecossistema do Azure DevOps, fornecendo um local centralizado onde as equipes podem armazenar, gerenciar e colaborar no desenvolvimento de software de forma eficiente. O **Azure Repos** é uma das principais ferramentas dentro de uma **Organization** no Azure DevOps e interage de forma integrada com outros serviços da plataforma.

---

# Estrutura de Pastas  

Abaixo está a estrutura de diretórios e arquivos do projeto:  

```plaintext
.
├── azure-devops/
│   ├── organizations/
│   │   ├── tecnoform/
│   │   │   ├── terragrunt.hcl         # Configuração global do Terragrunt.
│   │   │   ├── projects/
│   │   │   │   ├── infraestructure/
│   │   │   │   ├── terragrunt.hcl     # Configuração do Terragrunt para o projeto.
│   │   │   │   ├── docs/
├── README.md                          # Documentação principal do repositório.

```

---

# Considerações Finais

Neste projeto, tive a oportunidade de aprofundar meus conhecimentos em **Terraform** e **Terragrunt**, além de evoluir nos processos e fluxos de trabalho dessas ferramentas. O próximo passo é expandir ainda mais o uso dessas tecnologias, com a integração de novos módulos, visando a automação dos recursos no **Azure DevOps**.

## Licença

Este módulo está licenciado sob a licença **MIT**. Para mais informações, consulte o arquivo [LICENSE](./LICENSE).

## Contribuição

Contribuições são sempre bem-vindas! Se você deseja colaborar, siga os seguintes passos:

1. Envie pull requests com suas alterações ou melhorias.
2. Caso encontre algum erro ou tenha sugestões, crie uma *issue* no repositório.

Agradecemos pela sua colaboração e interesse!

## Agradecimentos

Gostaria de expressar minha sincera gratidão a todos os colegas e amigos que, ao longo da minha jornada profissional, me ensinaram, ajudaram e acreditaram no meu potencial. Graças a vocês, pude aprender e compartilhar um pouco do conhecimento que agora divido com todos que consomem este conteúdo.

Um agradecimento especial à minha esposa, que sempre me apoiou e compreendeu os momentos em que estive ausente, dedicando meu tempo aos desenvolvimentos e conteúdos apresentados aqui. Sua compreensão e suporte foram essenciais para que eu pudesse seguir nesse caminho.

---

**Desenvolvido por**  
Edwanderson Luiz Pereira

<!-- END_TF_DOCS -->
