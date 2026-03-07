{
  description = "NixOS configuration";

  inputs = {
    # Master Branch is a bit risky, but useful for latest bug fixes
    #nixpkgs.url = "github:nixos/nixpkgs/master";

    # NixOS Unstable is a great option, but can be slow and lag behind master branch
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # I use unstable-small, need some compilation, but a balanced option
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
  let
    system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [
	    {
	      nixpkgs.config.allowUnfree = true;
	    }
            ./configuration.nix
          ];
        };
      };
    };
}
