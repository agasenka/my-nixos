{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    thunderbird
    obsidian
    vscodium
    xarchiver
    pcmanfm
  ];
}
