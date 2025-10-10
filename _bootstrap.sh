#!/usr/bin/env bash
set -e

export NIX_CONFIG='use-xdg-base-directories = true'

sh <(curl -L https://nixos.org/nix/install) --no-daemon --no-modify-profile

. ~/.local/state/nix/profile/etc/profile.d/nix.sh

nix-shell --packages chezmoi --run 'chezmoi init qcloutier --apply --keep-going --source ~/src/dotfiles'
