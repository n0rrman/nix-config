{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    git
    bat
    wget
    unzip
    htop
    yazi
    home-manager
  ];
}
