#!/bin/bash


# Stop installation if an error occurs
set -e

# Packages
packages=(
    "fastfetch"
    "xdg-desktop-portal-gtk"
    "eza"
    "python-pip"
    "python-gobject"
    "python-screeninfo"
    "tumbler"
    "brightnessctl"
    "nm-connection-editor"
    "network-manager-applet"
    "gtk4"
    "libadwaita"
    "fuse2"
    "imagemagick"
    "jq"
    "xclip"
    "kitty"
    "neovim"
    "htop"
    "rust"
    "cargo"
    "pinta"
    "blueman"
    "grim"
    "slurp"
    "cliphist"
    "nwg-look"
    "qt6ct"
    "waybar"
    "rofi-wayland"
    "polkit-gnome"
    "zsh"
    "zsh-completions"
    "fzf"
    "pavucontrol"
    "papirus-icon-theme"
    "breeze"
    "flatpak"
    "swaync"
    "gvfs"
    "wlogout"
    "hyprshade"
    "waypaper"
    "grimblast-git"
    "bibata-cursor-theme-bin"
    "pacseek"
    "otf-font-awesome"
    "ttf-fira-sans"
    "ttf-fira-code"
    "ttf-firacode-nerd"
    "ttf-dejavu"
    "nwg-dock-hyprland"
    "oh-my-posh-bin"
    "checkupdates-with-aur"
    "loupe"
    "power-profiles-daemon"
    "matugen"
    "firefox"
    "nautilus"
    "nautilus-open-any-terminal"
    "loupe"
    "mpv"
    "imv"
    "ffmpegthumbnailer"
)

echo "==> Instalando pacotes oficiais (pacman)..."
sudo pacman -Syu --needed --noconfirm "${packages[@]}"

echo "==> ✅ Pacotes oficiais instalados!"




