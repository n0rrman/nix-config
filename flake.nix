{
  description = "My NixOS and nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      nixpkgs,
      darwin,
      home-manager,
      ...
    }@inputs:

    {

      ###  MBP14  ###
      darwinConfigurations.mbp14 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        # SYSTEM
        modules = [

          ./hosts/mbp14/system.nix # General system configs
          ./hosts/mbp14/users.nix # Users config

          ./modules/darwin/homebrew.nix # Homebrew
          ./modules/shared/utility.nix # Utility packages

          home-manager.darwinModules.home-manager
          {
            home-manager.users.norrman =
              { pkgs, ... }:
              {
                # HOME
                imports = [

                  # General home configs
                  ./hosts/mbp14/home.nix

                  # Packages
                  ./modules/shared/dev.nix
                  ./modules/shared/nvim.nix

                ];
              };
          }
        ];
      };

      ### ZENBOOK ###
      nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";

        # SYSTEM
        modules = [
          ./hosts/zenbook/system.nix # General system configs
          ./hosts/zenbook/users.nix # Users config
          ./hosts/zenbook/hardware-configuration.nix # UX3405M configs

          ./modules/nixos/laptop.nix # Laptop firmware

          ./modules/shared/utility.nix # Utility packages
          ./modules/shared/work.nix # Work packages

          home-manager.nixosModules.home-manager
          {
            home-manager.users.norrman =
              { pkgs, ... }:
              {
                # HOME
                imports = [

                  # General home configs
                  ./hosts/zenbook/home.nix

                  # GUI
                  ./modules/nixos/waybar.nix
                  ./modules/nixos/wofi.nix
                  ./modules/nixos/mako.nix
                  ./modules/nixos/icons.nix
                  ./modules/nixos/hypr.nix

                  # Packages
                  ./modules/shared/dev.nix
                  ./modules/shared/nvim.nix

                ];
              };
          }
        ];
      };

    };
}
