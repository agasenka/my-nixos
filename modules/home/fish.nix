{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    functions = {
      fish_greeting = {
        body = ''
          # Panggil fastfetch dengan output minimal
          fastfetch --logo-type small --structure "os;kernel;uptime;packages;shell" --logo-color-1 blue --logo-color-2 white
        '';
      };
    };
  };

  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
}
