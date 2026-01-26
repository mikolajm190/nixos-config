{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: {
    nixosConfigurations = {
      kdeciak = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/kdeciak/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mikolajm = import ./hosts/kdeciak/home.nix;
          }

          nvf.nixosModules.default
        ];
      };
    };
  };
}
