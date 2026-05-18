#!/bin/bash

cliphist list |
  rofi -dmenu -theme ~/.config/hypr/themes/popup.rasi -p "Clipboard" -i -lines 10 |
  cliphist decode |
  wl-copy
