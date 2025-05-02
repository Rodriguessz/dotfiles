#!/bin/bash

# Usuário do github
USER=$(cat ~/.config/github/username.txt)
TOKEN=$(cat ~/.config/github/token.txt)


# Define o ano atual
YEAR=$(date +'%Y')


#Recupera todos os repositórios (somente o nome)
repos=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/users/$USER/repos | jq -r '.[].name')

# Total de commits
total_commits=0

# Para cada repositório, busque os commits do ano atual
for repo in $repos; do
  commits_count=$(curl -s "https://api.github.com/repos/$USER/$repo/commits?since=${YEAR}-01-01T00:00:00Z&until=${YEAR}-12-31T23:59:59Z" | jq length)
  total_commits=$((total_commits + commits_count))
done

echo $total_commits

# # Calcule o número de quadradinhos a serem exibidos
num_squares=$((total_commits > 5 ? 5 : $total_commits))

squares=""
for i in $(seq 1 $num_squares); do
  squares+="■"
done

# Caso não tenha commits, mostre "No commits"
if [ "$total_commits" -eq 0 ]; then
  echo " 0"
else
  # Exibe os quadradinhos com o número de commits
  echo -e " $total_commits $squares"
fi
