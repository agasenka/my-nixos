{ config, pkgs, ... }:

{
  home.file.".config/rofi/theme.rasi".source = ./theme.rasi;
  home.file.".config/rofi/power.rasi".source = ./power.rasi;

  home.file.".local/bin/rofi-power" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      options="󰐥\n\n󰏤\n󰌾\n󰍃"
      chosen=$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/power.rasi -selected-row 3)
      case "$chosen" in
          󰐥) systemctl poweroff ;;
          ) systemctl reboot ;;
          󰏤) systemctl suspend ;;
          󰌾) ~/.config/i3/scripts/lock.sh ;;
          󰍃) i3-msg exit ;;
      esac
    '';
  };

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
