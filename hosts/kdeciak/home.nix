{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home
  ];

  home.username = "mikolajm";
  home.homeDirectory = "/home/mikolajm";

  home-desktop.hyprland.enable = true;

  fonts.fontconfig.enable = false;

  home.stateVersion = "25.11";
}
