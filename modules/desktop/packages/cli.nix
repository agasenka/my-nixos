{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    broot
    duf
    dust
    glow
    htop
    lm_sensors
    ncdu
    ouch
    pandoc
    procs
    rclone
    tealdeer
    yazi
  ];
}
