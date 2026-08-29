{ lib, config, ... }:
let
  cfg = config.laptop;
  isKdeEnabled = config.desktop.kde.enable;
in
{
  options.laptop = {
    enable = lib.mkEnableOption "enable laptop power and lid handling";
  };

  config = lib.mkIf cfg.enable {
    powerManagement.enable = true;

    services.tlp.enable = !isKdeEnabled;
    services.thermald.enable = true;

    services.logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
