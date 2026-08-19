{ lib, config, ... }:
let
  cfg = config.home-desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = false;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          margin-top = 5;
          margin-left = 5;
          margin-right = 5;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [
            "pulseaudio"
            "bluetooth"
            "network"
            "battery"
          ];

          "hyprland/workspaces" = {
            disable-scroll = true;
            sort-by-number = true;
            format = "󱄅";
          };

          clock = {
            format = "{:%d %B %H:%M}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "month";
              on-click-right = "mode";
              format = {
                months = "<span color='#cba6f7'><b>{}</b></span>";
                days = "<span color='#cdd6f4'>{}</span>";
                weekdays = "<span color='#89b4fa'><b>{}</b></span>";
                today = "<span color='#fab387'><b><u>{}</u></b></span>";
              };
            };
          };

          pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = "󰝟 ";
            format-icons.default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
            on-click = "pavucontrol";
          };

          bluetooth = {
            format = "󰂯";
            format-disabled = "󰂲";
            format-off = "󰂲";
            format-connected = "󰂱 {num_connections}";
            tooltip-format = "{status}";
            tooltip-format-connected = "{device_alias}";
            on-click = "blueman-manager";
          };

          network = {
            format-wifi = "󰤨";
            format-ethernet = "󰈀";
            format-disconnected = "󰤭";
            tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}";
            tooltip-format-ethernet = "{ifname} {ipaddr}";
            tooltip-format-disconnected = "Disconnected";
            on-click = "nm-connection-editor";
          };

          tray = {
            icon-size = 18;
            spacing = 8;
          };

          battery = {
            format = "󰁹 {capacity}%";
            format-charging = "󰂄 {capacity}%";
          };
        };
      };

      style = /* css */ ''
        @define-color base      #1e1e2e;
        @define-color mantle    #181825;
        @define-color crust     #11111b;
        @define-color text      #cdd6f4;
        @define-color subtext0  #a6adc8;
        @define-color surface0  #313244;
        @define-color surface1  #45475a;
        @define-color overlay0  #6c7086;
        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;

        * {
          font-family: "Noto Nerd Font";
          font-size: 20px;
          min-height: 0;
          border: none;
          border-radius: 0;
        }

        window#waybar {
          background-color: transparent;
          color: @text;
        }

        /* ── Workspaces ── */
        #workspaces {
          background-color: @base;
          border-radius: 8px;
          margin: 5px 4px;
          padding: 0 8px 0 4px;
        }

        #workspaces button {
          all: unset;
          color: @overlay0;
          padding: 5px 10px;
          border-radius: 6px;
          transition: color 0.15s ease;
        }

        #workspaces button.active {
          color: @lavender;
        }

        #workspaces button.urgent {
          color: @red;
        }

        #workspaces button:hover {
        }

        /* ── Shared module pill styles ── */
        #clock,
        #pulseaudio,
        #bluetooth,
        #network,
        #tray,
        #battery {
          background-color: @base;
          padding: 0 12px;
          margin: 5px 0;
        }

        /* Left caps */
        #pulseaudio {
          border-radius: 8px 0 0 8px;
          margin-left: 4px;
          color: @lavender;
        }

        /* Internal joins — no radius */
        #network {
          border-radius: 0;
          color: @lavender;
        }

        #battery {
          color: @lavender;
          border-radius: 0 8px 8px 0;
          margin-right: 4px;
        }

        /* Standalone pills */
        #clock {
          border-radius: 8px;
          color: @mauve;
          padding: 0 16px;
        }

        #tray {
          border-radius: 8px;
          margin-left: 12px;
          margin-right: 4px;
        }

        tooltip {
          background: @base;
          border: 1px solid @surface1;
          border-radius: 8px;
          color: @text;
        }
      '';
    };
  };
}
