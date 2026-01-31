#!/usr/bin/env bash
set -e

echo "Instalando ambiente de desenvolvimento..."

# garantir pastas base
mkdir -p "$HOME/Projetos"

# bashrc
if ! grep -q "dev_env/bash/workon.sh" "$HOME/.bashrc"; then
  echo "Configurando bashrc..."
  {
    echo ""
    echo "# Dev environment"
    echo 'source "$HOME/Projetos/dev_env/bash/workon.sh"'
    echo 'export PATH="$HOME/Projetos/dev_env/scripts:$PATH"'
  } >> "$HOME/.bashrc"
fi

echo "Pronto."
echo "Abra um novo terminal ou rode: source ~/.bashrc"
