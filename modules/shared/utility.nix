{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    git
    bat
    wget
    unzip
    htop
  ];
}
