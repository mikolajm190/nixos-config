{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  _containers.enable = true;
  _containers.podman.enable = true;

  gaming.enable = false;

  system.stateVersion = "25.11";
}
