{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome
    material-design-icons
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}