{ pkgs, ... }:
{
  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    python3
  ];
}
