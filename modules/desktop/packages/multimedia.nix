{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mpv
    vlc
    feh
    imv
    pavucontrol
    playerctl
    flameshot
    peek
    simplescreenrecorder
    zathura
    calibre
  ];
}
