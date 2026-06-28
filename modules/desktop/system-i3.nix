{ config, pkgs, ... }:

{
  imports = [
    ./packages
  ];

  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };
}
