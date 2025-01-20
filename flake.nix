{
  description = "My NixOS and nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, home-manager, ... }: {

    darwinConfigurations.mbp14 = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/mbp14/configuration.nix
        ./modules/system/homebrew.nix
     ];
    };

    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/zenbook/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.users.norrman = { pkgs, ... }: {
            imports = [
              ./home-manager/nixos/home.nix
              ./modules/home/waybar.nix
            ];
          };
        }
      ];
    };

  };
}
