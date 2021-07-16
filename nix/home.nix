{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
  ];
  programs.home-manager.enable = true;
}
