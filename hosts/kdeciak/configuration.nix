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

  gpu.enable = true;
  gpu.nvidia.enable = false;
  gpu.intel.enable = true;

  ai.enable = false;
  ai.codex.enable = false;

  gaming.enable = false;

  system.stateVersion = "25.11";
}
