{ pkgs, ... }:
{
  services.greenclip.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    android-tools
    arandr
    blueman
    brightnessctl
    dunst
    i3lock-color
    libnotify
    networkmanagerapplet
    scrcpy
    xclip
    xsel
    xss-lock
  ];
}
