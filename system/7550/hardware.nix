{ config, ... }:

{
  hardware.opengl.enable = true;
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.powerManagement.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  hardware.bluetooth = {
    enable = true;
    settings = { General = { Enable = "Source,Sink,Media,Socket"; }; };
  };

  hardware.pulseaudio.enable = false;

}
