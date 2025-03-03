{ ... }:
{
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
      "steam"

      # Browser
      "zen-browser"
    ];
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
    caskArgs.no_quarantine = true;
  };
}
