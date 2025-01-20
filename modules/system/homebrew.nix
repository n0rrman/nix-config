{ ... }: {
  homebrew = {
    enable = true;
    casks = [
      "ghostty"
      "messenger"
      "discord"
      "jagex"
      "battle-net"
      "curseforge"
    ];
    cleanup = "uninstall";
    caskArgs.no_quarantine = true;
  };
}
