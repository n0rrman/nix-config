{ ... }: {
  homebrew = {
    enable = true;
    casks = [
      "ghostty"
    ];
    cleanup = "uninstall";
    caskArgs.no_quarantine = true;
  };
}
