{ pkgs, ... }:
{

  home.file.".config/ghostty" = {
    source = ./ghostty;
  };

  home.file.".vimrc" = {
    source = ./vim/dot_vimrc;
  };

  home.file.".tmux.conf" = {
    source = ./tmux/dot_tmux.conf;
  };

  home.file.".config/fish" = {
    source = ./fish;
    recursive = true;
  };

  home.packages = with pkgs; [

    # Tools
    tmux
    vim
    fzf
    ripgrep
    age
    delta
    jq

    # Languages
    luarocks
    nodejs
    lua51Packages.lua
    nodePackages."@angular/cli"
    cargo
    # go
    gnumake
    gcc
    postgresql

    (pkgs.go_1_25.overrideAttrs (
      oldAttrs: finalAttrs: rec {
        version = "1.25.1";
        src = pkgs.fetchurl {
          url = "https://go.dev/dl/go${version}.src.tar.gz";
          hash = "sha256-0BDBCc7pTYDv5oHqtGvepJGskGv0ZYPDLp8NuwvRpZQ=";
        };
      }
    ))

  ];
}
