{pkgs, ...}: {
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    # docker = {
    #   enable = false;
    #   rootless = {
    #     enable = true;
    #     setSocketVariable = true;
    #   };
    # };
  };

  users.users.mikolajm.extraGroups = ["podman"];

  environment.systemPackages = with pkgs; [
    podman-compose
  ];
}
