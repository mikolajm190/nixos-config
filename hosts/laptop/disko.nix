{
  disko.devices = {
    disk = {
      main = {
        type = "disk";

        # Replace this with your real NVMe disk path.
        # Check with:
        #   ls -l /dev/disk/by-id/
        device = "/dev/disk/by-id/nvme-PNY_CS2130_2TB_SSD_PNY21182105070105EF8";

        content = {
          type = "gpt";

          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            luks = {
              size = "100%";

              content = {
                type = "luks";
                name = "cryptsystem";

                settings = {
                  allowDiscards = true;
                };

                content = {
                  type = "lvm_pv";
                  vg = "vg0";
                };
              };
            };
          };
        };
      };
    };

    lvm_vg = {
      vg0 = {
        type = "lvm_vg";

        lvs = {
          root = {
            size = "200G";

            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [ "defaults" ];
            };
          };

          home = {
            size = "100%FREE";

            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
              mountOptions = [ "defaults" ];
            };
          };
        };
      };
    };
  };
}
