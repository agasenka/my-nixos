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
    ];
  };
}
