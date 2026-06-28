{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zoxide.enable = true;

  environment.systemPackages = with pkgs; [
    # Editors
    neovim
    vscodium
    jetbrains-toolbox

    # Git Utilities
    delta
    gh
    gitui
    lazygit

    # Productivity & Utilities
    hyperfine
    just
    tmux
    tokei
    xh
  ];
}
