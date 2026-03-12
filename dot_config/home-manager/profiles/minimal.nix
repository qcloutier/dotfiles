{ config, pkgs, ... }:

{
  imports = [ ];

  home.packages = [
    pkgs.chezmoi
    pkgs.fastfetch
    pkgs.fish
    pkgs.fzf
    pkgs.git
    pkgs.htop
    pkgs.neovim
    pkgs.syncthing
    pkgs.tailscale
    pkgs.vifm
  ];
}
