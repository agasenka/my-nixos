{ config, pkgs, ... }:

{
  imports = [
    ./dark
    ./fish.nix
    ./i3
    ./kitty
    ./packages.nix
    ./picom
    ./rofi
    ./services
  ];

  home.username = "fukukita";
  home.homeDirectory = "/home/fukukita";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
