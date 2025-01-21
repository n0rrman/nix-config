{ pkgs, ... }: {
  home.username = "norrman";
  home.homeDirectory = "/Users/norrman";


  home.packages = with pkgs; [
    discord
  ];


  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}


