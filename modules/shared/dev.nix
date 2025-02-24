{ pkgs, ... }: {

  home.file.".config/ghostty" = {
    source = ./ghostty;
  };

  home.file.".vimrc" = {
    source = ./vim/dot_vimrc;
  };

  home.file.".tmux.conf" = {
    source = ./tmux/dot_tmux.conf;
  };

  home.file.".config/fish/config.fish" = {
    source = ./fish/config.fish;
  };

  home.packages = with pkgs; [

    # Tools
    tmux
    vim
    fzf
    ripgrep
    age

    # Languages
    luarocks
    nodejs
    lua51Packages.lua
    nodePackages."@angular/cli"
    cargo
    go
    gnumake
    gcc
    postgresql

  ];
}
