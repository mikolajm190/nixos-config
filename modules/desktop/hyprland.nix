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

    environment.systemPackages = with pkgs; [
      blueman
      brightnessctl
      cliphist
      fuzzel
      hypridle
      hyprlock
      hyprpaper
      hyprshot
      mako
      networkmanagerapplet
      nwg-displays
      pavucontrol
      playerctl
      thunar
      waybar
      wl-clipboard
    ];

    environment.sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      HYPRCURSOR_THEME = "Bibata-Modern-Ice";
      HYPRCURSOR_SIZE = "24";
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = "24";
    };
  };
}
