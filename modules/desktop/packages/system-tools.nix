{ pkgs, ... }:
{
  services.greenclip.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    android-tools
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
