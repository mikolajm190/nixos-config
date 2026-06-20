{
  pkgs,
  myvars,
  ...
}:
let
  hostname = myvars.hosts.nikslap.hostname;
in
{
  networking.hostName = hostname;
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  programs.firefox.enable = false;
  environment.systemPackages = with pkgs; [
    # librewolf
    # ladybird
  ];

  programs.ssh.startAgent = true;
}
