{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wofi
  ];

  home.file.".config/wofi" = {
    source = builtins.path {
      name = "wofi_config";
      path = ./wofi;
    };
  };
}
