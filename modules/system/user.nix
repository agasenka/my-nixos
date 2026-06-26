{ config, pkgs, ... }:
{
  users.users."fukukita" = {
    isNormalUser = true;
    description = "fukukita";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
}
