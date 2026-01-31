# workon: entrar em projeto e ativar venv local

workon() {
  local PROJECT="$1"
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

  cd "$DIR" || return 3

  if [[ -f ".venv/bin/activate" ]]; then
    source ".venv/bin/activate"
    echo "Ambiente ativado: $PROJECT"
  else
    echo "Aviso: .venv não encontrado"
  fi
}
