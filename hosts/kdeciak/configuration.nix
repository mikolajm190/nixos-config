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

  code-editing.enable = true;
  code-editing.idea.enable = true;
  code-editing.zed.enable = true;

  _containers.enable = true;
  _containers.podman.enable = true;

  gaming.enable = false;

  system.stateVersion = "25.11";
}
