#!/bin/bash

set -e

DIR="/tmp/hyprland"

echo "Creating config directories"
mkdir -p ~/.config/hypr
mkdir -p ~/.config/mako
mkdir -p ~/.config/kitty

echo "Cleaning cached files"
rm -rf $DIR

echo "Install dependencies"
sudo -v
sudo pacman -S --noconfirm git \
  ttf-jetbrains-mono-nerd \
  mako \
  cliphist \
  wl-clipboard \
  hyprpicker \
  playerctl \
  brightnessctl \
  grim slurp swappy \
  hyprpolkitagent \
  rofi \
  hyprpaper \
  hyprlock \
  hypridle \
  rofimoji

echo "Downloading config files"
git clone https://github.com/boterop/hyprland_config $DIR

echo "Copying config files"
cp -r $DIR/hypr/* ~/.config/hypr/
cp -r $DIR/mako/* ~/.config/mako/
cp -r $DIR/kitty/* ~/.config/kitty/
cp -r $DIR/starship.toml ~/.config/
cp -r $DIR/rofimoji.rc ~/.config/

chmod +x ~/.config/hypr/scripts/*.sh

echo "Deleting temp files"
rm -rf $DIR

hyprctl reload

echo "hyprbinds config installed successfully"
