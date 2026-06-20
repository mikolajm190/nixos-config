{
  config,
  pkgs,
  myvars,
  ...
}:
let
  username = myvars.hosts.nikslap.username;
in
{
  imports = [
    ../../home
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home-desktop.hyprland.enable = true;

  fonts.fontconfig.enable = false;

  home.stateVersion = "25.11";
}
