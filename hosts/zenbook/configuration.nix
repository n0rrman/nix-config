{ pkgs, lib, ... }:

{
  # User
  users.users.norrman = {
    isNormalUser = true;
    description = "norrman";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
  };

  # Network
  networking.hostName = "zenbook";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # time sync
  systemd.timers.ntp.enable = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ];


# GTK support
  programs.dconf.enable = true;


# Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;


# System performance tweaks
  boot.kernel.sysctl."fs.inotify.max_user_instances" = lib.mkForce 1024000;
  boot.kernel.sysctl."fs.inotify.max_user_watches" = lib.mkForce 1024000;
  boot.kernel.sysctl."fs.aio-max-nr" = 1048576;
  boot.kernelParams = [];



# Wayland support for Electron / Chrome apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

# greeted
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "norrman";
      };
      default_session = initial_session;
    };
  };


  # Configure console keymap
  console.keyMap = "sv-latin1";




# Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

    
# Privileges handler
  security.polkit.enable = true;

# Dir env
  programs.direnv.enable = true;

# Docker
  environment.sessionVariables = {
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
  };
  virtualisation.docker.enable = true;
  virtualisation.docker.extraOptions = "--default-ulimit nofile=1024000:1024000 --mtu=1340";


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [


    # dev 
    neovim
    vim
    tmux
    ghostty

    # work
    bitwarden-desktop

  nil

    # greetd
    bat

    firefox

    xdg-desktop-portal

    #nvim reqs
    luarocks
    lua51Packages.lua
    python3
    unzip
    wget
    clang
    gcc
    fzf
    ripgrep
    nodejs
    gcc

    htop
    gnumake



    # nerdfonts
    age
    cargo



    git
    postgresql_17
    sqlite


    # docker
    docker
    docker-compose
    docker-buildx

    # kubernetes
    stern
    kubectx
    kubectl


    (pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    jq
    jetbrains.idea-ultimate


    trashy

    nodePackages."@angular/cli"
    qutebrowser

    go
  ];


  system.stateVersion = "unstable"; 

}
