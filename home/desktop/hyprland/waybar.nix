{ lib, config, ... }:
let
  cfg = config.home-desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    xdg.configFile."waybar/config".text = ''
      {
        "layer": "top",
        "position": "top",
        "height": 30,
        "modules-left": ["hyprland/workspaces"],
        "modules-center": ["clock"],
        "modules-right": ["pulseaudio", "bluetooth", "network", "battery"],
        "hyprland/workspaces": {
          "format": "{name}"
        },
        "clock": {
          "format": "󰃰 {:%Y-%m-%d %H:%M}"
        },
        "pulseaudio": {
          "format": "󰕾 {volume}%",
          "format-muted": "󰖁",
          "on-click": "pavucontrol"
        },
        "bluetooth": {
          "format": "󰂯",
          "format-disabled": "󰂲",
          "format-off": "󰂲",
          "format-connected": "󰂱 {num_connections}",
          "tooltip-format": "{status}",
          "tooltip-format-connected": "{device_alias}",
          "on-click": "blueman-manager"
        },
        "network": {
          "format-wifi": "󰖩",
          "format-ethernet": "󰈀",
          "format-disconnected": "󰖪",
          "tooltip-format-wifi": "{essid} ({signalStrength}%)",
          "tooltip-format-ethernet": "{ifname}",
          "tooltip-format-disconnected": "Disconnected",
          "on-click": "nm-connection-editor"
        },
        "battery": {
          "format": "󰁹 {capacity}%",
          "format-charging": "󰂄 {capacity}%"
        }
      }
    '';

    xdg.configFile."waybar/style.css".text = ''
      * {
        border: none;
        border-radius: 0;
        box-shadow: none;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(18, 18, 22, 0.36);
        border-bottom: 1px solid rgba(255, 255, 255, 0.18);
        color: #ffffff;
      }

      #workspaces button {
        padding: 0 9px;
        color: rgba(255, 255, 255, 0.72);
        background: transparent;
      }

      #workspaces button.active {
        color: #ffffff;
        background: rgba(255, 255, 255, 0.18);
      }

      #clock,
      #pulseaudio,
      #bluetooth,
      #network,
      #battery,
      #tray {
        padding: 0 10px;
        color: #ffffff;
        background: transparent;
      }

      #pulseaudio:hover,
      #bluetooth:hover,
      #network:hover {
        background: rgba(255, 255, 255, 0.16);
      }
    '';
  };
}
