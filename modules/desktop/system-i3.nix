{ config, pkgs, ... }:

{
  imports = [ ./packages ];

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.displayManager.sddm.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
}
