{ lib, config, ... }:
let
  cfg = config.home-desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    xdg.configFile."mako/config".text = ''
      font=JetBrainsMono Nerd Font 11
      background-color=#1e1e2edd
      text-color=#cdd6f4ff
      border-color=#8aadf4ff
      progress-color=over #313244ff
      border-size=2
      border-radius=6
      padding=12
      margin=12
      default-timeout=6000
      ignore-timeout=1
    '';
  };
}
