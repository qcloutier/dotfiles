#!/bin/sh -e

if [ "$XDG_CURRENT_DESKTOP" != KDE ]; then
  echo "Not running KDE Plasma; skipping config load"
  exit 0
fi

plasma-apply-colorscheme BreezeDark
plasma-apply-cursortheme breeze_cursors
plasma-apply-desktoptheme breeze-dark

plasma-apply-wallpaperimage "$HOME/Desktop/Sync/.wallpaper.png"
