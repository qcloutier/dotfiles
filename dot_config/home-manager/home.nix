{ config, pkgs, ... }:

{
  imports = [ ./chezmoi.nix ];

  home.packages = [
    (config.lib.nixGL.wrap pkgs.kitty)
    (config.lib.nixGL.wrap pkgs.quickemu)
    pkgs._7zz
    pkgs.bat
    pkgs.beets
    pkgs.cascadia-code
    pkgs.chezmoi
    pkgs.docker
    pkgs.exiftool
    pkgs.fish
    pkgs.fzf
    pkgs.gcc
    pkgs.git
    pkgs.glibc
    pkgs.gnumake
    pkgs.htop
    pkgs.jq
    pkgs.lua-language-server
    pkgs.mat2
    pkgs.mpd
    pkgs.neofetch
    pkgs.neovim
    pkgs.ripgrep
    pkgs.stylua
    pkgs.syncthing
    pkgs.tailscale
    pkgs.vifm
    pkgs.wl-clipboard
    pkgs.xclip
    pkgs.yq-go
    pkgs.yt-dlp
    pkgs.zbar
  ];

  home.stateVersion = "24.05";

  nixGL.packages = import <nixgl> { inherit pkgs; };

  programs.home-manager.enable = true;
}
