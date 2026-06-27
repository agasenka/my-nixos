{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    delta
    gh
    git
    git-lfs
    gitui
    lazygit
  ];
}
