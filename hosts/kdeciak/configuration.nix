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
  gpu.nvidia.enable = true;

  ai.enable = true;
  ai.ollama.enable = true;
  ai.opencode.enable = true;
  ai.codex.enable = true;

  gaming.enable = false;

  system.stateVersion = "25.11";
}
