{ lib, config, ... }:
let
  cfg = config.laptop;
in
{
  options.laptop = {
    enable = lib.mkEnableOption "enable laptop power and lid handling";
  };

  config = lib.mkIf cfg.enable {
    powerManagement.enable = true;

    services.tlp.enable = true;
    services.thermald.enable = true;

    services.logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
