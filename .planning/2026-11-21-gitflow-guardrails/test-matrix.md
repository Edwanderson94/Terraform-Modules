# Matriz de testes

| Caso | Base | Head | Resultado esperado | Tipo |
|---|---|---|---|---|
| Feature para release | `release/1.6.0` | `feature/add-module` | Passa | Positivo |
| Fix para release | `release/1.6.0` | `fix/bug` | Passa | Positivo |
| Hotfix para release | `release/1.5.1` | `hotfix/security` | Passa | Positivo |
| Release para master | `master` | `release/1.6.0` | Passa | Positivo |
| Feature direto para master | `master` | `feature/add-module` | Falha | Negativo |
| Release não versionada | `release/latest` | `feature/add-module` | Falha | Negativo |
| Trabalho não permitido | `release/1.6.0` | `experiment/foo` | Falha | Negativo |
| Fork | qualquer destino permitido | branch em outro repositório | Falha | Negativo |
| Tag `v1.5.0` | — | SemVer básico válido | Passa | Positivo |
| Versão `v1.6` | — | SemVer incompleto | Falha | Negativo |
| Versão `v1.6.0-rc.1` | — | Pré-release não permitido na política atual | Falha | Negativo |

O harness local `test-gitflow-guardrails.sh` executa os casos de fluxo e título sem rede. Os testes reais via GitHub Actions exigem publicar o workflow em uma branch/PR de teste; permanecem pendentes por restrição de não fazer push sem autorização específica.
