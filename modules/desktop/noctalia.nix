{
  config,
  lib,
  ...
}:
let
  cfg = config.desktop.noctalia;
in
{
  options.desktop.noctalia = {
    enable = lib.mkEnableOption "enable Noctalia shell";
  };

  config = lib.mkIf cfg.enable {
    # todo
  };
}
