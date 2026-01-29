{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nordic
    papirus-icon-theme
    bibata-cursors
  ];
}
