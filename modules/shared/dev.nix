{ pkgs, ... }: {


  home.file.".config/nvim" = {
    source = builtins.path { name = "nvim_config"; path = ./nvim; };
  };

  home.file.".config/ghostty" = {
    source = builtins.path { name = "ghostty_config"; path = ./ghostty; };
  };

  home.file.".vimrc" = {
    source = builtins.path { name = "vim_config"; path = ./vim/dot_vimrc; };
  };

  home.file.".tmux.conf" = {
    source = builtins.path { name = "tmux_config"; path = ./tmux/dot_tmux.conf; };
  };

  home.file.".config/fish" = {
    source = builtins.path { name = "fish_config"; path = ./fish; };
  };

  home.packages = with pkgs; [

    # Tools
    neovim
    tmux
    vim
    fzf
    ripgrep

    # Languages
    luarocks
    nil
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
