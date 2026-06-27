{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;

  users.users.fukukita.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    dive
    docker-compose
    lazydocker
  ];
}
