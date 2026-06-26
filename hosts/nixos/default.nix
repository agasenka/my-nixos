{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/sound.nix
    ../../modules/system/user.nix
    ../../modules/desktop/system-i3.nix
  ];

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  
  services.printing.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05"; 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
