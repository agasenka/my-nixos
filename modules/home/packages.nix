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
}
