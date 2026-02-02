{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config._containers;
  containerGroups =
    lib.optional cfg.podman.enable "podman" ++ lib.optional cfg.docker.enable "docker";
  containerPkgs =
    lib.optional cfg.podman.enable pkgs.podman-compose
    ++ lib.optional cfg.docker.enable pkgs.docker-compose;
in
{
  options._containers = {
    enable = lib.mkEnableOption "enable containers module";
    podman.enable = lib.mkEnableOption "enable podman";
    docker.enable = lib.mkEnableOption "enable docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      containers.enable = true;
      podman = lib.mkIf cfg.podman.enable {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      docker = lib.mkIf cfg.docker.enable {
        enable = false;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };

      users.users.mikolajm.extraGroups = containerGroups;

      environment.systemPackages = containerPkgs;
    };
  };
}
