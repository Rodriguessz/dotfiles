#!/bin/bash

bar_chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
pipe="/tmp/cava.fifo"

# Garante que o FIFO está limpo
[[ -p "$pipe" ]] && rm "$pipe"
mkfifo "$pipe"

# Executa cava com config padrão
cava -p ~/.config/cava/config &

# Lê os dados do cava
while read -r line; do
    output=""
    for char in $(echo "$line" | grep -o .); do
        if [[ "$char" =~ [0-7] ]]; then
            output+="${bar_chars[$char]}"
        fi
    done
    echo "$output"
done < "$pipe"
