# hyprland_config

Modern and minimal Hyprland setup for Arch Linux focused on productivity, keyboard-driven workflows and clean aesthetics.

Includes carefully curated configs, scripts and utilities for a fast and lightweight Wayland desktop experience.

---

## Features

- Minimal Hyprland configuration
- Rofi-powered workflows
- Glassmorphism-inspired UI
- Kitty terminal setup
- Mako notifications
- Hyprlock + Hypridle integration
- Wallpaper management
- Clipboard history support
- Battery notifications
- Scratchpad terminal
- Audio and brightness controls
- Nerd Fonts support
- Developer-focused workflow

---

# Included Components

| Component  | Purpose            |
| ---------- | ------------------ |
| Hyprland   | Wayland compositor |
| Kitty      | Terminal emulator  |
| Rofi       | Launcher and menus |
| Mako       | Notifications      |
| Hyprlock   | Lockscreen         |
| Hypridle   | Idle manager       |
| Hyprpaper  | Wallpaper manager  |
| cliphist   | Clipboard history  |
| swappy     | Screenshot editor  |
| grim/slurp | Screenshots        |
| hyprpicker | Color picker       |

---

# Installation

## One-command install

```bash
curl -fsSL https://raw.githubusercontent.com/boterop/hyprland_config/main/install.sh | sh
```

The installer will:

- Install required dependencies
- Create config directories
- Copy configuration files
- Configure Hyprland utilities
- Setup scripts and themes
- Reload Hyprland automatically

---

# Key Features

## hyprbinds integration

Built-in searchable Hyprland keybind cheatsheet powered by Rofi.

## Clipboard history

Clipboard manager integrated with Rofi and Wayland.

## Battery notifications

Automatic low-battery and charging notifications.

## Minimal notifications

Clean Mako notification styling aligned with Hyprland aesthetics.

---

---

# Customization

Configs are intentionally modular and easy to modify.

Most configuration files are located in:

```bash
~/.config/
```

including:

```text
hypr/
kitty/
mako/
rofi/
```

---

# Philosophy

This setup focuses on:

- Minimalism
- Productivity
- Keyboard-first workflows
- Low visual clutter
- Fast interactions
- Native Wayland tooling

---

# Notes

- Designed primarily for Arch Linux
- Uses native Wayland tools whenever possible
- Avoids unnecessary background services and bloated desktop components
