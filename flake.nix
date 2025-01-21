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

    ###  MBP14  ###
    darwinConfigurations.mbp14 = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
    
      # SYSTEM
      modules = [

        ./hosts/mbp14/configuration.nix
        ./modules/system/homebrew.nix

     ];
    };


    ### ZENBOOK ###
    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # SYSTEM
      modules = [

        # General system configs
        ./hosts/zenbook/configuration.nix

        # UX3405M configs
        ./hosts/zenbook/hardware-configuration.nix

        # Laptop firmware
        ./modules/system/nixos-laptop.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            users.norrman = { pkgs, ... }: {
              ## HOME
              imports = [

                # General home configs
                ./home-manager/nixos/home.nix

                # GUI
                ./modules/home/waybar.nix

              ];
            };
          };
        }
      ];
    };
  };
}
