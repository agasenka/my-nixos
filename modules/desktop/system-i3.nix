{ config, pkgs, ... }:

{
  imports = [ 
    ./packages
  ];

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  programs.fish.enable = true;
  users.users.fukukita.shell = pkgs.fish;
  services.displayManager.ly.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
}
