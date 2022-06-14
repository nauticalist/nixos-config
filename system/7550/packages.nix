{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ntfs3g
    exfat
    dosfstools
    e2fsprogs
    lsof
    nmap
    powertop
    vim
    wget
    firefox
    kate
    google-chrome
    go_1_18
    libsForQt5.bismuth
    libsForQt5.spectacle
    libsForQt5.sddm-kcm
    jdk
    kate
    rofi
    rofi-calc
    rofi-emoji
    rofi-systemd
    rofi-power-menu
    killall
    pciutils
    sysstat
    firefox
    coreutils
    binutils
    gnutls
    curl
    xorg.xbacklight
    bind
    mkpasswd
    ffmpeg
    zip
    unzip
    unrar
    lm_sensors
    ark
    sbt
    maven
    gradle
    gcc
    nodejs-16_x
    yarn
    okular
    libsForQt5.gwenview
    via
    vial
    buildah
    (python310.withPackages (ps: with ps; [
      pip
    ]))
  ];

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

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
    };
  };
}
