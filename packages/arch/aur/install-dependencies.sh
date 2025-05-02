#!/bin/bash


# Stop installation if an error occurs
set -e

# Packages
aur_packages=(
    "pacman-contrib"
    "wget"
    "zip"
    "unzip"
    "gum"
    "rsync"
    "git"
    "figlet"
    "stow"
    "sed"
    "vim"
    "xdg-user-dirs"
    "man-pages"
    "networkmanager"
    "bluez"
    "bluez-utils"
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "noto-fonts"
    "xdg-desktop-portal"
    "xdg-desktop-portal-hyprland" 
    "libnotify" 
    "dunst"
    "kitty"
    "qt5-wayland" 
    "qt6-wayland"
)

# Check and install yay/paru if its necessary
if ! command -v yay &> /dev/null; then
  echo "==> Instalando yay..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay já instalado."
fi


echo "==> Instalando pacotes AUR..."
yay -S --needed --noconfirm "${aur_packages[@]}"

echo "✅ Pacotes AUR instalados!"




