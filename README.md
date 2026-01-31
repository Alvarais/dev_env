# dev_env

Ambiente de desenvolvimento Python padronizado e reprodutível.

Este repositório define como os projetos Python são criados, organizados e utilizados,
evitando retrabalho, conflitos de dependência e decisões repetidas.

## Filosofia

- 1 projeto = 1 pasta
- 1 projeto = 1 .venv
- layout src/ sempre
- projeto instalado em editable (pip install -e .)
- sem Snap
- sem conda
- tudo explícito e reproduzível

## Estrutura

dev_env/
├── README.md          (este arquivo)
├── install.sh         (bootstrap do ambiente)
├── bash/
│   └── workon.sh      (função de shell para entrar em projetos)
├── scripts/
│   └── newpy          (criação de novos projetos Python)
└── python_template/   (template base de projetos)

## Instalação em um PC novo

Pré-requisitos:
- Linux
- Python 3.10+ instalado pelo sistema
- git
- bash

Passos:

git clone <repo> ~/Projetos/dev_env
cd ~/Projetos/dev_env
./install.sh

Depois, abra um novo terminal ou rode:

source ~/.bashrc

## Uso diário

### Criar um novo projeto

newpy meu_projeto

Isso cria o projeto em:

~/Projetos/meu_projeto

Com:
- .venv criado
- projeto instalado em editable
- estrutura src/
- pyproject.toml configurado

### Entrar em um projeto e ativar o venv

workon meu_projeto

Isso:
- entra na pasta do projeto
- ativa o ambiente virtual local

### Rodar o projeto

python -m meu_projeto.main

Ou, se existir __main__.py:

python -m meu_projeto

## Template Python

O template usado pelo newpy fica em:

dev_env/python_template/

Ele define:
- layout do projeto
- arquivos base
- padrão de execução

O template não é usado diretamente.
Ele é copiado a cada novo projeto.

## Decisões importantes

- Não usar Snap para ferramentas de desenvolvimento
- Não usar ambientes virtuais globais
- Não usar PYTHONPATH manual
- Não misturar versões de Python sem necessidade

Essas decisões são intencionais.

## Portabilidade

Para replicar este ambiente em outro PC:

1. clonar este repositório
2. rodar install.sh
3. abrir um novo terminal

Nada depende de estado oculto.

## Observação final

Este repositório é a fonte da verdade do ambiente.
Se algo mudar no fluxo, muda aqui primeiro.

