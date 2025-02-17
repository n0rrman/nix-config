{ pkgs, ... }: {


  home.file.".config/nvim" = {
    source = ./nvim;
  };

  home.packages = with pkgs; [
    neovim

  # LSP Servers
  nodePackages.typescript-language-server  # tsserver
  vscode-langservers-extracted  # html, cssls
  lua-language-server  # lua_ls
  nil  # nil_ls
  gopls  # gopls
  rust-analyzer  # rust_analyzer
  clang-tools  # clangd
  pyright  # pyright
  marksman  # marksman
  templ  # templ
  angular-language-server  # angularls
  emmet-ls  # emmet_ls
  tailwindcss-language-server # tailwind


  # Linters
  eslint_d  # eslint_d
  python3Packages.flake8  # flake8
  luajitPackages.luacheck  # luacheck
  checkmake  # checkmake
  vale  # vale

  # Formatters
  nodePackages.prettier-plugin-toml
  nodePackages.prettier  # prettier
  stylua  # stylua
  python3Packages.black  # black
  python3Packages.isort  # isort
  rustfmt  # rustfmt
  nixpkgs-fmt  # nixpkgs-fmt
  gotools  # goimports
  hadolint  # hadolint

  ];
}
