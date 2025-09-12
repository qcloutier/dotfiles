{ config, pkgs, ... }:

{
  imports = [ ./minimal.nix ];

  home.packages = [
    pkgs._7zz
    pkgs.bat
    pkgs.beets
    pkgs.cascadia-code
    pkgs.cava
    pkgs.docker
    pkgs.exiftool
    pkgs.fzf
    pkgs.gcc
    pkgs.glibc
    pkgs.gnumake
    pkgs.jq
    pkgs.lua-language-server
    pkgs.mat2
    pkgs.mpd
    pkgs.qrencode
    pkgs.ripgrep
    pkgs.stylua
    pkgs.tree
    pkgs.util-linux
    pkgs.wl-clipboard
    pkgs.xclip
    pkgs.yq-go
    pkgs.yt-dlp
    pkgs.zbar

    (config.lib.nixGL.wrap pkgs.kitty)
    (config.lib.nixGL.wrap pkgs.quickemu)
  ];
}
