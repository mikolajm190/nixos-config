{
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

  home.shellAliases = {
    ll = "ls -la";
    update = "nix flake update && sudo nixos-rebuild switch --flake .#nikslap";
    rebuild = "sudo nixos-rebuild switch --flake .#nikslap";
  };

  home-desktop.hyprland.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      name = "Noto";
      size = 11;
    };
  };

  fonts.fontconfig.enable = false;

  home.stateVersion = "25.11";
}
