{
  myvars,
  osConfig,
  ...
}:
let
  username = myvars.hosts.nikslap.username;
  isHyprlandEnabled = osConfig.desktop.hyprland.enable;
in
{
  imports = [
    ../../home
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.shellAliases = {
    ll = "ls -la";
    update = "nix flake update && git add flake.lock && git commit -m \"system: package update\" && sudo nixos-rebuild switch --flake .#nikslap";
    rebuild = "sudo nixos-rebuild switch --flake .#nikslap";
  };

  home-desktop.hyprland.enable = isHyprlandEnabled;

  fonts.fontconfig.enable = false;

  home.stateVersion = "25.11";
}
