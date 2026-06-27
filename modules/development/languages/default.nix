{ config, pkgs, ... }:

{
  imports = [
    ./go.nix
    ./java.nix
    ./javascript.nix
    ./lua.nix
    ./python.nix
    ./rust.nix
    ./zig.nix
  ];
}
