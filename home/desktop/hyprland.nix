{ lib, config, ... }:
let
  cfg = config.home-desktop.hyprland;
in
{
  options.home-desktop.hyprland = {
    enable = lib.mkEnableOption "enable Hyprland user configuration";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."hypr/hyprland.conf".text = ''
      monitor=,preferred,auto,1

      exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = waybar

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland

      input {
        kb_layout = us

        touchpad {
          natural_scroll = true
          tap-to-click = true
        }
      }

      general {
        gaps_in = 4
        gaps_out = 8
        border_size = 2
        col.active_border = rgb(8aadf4)
        col.inactive_border = rgb(494d64)
        layout = dwindle
      }

      decoration {
        rounding = 6
        blur {
          enabled = true
          size = 5
          passes = 2
        }
      }

      animations {
        enabled = true
        bezier = standard, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 5, standard
        animation = border, 1, 5, standard
        animation = fade, 1, 4, standard
        animation = workspaces, 1, 5, standard
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }

      $mod = SUPER
      $terminal = kitty
      $menu = fuzzel
      $browser = zen

      bind = $mod, T, exec, $terminal
      bind = $mod, S, exec, $menu
      bind = $mod, B, exec, $browser
      bind = $mod, Q, killactive
      bind = $mod SHIFT, M, exit
      bind = $mod, F, fullscreen
      bind = $mod, V, togglefloating
      bind = $mod, P, pseudo
      bind = $mod, T, togglesplit

      bind = $mod, H, movefocus, l
      bind = $mod, L, movefocus, r
      bind = $mod, K, movefocus, u
      bind = $mod, J, movefocus, d

      bind = $mod SHIFT, H, movewindow, l
      bind = $mod SHIFT, L, movewindow, r
      bind = $mod SHIFT, K, movewindow, u
      bind = $mod SHIFT, J, movewindow, d

      bind = , Print, exec, hyprshot -m region
      bind = SHIFT, Print, exec, hyprshot -m output
      bind = CTRL, Print, exec, hyprshot -m window
      bind = $mod, Print, exec, hyprshot -m region --clipboard-only
      bind = $mod SHIFT, Print, exec, hyprshot -m output --clipboard-only
      bind = $mod CTRL, Print, exec, hyprshot -m window --clipboard-only

      bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPrev, exec, playerctl previous
      bindel = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
      bindel = , XF86MonBrightnessDown, exec, brightnessctl set 5%-

      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10

      bind = $mod SHIFT, 1, movetoworkspace, 1
      bind = $mod SHIFT, 2, movetoworkspace, 2
      bind = $mod SHIFT, 3, movetoworkspace, 3
      bind = $mod SHIFT, 4, movetoworkspace, 4
      bind = $mod SHIFT, 5, movetoworkspace, 5
      bind = $mod SHIFT, 6, movetoworkspace, 6
      bind = $mod SHIFT, 7, movetoworkspace, 7
      bind = $mod SHIFT, 8, movetoworkspace, 8
      bind = $mod SHIFT, 9, movetoworkspace, 9
      bind = $mod SHIFT, 0, movetoworkspace, 10
    '';

    xdg.configFile."waybar/config".text = ''
      {
        "layer": "top",
        "position": "top",
        "height": 30,
        "modules-left": ["hyprland/workspaces"],
        "modules-center": ["clock"],
        "modules-right": ["pulseaudio", "bluetooth", "network", "battery", "tray"],
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

    xdg.configFile."fuzzel/fuzzel.ini".text = ''
      font=JetBrainsMono Nerd Font:size=14
      width=42
      lines=12
      tabs=4
      horizontal-pad=18
      vertical-pad=14
      inner-pad=8

      [colors]
      background=121216cc
      text=ffffffff
      prompt=ffffffff
      input=ffffffff
      match=ffffffff
      selection=ffffff2e
      selection-text=ffffffff
      selection-match=ffffffff
      border=ffffff2e

      [border]
      width=1
      radius=6
    '';
  };
}
