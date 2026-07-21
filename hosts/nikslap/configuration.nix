{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  code-editing.enable = true;
  code-editing.zed.enable = true;

  containerisation.enable = true;
  containerisation.podman.enable = true;
  vm.virtualbox.enable = false;

  gpu.enable = true;
  gpu.nvidia.enable = false;
  gpu.intel.enable = true;

  laptop.enable = true;

  desktop.kde.enable = false;
  desktop.hyprland.enable = true;

  ai.enable = true;
  ai.codex.enable = true;

  gaming.enable = false;
  gaming.steam.enable = false;
  gaming.discord.enable = false;

  system.stateVersion = "25.11";
}
