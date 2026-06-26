{ config, lib, pkgs, ... }:

{
  imports = [ ./bar.nix ];

  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = ''
      for_window [class="^.*"] border pixel 0
    '';
    config = {
      modifier = "Mod4";
      fonts = { names = [ "monospace" ]; size = 8.0; };
      gaps = { inner = 8; outer = 2; };
      window = { border = 0; titlebar = false; };

      startup = [
        { command = "feh --bg-fill ~/Pictures/wallpaper/1.jpg || feh --bg-solid '#282828'"; always = true; notification = false; }
        { command = "~/.config/polybar/launch.sh"; always = false; notification = false; }
      ];

      bars = [];

      keybindings = lib.mkOptionDefault {
        "Mod4+q" = "exec kitty";
        "Mod4+a" = "exec rofi -show drun";
        "Mod4+c" = "kill";
        "Mod4+Shift+s" = "exec flameshot gui";
      };
    };
  };
}
