{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bandwhich
    dnsutils
    doggo
    mtr
    netcat
    nmap
    tcpdump
    whois
  ];
}
