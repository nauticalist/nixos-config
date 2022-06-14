{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nauticalist";
  home.homeDirectory = "/home/nauticalist";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    vlc
    zoom-us
    jq
    libreoffice-fresh
    jetbrains.goland
    layan-kde
    tela-icon-theme
    papirus-maia-icon-theme
    papirus-icon-theme
    paper-icon-theme
    arc-kde-theme
    adapta-kde-theme
    materia-kde-theme
    gotop
    sassc
    exa
    brave
    font-awesome
    qbittorrent
    neofetch
    digikam
    rawtherapee
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
      export PATH="$HOME/.local/bin:$PATH"
      export GOPATH="$HOME/go"
      export GOBIN="$HOME/go/bin"
      export PATH="$GOPATH/bin:$PATH"
    '';
    shellAliases = {
      cp = "cp -i"; # Confirm before overwriting something
      df = "df -h"; # Human-readable sizes
      free = "free -m"; # Show sizes in MB
      grep = "grep --color=auto";
      exa = "exa --color=auto --icons --binary --git";
      ls = "exa";
    };
  };
  
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ 
      vim-airline
      vim-airline-themes
      vim-nix
      vim-go
      awesome-vim-colorschemes
    ];
    settings = { ignorecase = true; };
    extraConfig = ''
      syntax on
      filetype plugin indent on
      set mouse=a

      let g:airline_powerline_fonts = 1
      au VimEnter * exec 'AirlineTheme hybrid'
      set encoding=utf-8
      set background=dark
      set termguicolors
      colo PaperColor
      set number
    
      set tabstop=4
      set shiftwidth=4
      set softtabstop=4
      set expandtab
    '';
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      golang.go
      dracula-theme.theme-dracula
      pkief.material-icon-theme
    ];
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.git = {
    enable = true;
    userName  = "nauticalist";
    userEmail = "iaksoy@seanapse.io";
  };
}
