{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    htop
    fastfetch
    ripgrep
    fd
    bat
    eza
    duf
    ncdu
    tmux
    curl
    wget
    git
    zip
    unzip
    p7zip
    jq
    tree
    lm_sensors
  ];
}
