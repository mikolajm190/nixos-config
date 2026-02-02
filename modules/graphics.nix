{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.gpu;
  driverPkgs =
    lib.optional cfg.nvidia.enable "nvidia"
    ++ lib.optional cfg.intel.enable "modesetting"
    ++ cfg.amd.enable "amdgpu";
in
{
  options.gpu = {
    enable = lib.mkEnableOption "enable graphics module";
    nvidia.enable = lib.mkEnableOption "enable nvidia gpu support";
    amd.enable = lib.mkEnableOption "enable amd gpu support";
    intel.enable = lib.mkEnableOption "enable intel gpu support";
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion =
          lib.count (e: e) [
            cfg.nvidia.enable
            cfg.amd.enable
            cfg.intel.enable
          ] <= 1;
        message = "Please enable only one gpu vendor";
      }
    ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    services.xserver.videoDrivers = driverPkgs;
    hardware.nvidia.open = lib.mkDefault true;

    hardware.graphics.extraPackages = lib.mkIf cfg.intel.enable [
      pkgs.intel-media-driver
      pkgs.vpl-gpu-rt
      pkgs.intel-compute-runtime
    ];
  };
}
