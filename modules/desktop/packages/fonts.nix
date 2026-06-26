{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    font-awesome
    material-design-icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
