{ ... }:
{
  imports = [ 
    ./dunst.nix 
    ./caffeine.nix
  ];

  services.udiskie.enable = true;
}
