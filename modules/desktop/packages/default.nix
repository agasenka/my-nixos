{ config, pkgs, ... }:
{
  imports = [
    ./cli.nix
    ./gui.nix
    ./multimedia.nix
    ./fonts.nix
    ./system-tools.nix
  ];
}
