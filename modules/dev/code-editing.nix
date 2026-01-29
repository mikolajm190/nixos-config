{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    jetbrains.idea
    vscode
    # code-cursor
    # zed-editor
    # zellij
  ];
}
