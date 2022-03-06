{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    killall
    pciutils
    acpica-tools
    ntfs3g
    dosfstools
    e2fsprogs
    exfat
    vim
    wget
    lsof
    nmap
    powertop # monitor energy consumption
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
    git
    alacritty
    zip
    unzip
    unrar
    libsForQt5.kde-gtk-config
    qdigidoc
    chromium
    gtk-engine-murrine
    libsForQt5.breeze-gtk
    libsForQt5.qtstyleplugins
    libsForQt5.qtcurve
    libsForQt5.xdg-desktop-portal-kde
    lm_sensors
    gtk3
    gtk4
    docker-compose
    jdk
    go_1_17
    ark
    teamviewer
    qt5ct
    xdg-desktop-portal
    gnome.gnome-settings-daemon
    gsettings-desktop-schemas
    gsettings-qt
    gparted
    libsForQt5.kgpg
    google-chrome
    sbt
    maven
    gradle
    gcc
    nodejs-16_x
    yarn
    via
    vial
    (python39.withPackages (ps: with ps; [
      pip
      powerline
      pygments
      pynvim
    ]))
  ];

  programs = {
    java.enable = true;
    vim.defaultEditor = true;
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "adb"
          "battery"
          "git-flow"
          "scala"
          "sbt"
          "themes"
          "command-not-found"
        ];
      };
    };
  };

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      powerline-fonts
      nerdfonts
    ];
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
      enableOnBoot = true;
    };
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
    };
  };
}
