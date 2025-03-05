{ ... }:
{

  home.file.".icons" = {
    source = builtins.path {
      name = "icons";
      path = ./icons;
    };
  };
}
