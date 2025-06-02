{ pkgs, ... }:
{
  programs.ssh.startAgent = true;
  environment.systemPackages = with pkgs; [
    vim
    git
    bat
    wget
    unzip
    htop
  ];
}
