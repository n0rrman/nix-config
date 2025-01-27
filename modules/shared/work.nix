{ pkgs, ... }: {

  # Docker config
  environment.sessionVariables = {
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
  };
  virtualisation.docker.enable = true;
  virtualisation.docker.extraOptions = "--default-ulimit nofile=1024000:1024000 --mtu=1340";


  environment.systemPackages = with pkgs; [

    # Docker
    docker
    docker-compose
    docker-buildx

    # Kubernetes
    stern
    kubectx
    kubectl

    # Google Cloud
    (pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ])

    # Utility
    jq
    bitwarden-desktop
    postgresql_17
    sqlite
    age
    ollama

    # IDE
    jetbrains.idea-ultimate

  ];
}
