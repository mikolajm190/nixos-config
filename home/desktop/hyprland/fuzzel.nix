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
          background = "1e1e2eff";
          text = "b4bfefff";
          prompt = "b4bfefff";
          input = "b4bfefff";
          match = "b4bfefff";
          selection = "b4bfef2e";
          selection-text = "b4bfefff";
          selection-match = "b4bfefff";
          border = "89b4faff";
        };

        border = {
          width = 1;
          radius = 6;
        };
      };
    };
  };
}
