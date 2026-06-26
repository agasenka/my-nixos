{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lolcat
    cowsay
    figlet
    tty-clock
    cava
    appimage-run
  ];
}
