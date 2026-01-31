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
    ++ lib.optional cfg.vscode.enable pkgs.vscode
    ++ lib.optional cfg.cursor.enable pkgs.code-cursor
    ++ lib.optional cfg.zed.enable pkgs.zed-editor
    ++ lib.optional cfg.zellij.enable pkgs.zellij
    ++ lib.optional cfg.tmux.enable pkgs.tmux;
in
{
  options.code-editing = {
    enable = lib.mkEnableOption "enable code editing module";
    idea.enable = lib.mkEnableOption "enable intellij idea";
    vscode.enable = lib.mkEnableOption "enable vscode";
    cursor.enable = lib.mkEnableOption "enable cursor";
    zed.enable = lib.mkEnableOption "enable zed";
    zellij.enable = lib.mkEnableOption "enable zellij";
    tmux.enable = lib.mkEnableOption "enable tmux";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = codePkgs;
  };
}
