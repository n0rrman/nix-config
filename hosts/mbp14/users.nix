{ config, ... }:
{
  users.users.norrman = {
    description = "norrman";
    home = "/Users/norrman";
  };

  system.primaryUser = "norrman";

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  age.identityPaths = [ "${config.users.users.norrman.home}/.ssh/nix" ];
}
