{ lib, config, ... }:
let
  cfg = config.home-desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    xdg.configFile."hypr/hyprlock.conf".text = ''
      general {
        disable_loading_bar = true
        hide_cursor = true
      }

      background {
        monitor =
        color = rgb(11111b)
      }

      input-field {
        monitor =
        size = 280, 54
        outline_thickness = 2
        dots_size = 0.25
        dots_spacing = 0.22
        fade_on_empty = false
        outer_color = rgb(8aadf4)
        inner_color = rgb(1e1e2e)
        font_color = rgb(cdd6f4)
        placeholder_text = Password
        position = 0, -40
        halign = center
        valign = center
      }

      label {
        monitor =
        text = cmd[update:1000] date +"%H:%M"
        color = rgb(cdd6f4)
        font_size = 72
        font_family = JetBrainsMono Nerd Font
        position = 0, 80
        halign = center
        valign = center
      }
    '';
  };
}
