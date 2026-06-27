{ config, pkgs, ... }:

{
  imports = [
    ./cli.nix
    ./fonts.nix
    ./gui.nix
    ./multimedia.nix
    ./system-tools.nix
  ];
}
