{
  config,
  pkgs,
  username,
  ...
}:

{
  # Docker virtualisation
  virtualisation.docker.enable = true;
  users.users."${username}".extraGroups = [ "docker" ];

  # GnuPG Agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    # Infrastructure
    dive
    docker-compose
    lazydocker

    # Databases
    litecli
    mariadb
    mycli
    pgcli
    postgresql
    sqlite

    # Debugging & Profiling
    gdb
    lldb
    ltrace
    perf
    strace
    valgrind

    # Networking
    bandwhich
    dnsutils
    doggo
    mtr
    netcat
    nmap
    tcpdump
    whois

    # Security
    age
    sops
  ];
}
