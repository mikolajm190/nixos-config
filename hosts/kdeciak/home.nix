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

  fonts.fontconfig.enable = false;

  home.stateVersion = "25.11";
}
