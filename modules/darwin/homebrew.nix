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
      "google-chrome"
    ];
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
    caskArgs.no_quarantine = true;
  };
}
