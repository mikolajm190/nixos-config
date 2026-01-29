{ pkgs, ... }:
{
  users.users.mikolajm = {
    isNormalUser = true;
    description = "mikolajm";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # user packages
    ];
  };
}
