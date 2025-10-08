{ pkgs, ... }:
{
  home.packages = with pkgs; [

    # Terminal
    ghostty
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
