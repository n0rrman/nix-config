{ pkgs, ... }: {

  home.packages = with pkgs; [

    # IDE
    jetbrains.idea-ultimate

    # Utility
    bitwarden-desktop

  ];
}
