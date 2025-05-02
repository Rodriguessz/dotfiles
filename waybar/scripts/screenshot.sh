#!/bin/bash

case "$1" in
  full)
    grim - | wl-copy
    notify-send "Screenshot" "Imagem copiada para o clipboard"
    ;;
  region)
    slurp | grim -g - - | wl-copy
    notify-send "Screenshot" "Imagem copiada para o clipboard"
    ;;
  save)
    DIR="$HOME/Pictures/Screenshots"
    mkdir -p "$DIR"
    FILE="$DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
    grim "$FILE"
    notify-send "Screenshot saved" "$FILE"
    ;;
  region-save)
    DIR="$HOME/Pictures/Screenshots"
    mkdir -p "$DIR"
    FILE="$DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
    grim -g "$(slurp)" "$FILE"
    notify-send "Screenshot saved" "$FILE"
    ;;
  *)
    echo "Uso: $0 [full|region|save|region-save]"
    exit 1
    ;;
esac
