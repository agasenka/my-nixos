{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    calibre
    easyeffects
    feh
    flameshot
    gthumb
    imv
    inkscape
    libresprite
    losslesscut-bin
    mediainfo
    mpv
    pavucontrol
    pdfarranger
    peek
    pinta
    playerctl
    simplescreenrecorder
    vlc
    yt-dlp
    zathura
    krita
    gimp
    photoqt

    # Guitar and Audio
    guitarix
    helvum
    qpwgraph
    carla
    calf
    lsp-plugins
    tuxguitar
  ];
}
