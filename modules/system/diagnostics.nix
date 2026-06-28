{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
    lshw
    hwinfo
    inxi
    dmidecode
    smartmontools
    nvme-cli

    ethtool

    file
    tree
    unzip
    zip
    p7zip
    curl
    wget

    jq
    yq-go
    ripgrep
    fd
    bat
    eza
    fzf
    btop
    fastfetch
    psmisc
  ];
}
