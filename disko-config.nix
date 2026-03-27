{
  disko.devices = {
    disk = {
      vda = { # Cambia "vda" por el nombre de tu disco (ej. sda, nvme0n1)
        type = "disk";
        device = "/dev/vda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              size = "4G"; # Ajusta según tu RAM
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true; # Útil para hibernación
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}