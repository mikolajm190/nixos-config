{ lib, config, ... }:
let
  cfg = config.desktop.kde;
in
{
  options.desktop.kde = {
    enable = lib.mkEnableOption "enable KDE Plasma desktop";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = false;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
