#{pkgs, inputs, ...}:


{ config, pkgs, ... }:
{
  #imports = with inputs; [
  #];

  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.packages = with pkgs; [
##    neofetch
    distrobox
    podman
    docker
##    foot
    pcmanfm
##    gh
    lxappearance
    tldr
    mpv
    btrfs-progs
    networkmanagerapplet
    rsync
    fd-find
    ripgrep
    wdisplays
    wlr-randr
    wl-clipboard
    gparted
    grim
    sway-contrib.grimshot
##    conky
##    rofi-wayland
##    swaylock
    fira-code
  ];

  home.sessionVariables = {
    EDITOR = "nvim";

  };
  home.file = {
  };

  program.fastfetch.enable = true;

  programs.home-manager.enable = true;

  documentation.info.enable = true;

  programs.waybar = {
    enable = true;
  };

  program.sway = {
    package = "swayfx";
    enable = true;
  };
  programs.sway.package = "swayfx";
  programs.sway.enable = true;

  programs.swaylock = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
  };

  services.conky = {
    enable = true;
    extraConfig = ''

    '';
  };

  programs.neovim.vimAlias = true;
  programs.neovim = {
      enable = true;
      extraConfig = ''
        #" set autoindent
        set wrap
        set number
        set smartindent
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab
        set nocompatible
        filetype on
        filetype plugin on
        filetype indent on
        set nobackup
        set scrolloff=0
        set hlsearch
        set visualbell
        syntax on
      '';
  };

  programs.htop.enable = true;

  programs.tmux = {
    enable = true;
    keyMode = "emacs";
    extraConfig = ''
      set -g mouse on
    '';
  }


  programs.virt-manager.enable = true;

  services.flatpak.enable = true;


  security.polkit.enable = true;
  security.polkit.debug = true;

  services.dbus.enable = true;

  services.btrfs.autoScrub.enable = true;

  services.printing.enable = true;

## NAH, put emacs under container, easier since doom is already declarative anyways

##  programs.emacs = {
##    enable = true;
##
##  };
##  services.emacs = {
##    enable = true;
##    startWithGraphical = true;
##    ##install = true;
##  };

  editorconfig = {
    enable = true;
    settings = {
      "*.{c,cc,cpp,cxx,py,s,asm}" = {
        indent_style = "space";
        indent_size = 4;
        trim_trailing_whitespace = true;
        insert_final_newline = true;
      }
      "Makefile" = {
        indent_style = "tab";
      };
    };
  };


  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
    };
  };

  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      "ls" = "ls --color=auto"
      "grep" = "grep --color=auto"
      "ll" = "ls --color=auto -l"
      "la" = "ls --color=auto -a"
      "l" = "ls --color=auto"
      "e" = "vim"
      "rm" = "rm -i"
    };
    bashrcExtra = ''
      export PS1="──[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\W\[\e[0m\]]─╼ "
      export PATH="~/.local/bin:$PATH"
      export HISTCONTROL=erasedups:ignoreboth
      [ -f "/home/jason/.ghcup/env" ] && . "/home/jason/.ghcup/env" # ghcup-env
    ''
  };

  programs.gh = {
    enable = true;

  };

  programs.git = {
    enable = true;
    userName = "Jason Shi";
    userEmail = "REDACTED";
  };

  gtk = {
      enable = true;
      theme.name = "Rayleigh";
      cursorTheme.name = "Adwaita";
      iconTheme.name = "nuoveXT2";
  };

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableBrowserSocket = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # xdg
  xdg = {
    portal.enable = true;
    terminal-exec.enable = true;
    terminal-exec.settings = {
        default = [
          "footclient"
        ];
    };
    portal.xdgOpenUsePortal = true;
    portal.wlr.enable = true;
    mimeApps.defaultApplications = {
        "image/*" = ["imv-wayland"];
        "video/*" = ["mpv.desktop"];
    };

    userDirs.enable = true;
    userDirs.desktop = "${config.home.homeDirectory}/desk";
    userDirs.documents = "${config.home.homeDirectory}/docs";
    userDirs.download = "${config.home.homeDirectory}/downloads";
    userDirs.music = "${config.home.homeDirectory}/music";
    userDirs.pictures = "${config.home.homeDirectory}/media";
    userDirs.videos = "${config.home.homeDirectory}/videos";
    userDirs.templates = "${config.home.homeDirectory}/templates";
    userDirs.publicShare = "${config.home.homeDirectory}/pub";

  };



#  environment.etc = {
#      "xdg/user-dirs.dirs".text = ''
#        XDG_DOCUMENTS_DIR="$HOME/docs"
#        XDG_DOWNLOAD_DIR="$HOME/downloads"
#        XDG_MUSIC_DIR="$HOME/music"
#        XDG_PICTURES_DIR="$HOME/media"
#        XDG_PUBLICSHARE_DIR="$HOME/pub"
#        XDG_TEMPLATES_DIR="$HOME/templates"
#        XDG_VIDEOS_DIR="$HOME/videos"
#        XDG_DESKTOP_DIR="$HOME/desk"
#      '';
#  };



  home.stateVersion = "24.05";
}
