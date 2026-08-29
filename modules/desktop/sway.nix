{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.desktop.sway;
in
{
  options.desktop.sway = {
    enable = lib.mkEnableOption "enable Sway window manager";
  };

  config = lib.mkIf cfg.enable {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      fuzzel
      mako
      wl-clipboard
    ];
  };
}
