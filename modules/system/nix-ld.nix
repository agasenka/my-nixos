{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      curl
      icu
      nss
      openssl
      stdenv.cc.cc
      zlib

      xorg.libX11
      xorg.libXext
      xorg.libXi
      xorg.libXrender
      xorg.libXtst
      xorg.libXrandr
      xorg.libXcursor
      xorg.libXfixes
      xorg.libXinerama
      xorg.libxcb

      glib
      gtk3
      cairo
      pango
      gdk-pixbuf
      atk

      libGL
      mesa

      alsa-lib
      dbus
      expat
      fontconfig
      freetype
    ];
  };
}