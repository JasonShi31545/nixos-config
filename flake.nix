{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  ## outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  outputs = { self, nixpkgs, ...}@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
    };
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [

            ./configuration.nix
            #home-manager.nixosModules.home-manager {
            #    home-manager.useGlobalPkgs = true;
            #    home-manager.useUserPackages = true;
            #    home-manager.users.jason = import ./home.nix;
            #}
          ];
        };
      };
    };
}
