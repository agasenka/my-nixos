{ config, pkgs, ... }:

{
  imports = [
    ./packages
  ];

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.git.enable = true;

  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  users.users.fukukita.shell = pkgs.fish;
}
