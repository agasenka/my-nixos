{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./bar.nix ];

  home.file.".config/i3/scripts/lock.sh" = {
    source = ./scripts/lock.sh;
    executable = true;
  };

  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = ''
      for_window [class="^.*"] border pixel 0
    '';
    config = {
      modifier = "Mod4";
      fonts = {
        names = [ "monospace" ];
        size = 8.0;
      };
      gaps = {
        inner = 8;
        outer = 2;
      };
      window = {
        border = 0;
        titlebar = false;
      };

      startup = [
        {
          command = "feh --bg-fill ~/Pictures/wallpaper/current.jpg || feh --bg-fill ~/Pictures/wallpaper/1.jpg || feh --bg-solid '#282828'";
          always = true;
          notification = false;
        }
        {
          command = "~/.config/polybar/launch.sh";
          always = true;
          notification = false;
        }
      ];

      bars = [ ];

      modes = {
        power_menu = {
          "s" = "exec systemctl poweroff, mode \"default\"";
          "r" = "exec systemctl reboot, mode \"default\"";
          "z" = "exec systemctl suspend, exec eww close-all, mode \"default\"";
          "l" = "exec ~/.config/i3/scripts/lock.sh, exec eww close-all, mode \"default\"";
          "e" = "exec i3-msg exit, mode \"default\"";
          "Escape" = "exec eww close-all, mode \"default\"";
          "Return" = "mode \"default\"";
        };
        widget_mode = {
          "Escape" = "exec eww close-all, mode \"default\"";
          "Return" = "mode \"default\"";
        };
      };

      keybindings = lib.mkOptionDefault {
        "Mod4+Return" = "exec kitty";
        "Mod4+a" = "exec rofi -show drun";
        "Mod4+e" = "exec thunar";
        "Mod4+w" = "exec firefox";
        "Mod4+Shift+w" = "exec rofi-wallpaper";
        "Mod4+x" = "exec kitty nvim";
        "Mod4+Shift+t" = "exec kitty btop";
        "Mod4+Shift+c" = "exec kitty cava";
        "Mod4+q" = "kill";
        "Mod4+f" = "fullscreen toggle";
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+Shift+s" = "exec flameshot gui";

        "Mod4+Control+l" = "exec ~/.config/i3/scripts/lock.sh";
        "Mod4+Escape" = "exec ~/.config/eww/scripts/toggle_widget.sh power, mode \"power_menu\"";
        "Mod4+Shift+v" =
          "exec rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'";

        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";

        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";

        "Mod4+Shift+p" = "exec playerctl play-pause";
        "Mod4+Shift+n" = "exec playerctl next";
        "Mod4+Shift+b" = "exec playerctl previous";
        "Mod4+Shift+m" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "Mod4+Shift+Up" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "Mod4+Shift+Down" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";


        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

        "Mod4+Shift+d" = "exec dunstify -u low -r 12345 \"Calendar\" \"<tt>$(cal)</tt>\"";
      };
    };
  };
}
