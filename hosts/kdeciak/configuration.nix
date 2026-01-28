{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  _containers.enable = true;
  _containers.podman.enable = true;

  system.stateVersion = "25.11";
}
