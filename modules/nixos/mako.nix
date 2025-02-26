{ pkgs, ... }:
{

  home.file.".config/mako" = {
    source = builtins.path {
      name = "mako_config";
      path = ./mako;
    };
  };

  home.packages = with pkgs; [
    mako
  ];

}
