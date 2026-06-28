{ pkgs, ... }:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    obsidian
    pcmanfm
    thunderbird
    xarchiver
  ];
}
