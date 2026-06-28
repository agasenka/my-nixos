{
  description = "Flake gw tuh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      username = "fukukita";
      hostname = "nixos";
    in
    {
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs username hostname;
          };
          modules = [
            ./hosts/nixos
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs username;
              };
              home-manager.users."${username}" = import ./modules/home;
            }
          ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      checks.x86_64-linux = {
        formatting =
          nixpkgs.legacyPackages.x86_64-linux.runCommand "check-formatting"
            {
              buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style ];
            }
            ''
              find ${self} -name "*.nix" -exec nixfmt --check {} +
              touch $out
            '';
      };
    };
}
