{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    clippy
    rustc
    rustfmt
  ];
}
