{
  pkgs,
  ...
}:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.firefox.enable = false;
  environment.systemPackages = with pkgs; [
    # librewolf
    # ladybird
  ];

  programs.ssh.startAgent = true;
}
