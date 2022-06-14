{ config, ... }:

{
  # Bootloader.
  boot.plymouth.enable = true;

  boot.kernelParams = [ "quiet" "mem_sleep_default=deep" ];

  boot.kernelModules = [ "acpi_call" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  
  boot.loader = {
    systemd-boot.enable = true;
    # grub.enable = true;
    # grub.version = 2;
    # grub.efiSupport = true;
    # grub.devices = ["nodev"];
    # grub.useOSProber = true;
    efi.canTouchEfiVariables = true;
    #efi.efiSysMountPoint = "/boot/efi";
    timeout = 3;
    systemd-boot.configurationLimit = 4;
  };
}
