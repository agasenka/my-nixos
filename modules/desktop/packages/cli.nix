{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    broot
    btop
    curl
    duf
    dust
    eza
    fastfetch
    glow
    htop
    lm_sensors
    ncdu
    ouch
    p7zip
    pandoc
    procs
    rclone
    tealdeer
    tree
    unzip
    wget
    yazi
    zip
  ];
}
