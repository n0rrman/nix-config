{ config, pkgs, lib, ... }:

{
  imports = [    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

    

  environment.systemPackages = with pkgs; [
    nil

    trash-cli

    fish

    tmux
    neovim
    bat
    cargo
    
    python3

    go

    wget

    nodejs
    nodePackages."@angular/cli"
  ];

  system.stateVersion = 5; 
}
