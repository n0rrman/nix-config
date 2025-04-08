{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    trash-cli

    docker
    docker-compose
    colima
  ];

  system.keyboard.enableKeyMapping = true;

  system.stateVersion = 5;
}
