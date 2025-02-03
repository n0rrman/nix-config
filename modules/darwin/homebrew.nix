{ ... }: {
  homebrew = {
    enable = true;
    casks = [
      # Development
      "ghostty"

      # Social
      "messenger"
      "discord"

      # Game
      "jagex"
      "runelite"
      "battle-net"
      "curseforge"

      # Browsers
      "firefox"
    ];
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
    caskArgs.no_quarantine = true;
  };
}
