{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      corefonts # Microsoft free fonts
      fira-code
      google-fonts
      hack-font
      hasklig
      noto-fonts
      powerline-fonts
      siji
      unifont
    ];
    
    fontconfig.defaultFonts = {
      serif = [ "Ubuntu Condensed" "Ubuntu" ];
      sansSerif = [ "Ubuntu" ];
      monospace = [ "Fira Code" ];
    };
  };
}
