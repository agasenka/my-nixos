{ config, pkgs, ... }:

{
  imports = [
    ./compilers
    ./databases
    ./debugging
    ./infrastructure
    ./languages
    ./networking
    ./security
    ./tooling
  ];
}
