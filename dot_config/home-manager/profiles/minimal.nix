{ config, pkgs, ... }:

{
  imports = [ ];

  home.packages = [
    pkgs.chezmoi
    pkgs.fish
    pkgs.git
    pkgs.htop
    pkgs.neofetch
    pkgs.neovim
    pkgs.syncthing
    pkgs.tailscale
    pkgs.vifm
  ];
}
