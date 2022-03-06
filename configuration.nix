{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./7550/boot.nix
      ./7550/audio.nix
      ./7550/bluetooth.nix
      ./7550/fonts.nix
      ./7550/desktop.nix
      ./7550/gpu.nix
      ./7550/locale.nix
      ./7550/networking.nix
      ./7550/packages.nix
      ./7550/services.nix
      ./7550/user.nix
      ./7550/other.nix
    ];

  system.stateVersion = "21.11"; # Did you read the comment?
}

