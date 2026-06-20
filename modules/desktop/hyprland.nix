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
    services.xserver.enable = false;
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      hyprpaper
      hyprshot
      waybar
      fuzzel
      brightnessctl
      networkmanagerapplet
      nwg-displays
      playerctl
      pavucontrol
    ];
  };
}
