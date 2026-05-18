#!/bin/bash

set -e

DIR="/tmp/hyprland"

echo "Creating config directories"
mkdir -p ~/.config/hypr
mkdir -p ~/.config/mako
mkdir -p ~/.config/kitty

echo "Downloading config files"
git clone https://github.com/boterop/hyprland_config $DIR

echo "Copying config files"
cp $DIR/hypr/* ~/.config/hypr/
cp $DIR/mako/* ~/.config/mako/
cp $DIR/kitty/* ~/.config/kitty/
cp $DIR/starship.toml ~/.config/

chmod +x ~/.config/hypr/scripts/*.sh

echo "Deleting temp files"
rm -rf $DIR

hyprctl reload

echo "hyprbinds config installed successfully"
