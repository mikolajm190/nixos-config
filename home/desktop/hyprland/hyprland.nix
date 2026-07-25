{
  config,
  lib,
  pkgs,
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

    home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    gtk = {
      enable = true;

      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };

      font = {
        name = "Noto";
        size = 11;
      };
    };
  };
}
