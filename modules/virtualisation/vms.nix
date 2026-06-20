{ lib, config, ... }:
let
  cfg = config.vm;
in
{
  options.vm = {
    virtualbox.enable = lib.mkEnableOption "enable VirtualBox";
  };

  config = lib.mkIf cfg.virtualbox.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

    users.users.mikolajm.extraGroups = [ "vboxusers" ];
  };
}
