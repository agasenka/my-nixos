{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    blueman
    brightnessctl
    xclip
    xsel
    xss-lock
    i3lock
    dunst
    libnotify
    wget
    psmisc
    neovim
  ];
}
