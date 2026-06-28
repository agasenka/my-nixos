{ pkgs, ... }:

{
  home.packages = with pkgs; [
    appimage-run
    cava
    cowsay
    figlet
    lolcat
    tty-clock
  ];

  home.file.".config/cava/config".text = ''
    [general]
    framerate = 60
    bars = 0
    bar_width = 2
    bar_spacing = 1

    [input]
    method = pulse

    [color]
    gradient = 1
    gradient_color_1 = '#89b4fa'
    gradient_color_2 = '#cba6f7'
    gradient_color_3 = '#f38ba8'
  '';
}
