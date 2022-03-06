{ config, pkgs, ... }:

{
  users = {
    users.nauticalist = {
      isNormalUser = true;
      home = "/home/nauticalist";
      useDefaultShell = true;
      description = "Ismail Aksoy";
      extraGroups = [ "wheel" "video" "networkmanager" "docker" ];
    };
  };
}
