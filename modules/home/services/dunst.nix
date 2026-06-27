{ config, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 320;
        height = 120;
        offset = "20x20";
        origin = "top-right";
        transparency = 0;
        frame_color = "#cba6f7"; # mauve
        background = "#1e1e2ee6"; # base + transparan
        foreground = "#cdd6f4"; # text
        font = "JetBrainsMono Nerd Font 12";
        corner_radius = 12;
        padding = 16;
        horizontal_padding = 16;
        icon_position = "left";
        max_icon_size = 48;
        frame_width = 2;
        separator_color = "auto";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        plain_text = "no";
        format = "<b>%s</b>\n%b";
      };
    };
  };
}
