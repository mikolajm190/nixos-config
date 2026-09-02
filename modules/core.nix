{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  services.xserver.xkb = {
    layout = "pl";
    variant = "qwerty";
  };

  hardware.bluetooth.enable = true;
  services.printing.enable = true;
}
