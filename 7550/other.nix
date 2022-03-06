{ config, ... }:

{
  security.rtkit.enable = true;
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
}