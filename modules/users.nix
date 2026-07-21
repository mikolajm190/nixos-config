{
  pkgs,
  myvars,
  ...
}:
let
  username = myvars.hosts.nikslap.username;
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      # user packages
    ];
  };
  programs.fish.enable = true;
}
