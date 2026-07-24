{
  config,
  lib,
  ...
}:
let
  cfg = config.home-desktop.hyprland;
in
{
  options.home-desktop.hyprland = {
    enable = lib.mkEnableOption "enable Hyprland user configuration";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/hypr/hyprland.lua".source = ../../../hypr/hyprland.lua;
  };
}
