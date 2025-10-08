{ pkgs, config, ... }:
{

  # Docker config
  environment.sessionVariables = {
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
  };

  virtualisation.docker = {
    enable = true;
    # extraOptions = "--bip=172.17.0.1/16 --default-address-pool=base=172.18.0.0/16,size=24 --ipv6=false --default-ulimit nofile=1024000:1024000 --mtu=1340";
  };

  # networking.firewall = {
  #   trustedInterfaces = [ "docker0" ];
  #   checkReversePath = false;
  #   extraCommands = ''
  #     if ip link show docker0 >/dev/null 2>&1; then
  #       iptables -A INPUT -i docker0 -j ACCEPT
  #       iptables -A FORWARD -i docker0 -j ACCEPT
  #     fi
  #   '';
  #   extraStopCommands = ''
  #     if ip link show docker0 >/dev/null 2>&1; then
  #       iptables -D INPUT -i docker0 -j ACCEPT 2>/dev/null || true
  #       iptables -D FORWARD -i docker0 -j ACCEPT 2>/dev/null || true
  #     fi
  #   '';
  # };

  age.secrets.wireguard = {
    file = ../../secrets/wireguard.age;
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = config.age.secrets.wireguard.path;
    };
  };

  environment.systemPackages = with pkgs; [

    # IDE
    jetbrains.idea-ultimate

    # Utility
    bitwarden-cli
    obsidian
    librewolf
    brave
    onlyoffice-desktopeditors
    gparted

    # Docker & K8s
    stern
    kubectx
    kubectl
    docker-buildx

    # Google Cloud
    (pkgs.google-cloud-sdk.withExtraComponents [
      pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])

  ];
}
