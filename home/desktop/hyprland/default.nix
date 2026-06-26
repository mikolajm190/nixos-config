{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.home-desktop.hyprland;
  polkitAgent = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
in
{
  imports = [
    ./binds.nix
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./mako.nix
    ./waybar.nix
  ];

  options.home-desktop.hyprland = {
    enable = lib.mkEnableOption "enable Hyprland user configuration";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
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
      polkit_gnome
      waybar
      wl-clipboard
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;

      settings = {
        monitor = [ ",preferred,auto,1" ];

        exec-once = [
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "waybar"
          "mako"
          "hypridle"
          "hyprpaper"
          "nm-applet --indicator"
          "blueman-applet"
          polkitAgent
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "HYPRCURSOR_THEME,Bibata-Modern-Ice"
          "HYPRCURSOR_SIZE,24"
          "XCURSOR_THEME,Bibata-Modern-Ice"
          "XCURSOR_SIZE,24"
        ];

        input = {
          kb_layout = "us";

          touchpad = {
            natural_scroll = true;
            tap-to-click = true;
          };
        };

        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = "rgb(8aadf4)";
          "col.inactive_border" = "rgb(494d64)";
          layout = "dwindle";
        };

        decoration = {
          rounding = 6;

          blur = {
            enabled = true;
            size = 5;
            passes = 2;
          };
        };

        animations = {
          enabled = true;
          bezier = "standard, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 5, standard"
            "border, 1, 5, standard"
            "fade, 1, 4, standard"
            "workspaces, 1, 5, standard"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
      };
    };
  };
}
