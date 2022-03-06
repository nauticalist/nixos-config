{ config, pkgs, ... }:

{
  services.fstrim.enable = true;
  services.printing.enable = true;
  services.xserver.libinput.enable = true;
  services.thermald.enable = true;
  services.flatpak.enable = true;
  services.teamviewer.enable = true;
    # e-residency
  services.pcscd.enable = true;
  services.pcscd.plugins = [ pkgs.acsccid ];
  services.tor.enable = true;
  programs.gnupg.agent = {
   enable = true;
   pinentryFlavor = "qt";
   enableSSHSupport = true;
   enableBrowserSocket = true;
  };
}