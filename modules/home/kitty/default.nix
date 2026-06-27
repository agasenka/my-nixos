{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = "0.85";

      window_padding_width = 15;

      cursor_shape = "block";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15.0";

      enable_audio_bell = false;

      foreground = "#cdd6f4";
      background = "#1e1e2e";
      include = "~/.config/kitty/catppuccin-mocha.conf";

    };
  };
}
