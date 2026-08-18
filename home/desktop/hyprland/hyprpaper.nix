{
  lib,
  config,
  ...
}:
let
  cfg = config.home-desktop.hyprland;
  path = "/home/lordjim/Pictures/wallpapers/nix-wallpaper-dracula.png";
in
{
  config = lib.mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;

      settings = {
        ipc = true;
        splash = false;

        preload = [ path ];

        wallpaper = [
          {
            monitor = "";
            path = path;
            fit_mode = "cover";
          }
        ];
      };
    };
  };
}
