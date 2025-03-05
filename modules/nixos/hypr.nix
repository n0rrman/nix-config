{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprland
    hyprlock
    hypridle
    hyprpaper
    # hyprcursor
  ];

  home.file.".config/hypr" = {
    source = builtins.path {
      name = "hypr_config";
      path = ./hypr;
    };
  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   # package = pkgs.hyprland;
  #   # systemd.enable = true;
  # };
}
