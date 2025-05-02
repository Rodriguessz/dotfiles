#!/bin/bash

icon="󱧘"  # Ícone de atualização
# icon="󰮯"

# Verifica se o checkupdates está instalado
if ! command -v checkupdates &>/dev/null; then
  echo "$icon ??"
  exit 1
fi

# Conta as atualizações
updates=$(checkupdates 2>/dev/null | wc -l)

# Exibe com ícone
if [ "$updates" -eq 0 ]; then
  echo "$icon 0"
else
  echo "$icon  $updates"
fi
