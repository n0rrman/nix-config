{ pkgs, ... }:
{
  programs.waybar.enable = true;

  home.packages = with pkgs; [
    (python311.withPackages (ps: with ps; [ requests ]))
  ];

  home.file.".config/waybar" = {
    source = builtins.path {
      name = "waybar_config";
      path = ./waybar;
    };
  };
}
