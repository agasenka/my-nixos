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
        # --- App Launching ---
        "Mod4+Return"     = "exec kitty";                # Terminal
        "Mod4+a"          = "exec rofi -show drun";      # App launcher
        "Mod4+e"          = "exec thunar";               # File manager
        "Mod4+w"          = "exec firefox";              # Web browser
        "Mod4+x"          = "exec kitty nvim";           # Text editor (nvim in terminal)

        # --- Window Management ---
        "Mod4+q"          = "kill";                      # Close window (ganti Alt+F4)
        "Mod4+f"          = "fullscreen toggle";         # Fullscreen
        "Mod4+Shift+space"= "floating toggle";           # Float / tile
        "Mod4+Shift+s"    = "exec flameshot gui";        # Screenshot region

        # --- Lock & Session ---
        "Mod4+l"          = "exec i3lock -c 1e1e2e";     # Lock screen (warna base)

        # --- Media & Volume ---
        "Mod4+Shift+p"    = "exec playerctl play-pause"; # Play/pause
        "Mod4+Shift+n"    = "exec playerctl next";       # Next track
        "Mod4+Shift+b"    = "exec playerctl previous";   # Previous track
        "Mod4+Shift+m"    = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";  # Mute
        "Mod4+Shift+Up"   = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";   # Vol up
        "Mod4+Shift+Down" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";   # Vol down

        # --- Brightness (untuk laptop, hapus jika tidak perlu) ---
        # "Mod4+Shift+plus"  = "exec brightnessctl set +5%";
        # "Mod4+Shift+minus" = "exec brightnessctl set 5%-";

        # --- Workspaces ---
        # (i3 default: Mod4+1..9 = switch workspace, Mod4+Shift+1..9 = move container)
        # Ini sudah otomatis, tidak perlu ditulis ulang.
      };
    };
  };
}