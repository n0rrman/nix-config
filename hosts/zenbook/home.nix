{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono

    # Screenshot
    slurp
    grim

    obsidian
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
