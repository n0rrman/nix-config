{
  description = "A flake...?";

  inputs = {
 nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {      
        url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.

      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,

      # to avoid problems caused by different versions of nixpkgs.
          inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager,  ... }: {

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    darwinConfigurations.mbp14 = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        ./darwin-config.nix
      ];
    };

    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {

          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;

          # home-manager.users.norrman = import ./home.nix;
        }
      ];
    };

  };
}
