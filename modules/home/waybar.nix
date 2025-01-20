{ ... }: {
  programs.waybar.enable = true;

  home.file.".config/waybar/config.jsonc" = {
    source = builtins.path { name = "waybar_config"; path = ./waybar/config.jsonc; };
  };

  home.file.".config/waybar/style.css" = {
    source = builtins.path { name = "waybar_style"; path = ./waybar/style.css; };
  };

  home.file.".config/waybar/waybar-wttr.py" = {
    source = builtins.path { name = "waybar_script"; path = ./waybar/waybar-wttr.py; };
  };
}
