{ pkgs, ... }:
{

  # Docker config
  environment.sessionVariables = {
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
  };

  virtualisation.docker = {
    enable = true;
    extraOptions = "--bip=\"172.26.0.1/16\" --default-address-pool=\"base=172.30.0.0/16,size=24\" --ipv6=false --default-ulimit nofile=1024000:1024000 --mtu=1340";
  };

  networking.firewall = {
    trustedInterfaces = [ "docker0" ];
    checkReversePath = false;
    extraCommands = ''
      ip46tables -A INPUT -s 172.17.0.0/16 -j ACCEPT
      ip46tables -A OUTPUT -d 172.17.0.0/16 -j ACCEPT
    '';
    extraStopCommands = ''
      ip46tables -D INPUT -s 172.17.0.0/16 -j ACCEPT 2>/dev/null || true
      ip46tables -D OUTPUT -d 172.17.0.0/16 -j ACCEPT 2>/dev/null || true
    '';
  };

  environment.systemPackages = with pkgs; [

    # IDE
    jetbrains.idea-ultimate

    # Utility
    bitwarden-cli
    obsidian
    librewolf
    libreoffice
    gparted

    # Docker
    docker
    docker-compose
    docker-buildx

    # Kubernetes
    stern
    kubectx
    kubectl

    # Google Cloud
    (pkgs.google-cloud-sdk.withExtraComponents [
      pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])

  ];
}
