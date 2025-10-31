{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      # Terminal
      "ghostty"

      # Social
      "messenger"
      "discord"

      # Game
      "jagex"
      "runelite"
      "battle-net"
      "curseforge"
      "steam"

      # Browser
      "google-chrome"
    ];
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
    caskArgs.no_quarantine = true;
  };
}
