dev_env

Ambiente de desenvolvimento Python padronizado, reprodutível e explícito.

Este repositório define como projetos Python são criados, organizados e utilizados,
evitando retrabalho, conflitos de dependência e decisões repetidas ao longo do tempo.

Ele é a fonte da verdade do fluxo de desenvolvimento.

Filosofia

1 projeto = 1 pasta

1 projeto = 1 .venv

layout src/ sempre

projeto instalado em modo editable (pip install -e .)

tooling simples, previsível e auditável

nada implícito

nada mágico

Decisões conscientes:

sem Snap

sem conda

sem ambientes globais

sem PYTHONPATH manual

Tudo deve ser explícito e reproduzível.

Estrutura do repositório

dev_env/
├── README.md
├── install.sh
├── bash/
│ └── workon.sh
├── scripts/
│ └── newpy
└── templates/
└── python/
└── {{PROJECT_SLUG}}/
├── pyproject.toml
├── README.md
├── src/
│ └── {{PACKAGE_NAME}}/
└── tests/

Instalação em um PC novo
Pré-requisitos

Linux

Python ≥ 3.10 (instalado pelo sistema)

git

bash

Passos

git clone <repo> ~/Projetos/dev_env
cd ~/Projetos/dev_env
./install.sh

Depois, abra um novo terminal ou rode:

source ~/.bashrc

Uso diário
Criar um novo projeto

newpy meu_projeto

Por padrão, isso cria:

~/Projetos/meu_projeto

Com:

.venv criado

projeto instalado em modo editable

layout src/

pyproject.toml configurado

testes básicos (pytest)

placeholders renderizados automaticamente

Também é possível:

newpy meu_projeto --pwd
newpy meu_projeto --dir /algum/caminho
newpy meu_projeto --no-venv
newpy meu_projeto --dry-run

Entrar em um projeto

workon meu_projeto

Isso:

entra na pasta do projeto

ativa o ambiente virtual local

Rodar o projeto

Se existir __main__.py:

python -m meu_projeto

Ou explicitamente:

python -m meu_projeto.main

Rodar testes

pytest

(os testes são instalados via extra [dev] quando definido no template)

Templates

Os templates usados pelo newpy ficam em:

dev_env/templates/

Atualmente:

templates/python/ → template base de projetos Python

Os templates:

não são projetos

não são usados diretamente

são scaffolds parametrizados

são a base de todos os projetos gerados

Adicionar novos templates (pyqt, cli, etc.) é intencionalmente simples.

Portabilidade

Para replicar o ambiente em outro PC:

clonar este repositório

rodar install.sh

abrir um novo terminal

Nada depende de estado oculto ou configuração manual pós-instalação.

Observação final

Este repositório define o fluxo.

Se algo mudar no desenvolvimento:

muda aqui primeiro

depois os projetos seguem

Não o contrário.
