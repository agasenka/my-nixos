{ config, pkgs, ... }:

{
  imports = [
    ./i3
    ./kitty
    ./rofi
    ./picom
    ./dark
    ./packages.nix
    ./fish.nix
    ./services
  ];

  home.username = "fukukita";
  home.homeDirectory = "/home/fukukita";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
