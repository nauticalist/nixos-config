{ config, ... }:

{
  # Networking
  networking = {
    # Hostname
    hostName = "solanix";
    # Domain
    domain = "solanix.local";
    # Enable wireless network
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.eno2.useDHCP = true;
    interfaces.wlo1.useDHCP = true;
    firewall.enable = true;
  };
}