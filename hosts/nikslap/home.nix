{
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

  fonts.fontconfig.enable = false;

  home.stateVersion = "25.11";
}
