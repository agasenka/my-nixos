{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./bar.nix ];

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
          command = "feh --bg-fill ~/Pictures/wallpaper/1.jpg || feh --bg-solid '#282828'";
          always = true;
          notification = false;
        }
        {
          command = "~/.config/polybar/launch.sh";
          always = false;
          notification = false;
        }
      ];

      bars = [ ];

      keybindings = lib.mkOptionDefault {
        "Mod4+Return" = "exec kitty";
        "Mod4+a" = "exec rofi -show drun";
        "Mod4+e" = "exec thunar"; 
        "Mod4+w" = "exec firefox";
        "Mod4+x" = "exec kitty nvim"; 
        "Mod4+Shift+t" = "exec kitty btop"; 
        "Mod4+Shift+c" = "exec kitty cava";
        "Mod4+q" = "kill"; 
        "Mod4+f" = "fullscreen toggle";
        "Mod4+Shift+space" = "floating toggle"; 
        "Mod4+Shift+s" = "exec flameshot gui";

        "Mod4+l" = "exec i3lock -c 1e1e2e";

        "Mod4+Shift+p" = "exec playerctl play-pause";
        "Mod4+Shift+n" = "exec playerctl next";
        "Mod4+Shift+b" = "exec playerctl previous"; 
        "Mod4+Shift+m" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "Mod4+Shift+Up" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "Mod4+Shift+Down" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%"; 
      };
    };
  };
}
