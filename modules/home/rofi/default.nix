{ config, pkgs, ... }:

{
  home.file.".config/rofi/theme.rasi".source = ./theme.rasi;

  programs.rofi = {
    enable = true;
    theme = "theme";         
    extraConfig = {
      modi = "drun,run,window";
      font = "JetBrainsMono Nerd Font 12";
      show-icons = true;
      location = 0;
      icon-theme = "Papirus-Dark";
    };
  };
}
