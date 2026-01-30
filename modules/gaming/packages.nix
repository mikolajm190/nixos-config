{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.gaming;
  gamingPkgs =
    lib.optional cfg.heroic.enable pkgs.heroic
    ++ lib.optional cfg.lutris.enable pkgs.lutris
    ++ lib.optional cfg.discord.enable pkgs.discord;
in
{
  options.gaming = {
    enable = lib.mkEnableOption "enable gaming module";
    steam.enable = lib.mkEnableOption "enable steam";
    heroic.enable = lib.mkEnableOption "enable heroic";
    lutris.enable = lib.mkEnableOption "enable lutris";
    discord.enable = lib.mkEnableOption "enable discord";
  };

  config = lib.mkIf cfg.enable {
    programs.gamemode.enable = true;

    programs.steam = lib.mkIf cfg.steam.enable {
      enable = true;
    };

    environment.systemPackages = [ gamingPkgs ];
  };
}
