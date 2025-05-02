#!/bin/bash

icon="󰊤"

# Lê o token salvo
GITHUB_TOKEN=$(cat ~/.config/github/token.txt)

# Faz requisição para pegar notificações
count=$(curl -s \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/notifications | jq length)


# Mostra o ícone + número 
if [ "$count" -eq 0 ]; then
  echo "$icon  0"
else
  echo "$icon $count"
fi