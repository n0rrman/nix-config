{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kanata
  ];

  home.file.".config/kanata" = {
    source = builtins.path { name = "kanata_config"; path = ./kanata; };
  };

  # Kanata keyboard remapping
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        config = ./.config/kanata/kanata.kbd;
      };
    };
  };

}
