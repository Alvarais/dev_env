# workon: entrar em projeto e ativar venv local

workon() {
  local PROJECT="${1:-}"
  local BASE="$HOME/Projetos"
  local DIR="$BASE/$PROJECT"

  if [[ -z "$PROJECT" ]]; then
    echo "Uso: workon <nome-do-projeto>"
    return 1
  fi

  if [[ ! -d "$DIR" ]]; then
    echo "Projeto não encontrado: $DIR"
    return 2
  fi

  cd "$DIR" || {
    echo "Erro ao entrar no diretório: $DIR"
    return 3
  }

  if [[ -f ".venv/bin/activate" ]]; then
    # shellcheck disable=SC1091
    source ".venv/bin/activate"
    echo "Ambiente ativado: $PROJECT"
  else
    echo "Aviso: .venv não encontrado em $DIR"
  fi
}

