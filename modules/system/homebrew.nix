{ ... }: {
  homebrew = {
    enable = true;
    casks = [
      "ghostty"
      "messenger"
      "discord"
      "jagex"
      "runelite"
      "battle-net"
      "curseforge"
    ];
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
    caskArgs.no_quarantine = true;
  };
}
