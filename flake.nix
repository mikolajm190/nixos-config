{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      disko,
      home-manager,
      ...
    }:
    let
      myvars = import ./vars;
      username = myvars.hosts.nikslap.username;
    in
    {
      nixosConfigurations = {
        nikslap = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs myvars; };

          modules = [
            ./hosts/nikslap/configuration.nix
            ./hosts/nikslap/disko.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit myvars; };
              home-manager.users.${username} = import ./hosts/nikslap/home.nix;
            }

            disko.nixosModules.disko
          ];
        };
      };
    };
}
