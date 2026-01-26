{pkgs, ...}: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    librewolf
  ];

  programs.ssh.startAgent = true;
}
