#!/usr/bin/env bash
set -euo pipefail

echo "Instalando ambiente de desenvolvimento..."

# garantir pasta base
mkdir -p "$HOME/Projetos"

BASHRC="$HOME/.bashrc"
DEV_ENV_DIR="$HOME/Projetos/dev_env"

# evitar duplicar configuração
if ! grep -q "dev_env/bash/workon.sh" "$BASHRC"; then
  echo "Configurando bashrc..."
  {
    echo ""
    echo "# Dev environment"
    echo "if [ -f \"$DEV_ENV_DIR/bash/workon.sh\" ]; then"
    echo "  source \"$DEV_ENV_DIR/bash/workon.sh\""
    echo "fi"
    echo "export PATH=\"$DEV_ENV_DIR/scripts:\$PATH\""
  } >> "$BASHRC"
else
  echo "bashrc já configurado, nada a fazer."
fi

echo "Pronto."
echo "Abra um novo terminal ou rode: source ~/.bashrc"

