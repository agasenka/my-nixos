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

      libx11
      libxext
      libxi
      libxrender
      libxtst
      libxrandr
      libxcursor
      libxfixes
      libxinerama
      libxcb

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
