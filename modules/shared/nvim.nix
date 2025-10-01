{ pkgs, ... }:
{
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [

    # LSP Servers
    nodePackages.typescript-language-server # tsserver
    vscode-langservers-extracted # html, cssls
    lua-language-server # lua_ls
    nil # nil_ls
    gopls # gopls
    rust-analyzer # rust_analyzer
    clang-tools # clangd
    pyright # pyright
    marksman # marksman
    templ # templ
    angular-language-server # angularls
    emmet-ls # emmet_ls
    tailwindcss-language-server # tailwind
    dockerfile-language-server # dockerls
    sqls # For SQL language server
    graphql-language-service-cli # graphql
    nodePackages.graphql-language-service-cli # graphql

    # Linters
    eslint_d # eslint_d
    python3Packages.flake8 # flake8
    luajitPackages.luacheck # luacheck
    checkmake # checkmake
    hadolint # hadolint
    proselint # prose
    vale # vale
    nodePackages.jsonlint # jsonlint

    # Formatters
    # nodePackages.prettier-plugin-toml
    nodePackages.prettier # prettier
    prettierd
    stylua # stylua
    python3Packages.black # black
    python3Packages.isort # isort
    rustfmt # rustfmt
    nixfmt-rfc-style # nixfm
    gotools # goimports
    pgformatter # pg_format
  ];
}
