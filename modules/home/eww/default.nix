{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eww
    xdotool
    playerctl
  ];

  # Automatically start eww daemon in i3 startup
  xsession.windowManager.i3.config.startup = [
    {
      command = "${pkgs.eww}/bin/eww daemon";
      always = false;
      notification = false;
    }
  ];

  # Modular configurations sourced from config/
  home.file.".config/eww/eww.yuck".source = ./config/eww.yuck;
  home.file.".config/eww/eww.scss".source = ./config/eww.scss;

  home.file.".config/eww/scripts/music_info.sh" = {
    source = ./config/scripts/music_info.sh;
    executable = true;
  };

  home.file.".config/eww/scripts/toggle_widget.sh" = {
    source = ./config/scripts/toggle_widget.sh;
    executable = true;
  };
}
