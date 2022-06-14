# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./7550/bootloader.nix
      ./7550/hardware.nix
      ./7550/networking.nix
      ./7550/packages.nix
      ./7550/services.nix
      ./7550/security.nix
    ];


  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.utf8";
    LC_IDENTIFICATION = "tr_TR.utf8";
    LC_MEASUREMENT = "tr_TR.utf8";
    LC_MONETARY = "tr_TR.utf8";
    LC_NAME = "tr_TR.utf8";
    LC_NUMERIC = "tr_TR.utf8";
    LC_PAPER = "tr_TR.utf8";
    LC_TELEPHONE = "tr_TR.utf8";
    LC_TIME = "tr_TR.utf8";
  };


  # scaling gtk applications
  environment.variables = {
    GDK_SCALE = "0.5";
  };  


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nauticalist = {
    isNormalUser = true;
    description = "Ismail Aksoy";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.autoUpgrade.enable = true;
  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    trustedUsers = [ "nauticalist" "root" ];
  };

  system.stateVersion = "22.05"; 

}
