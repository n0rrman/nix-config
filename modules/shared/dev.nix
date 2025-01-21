{ pkgs, ... }: {
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
    python3
    cargo
    go
    gnumake
    gcc

  ];
}
