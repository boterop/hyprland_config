#!/bin/bash

grep "^bind" ~/.config/hypr/hyprland.conf |
  sed 's/bind = //' |
  sed 's/\$mainMod/SUPER/g' |
  rofi -dmenu -theme ~/.config/hypr/themes/popup.rasi -i -p "Hyprland Keybinds"
