{
  pkgs,
  inputs,
  ...
}: let
  zen-browser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    zen-browser
    # librewolf
    # ladybird
  ];

  programs.ssh.startAgent = true;
}
