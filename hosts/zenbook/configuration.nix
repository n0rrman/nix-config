{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./zenbook-ux3405m.nix
      # ./gnome.nix
      ./home.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.auto-cpufreq.enable = true;
  programs.dconf.enable = true;


  boot.kernel.sysctl."fs.inotify.max_user_instances" = lib.mkForce 1024000;
  boot.kernel.sysctl."fs.inotify.max_user_watches" = lib.mkForce 1024000;

  # https://github.com/scylladb/scylla/issues/5638
  boot.kernel.sysctl."fs.aio-max-nr" = 1048576;


  # Thermal monitoring for laptops
  services.thermald.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # systemd.user.services.kanshi = {
  # 	environment = {
  # 	WAYLAND_DISPLAY="wayland-1";
  # 	DISPLAT = ":0";
  # };
  # serviceConfig = {
  # 	Type = "simple";
  # 	ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
  # };
  # }; 
  #


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



  virtualisation.docker.extraOptions = "--default-ulimit nofile=1024000:1024000 --mtu=1340";


  #safe to disable?:
  # security.pam.services.swaylock = { };
  # programs.sway.enable = true;
  # programs.sway.package = null;


  # Configure console keymap
  console.keyMap = "sv-latin1";


  # programs.sway.enable = true;
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.norrman = {
    isNormalUser = true;
    description = "norrman";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  security.polkit.enable = true;

  # Install firefox.
  # programs.firefox.enable = true;


  # programs.tmux = {
  #   enable = true;
  # };

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget




  programs.direnv.enable = true;


  environment.sessionVariables = {
    # use buildx for docker-compose_2 :)
    # https://stackoverflow.com/questions/59756123/use-buildx-build-linux-arm64-in-docker-compose-file
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [

    gparted

    # greetd
    bat

    # Vim
    neovim
    vim

    firefox
    tmux

    xdg-desktop-portal

    # starship
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

    gnumake


    ghostty

    # nerdfonts
    age
    cargo

    brightnessctl
    pamixer
    upower
    # BitWarden
    bitwarden-desktop

    # Git
    git
    postgresql_17
    sqlite

    docker
    docker-compose
    docker-buildx
    #wget
    # neofetch

    (pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    stern
    kubectx
    kubectl
    jq
    jetbrains.idea-ultimate

    lm_sensors

    trashy
    htop

    nodePackages."@angular/cli"
    qutebrowser

    go
  ];


  # Some programs need SUID wrappers, can be configured further or are

  # config.front_end = "WebGpu";

  #
  # programs.zsh.ohMyZsh = {
  #     enable = true;
  #     plugins = ["git"];
  # };

  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "24.11"; # Did you read the comment?
  system.stateVersion = "unstable"; # Did you read the comment?

}
