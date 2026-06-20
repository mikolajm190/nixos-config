{
  lib,
  config,
  myvars,
  ...
}:
let
  username = myvars.hosts.nikslap.username;
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

    users.users.${username}.extraGroups = [ "vboxusers" ];
  };
}
