{ pkgs, ... }:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    lxappearance
    obsidian
    pcmanfm
    thunderbird
    xarchiver
    steam
  ];
}
