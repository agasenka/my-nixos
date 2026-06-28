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

  home.file.".local/bin/rofi-wallpaper" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      WALL_DIR="$HOME/Pictures/wallpaper"
      mkdir -p "$WALL_DIR"

      files=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \;)

      if [ -z "$files" ]; then
          notify-send "Wallpaper Picker" "There is no wallpaper in $WALL_DIR"
          exit 1
      fi


      selected=$(echo -e "$files" | rofi -dmenu -p "Pick Wallpaper  " -i)

      if [ -n "$selected" ]; then
          feh --bg-fill "$WALL_DIR/$selected"
          ln -sf "$WALL_DIR/$selected" "$WALL_DIR/current.jpg"
          notify-send "Wallpaper Picker" "Wallpaper changed to $selected"
      fi
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
