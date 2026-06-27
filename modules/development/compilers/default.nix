{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bear
    ccache
    clang
    clang-tools
    cmake
    gcc
    gnumake
    mold
    ninja
    pkg-config
  ];
}
