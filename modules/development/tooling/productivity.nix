{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zoxide.enable = true;

  environment.systemPackages = with pkgs; [
    fd
    fzf
    hyperfine
    jq
    just
    ripgrep
    tmux
    tokei
    xh
    yq-go
  ];
}
