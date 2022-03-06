{ config, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 3;
  boot.loader.systemd-boot.configurationLimit = 4;

  boot.kernelParams = [
    # "acpi_rev_override=1"
    "mem_sleep_default=deep"
    "quiet"
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
  };
  boot.extraModprobeConfig = ''
    options power_save=1
    options nvidia-drm modeset=1 
    options nvidia NVreg_UsePageAttributeTable=1
  '';
  boot.blacklistedKernelModules = [ "acpi_power_meter" "psmouse" ];

}