{ config, pkgs, ... }:

{
  imports = [
    ./editors.nix
    ./git.nix
    ./productivity.nix
  ];
}
