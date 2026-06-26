{ config, pkgs, ... }:

{
  dconf.enable = false;

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome-themes-extra;
    size = 24;
  };

  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";
    profiles.default = {
      settings = {
        "ui.systemUsesDarkTheme" = 1;
        "browser.theme.dark" = true;
        "layout.css.prefers-color-scheme.content" = 0;
      };
    };
  };
}
