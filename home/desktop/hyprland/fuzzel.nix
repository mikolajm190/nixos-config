{ lib, config, ... }:
let
  cfg = config.home-desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "Jetbrains Nerd Font:size=12";
          width = 42;
          lines = 12;
          tabs = 4;
          horizontal-pad = 18;
          vertical-pad = 14;
          inner-pad = 8;
        };

        colors = {
          background = "121216cc";
          text = "ffffffff";
          prompt = "ffffffff";
          input = "ffffffff";
          match = "ffffffff";
          selection = "ffffff2e";
          selection-text = "ffffffff";
          selection-match = "ffffffff";
          border = "ffffff2e";
        };

        border = {
          width = 1;
          radius = 6;
        };
      };
    };
  };
}
