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
  networking.hosts = {
    "192.168.0.247" = [ "niksos" ];
  };

  programs.firefox.enable = false;
  environment.systemPackages = with pkgs; [
    # librewolf
    # ladybird
  ];

  programs.ssh.startAgent = true;
}
