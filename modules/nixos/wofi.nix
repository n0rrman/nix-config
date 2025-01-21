{ pkgs, ... }: {
  home.packages = with pkgs; [
    wofi
  ];

  home.file.".config/wofi/styles.css" = {
    source = builtins.path { name = "wofi_styles"; path = ./wofi/styles.css; };
  };
}
