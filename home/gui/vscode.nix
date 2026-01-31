{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hm-vscode;
in
{
  options.hm-vscode = {
    enable = lib.mkEnableOption "enable HM managed vscode";
    with-extensions.enable = lib.mkEnableOption "enable vscode extentions";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        extensions = lib.mkIf cfg.with-extensions.enable [
          pkgs.vscode-extensions.yzhang.markdown-all-in-one
          pkgs.vscode-extensions.jnoortheen.nix-ide
          pkgs.vscode-extensions.bradlc.vscode-tailwindcss
          pkgs.vscode-extensions.k--kato.intellij-idea-keybindings
        ];
      };
      mutableExtensionsDir = true;
    };
  };
}
