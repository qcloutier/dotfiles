{ config, pkgs, ... }:

{
  imports = [ ./chezmoi.nix ];

  home.stateVersion = "24.05";

  nixGL.packages = import <nixgl> { inherit pkgs; };

  programs.home-manager.enable = true;
}
