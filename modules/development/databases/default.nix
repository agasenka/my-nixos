{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    litecli
    mariadb
    mycli
    pgcli
    postgresql
    sqlite
  ];
}
