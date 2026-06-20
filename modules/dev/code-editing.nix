{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.code-editing;
  codePkgs =
    lib.optional cfg.idea.enable pkgs.jetbrains.idea
    ++ lib.optional cfg.zed.enable pkgs.zed-editor
    ++ lib.optional cfg.tmux.enable pkgs.tmux;
in
{
  options.code-editing = {
    enable = lib.mkEnableOption "enable code editing module";
    idea.enable = lib.mkEnableOption "enable intellij idea";
    zed.enable = lib.mkEnableOption "enable zed";
    tmux.enable = lib.mkEnableOption "enable tmux";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = codePkgs;
  };
}
