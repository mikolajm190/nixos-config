{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  code-editing.enable = true;
  code-editing.zed.enable = true;

  containerisation.enable = true;
  containerisation.podman.enable = true;

  gpu.enable = true;
  gpu.nvidia.enable = false;
  gpu.intel.enable = true;

  desktop.kde.enable = true;
  desktop.hyprland.enable = true;

  ai.enable = false;
  ai.codex.enable = false;

  gaming.enable = false;

  system.stateVersion = "25.11";
}
