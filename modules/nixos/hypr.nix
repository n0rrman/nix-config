{ pkgs, ... }: {
  home.packages = with pkgs; [
    hyprlock
    hypridle
    hyprpaper
  ];

  home.file.".config/hypr" = {
    source = builtins.path { name = "hypr_config"; path = ./hypr; };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.enable = true;
    # settings = {
      # "$mod" = "SUPER";

      # cursor = {
        # enable_hyprcursor = false;
      # };

      # bind = [
      # ];
      # extraConfig = ''
      # input * {
      # input = {
        # natural_scroll = true;
      # };
    # };
  };
}
