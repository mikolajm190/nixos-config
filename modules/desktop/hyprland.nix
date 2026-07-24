{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.desktop.hyprland;
in
{
  options.desktop.hyprland = {
    enable = lib.mkEnableOption "enable Hyprland window manager";
  };

  config = lib.mkIf cfg.enable {
    programs.regreet = {
      enable = true;

      settings = {
        GTK = {
          application_prefer_dark_theme = true;
          #cursor_theme_name = "Bibata-Modern-Ice";
          #font_name = "JetBrainsMono Nerd Font 11";
          #icon_theme_name = "Papirus-Dark";
          #theme_name = "Nordic";
        };
      };
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
