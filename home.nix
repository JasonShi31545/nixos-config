#{pkgs, inputs, ...}:


{ config, pkgs, ... }:
{
  #imports = with inputs; [
  #];

  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.packages = with pkgs; [
    distrobox
    boxbuddy
    podman
    docker
    pcmanfm
    lxappearance
    tldr
    btrfs-progs
    rsync
    ripgrep
    wdisplays
    wlr-randr
    wl-clipboard
    gparted
    grim
    slurp
    sway-contrib.grimshot
    shadowsocks-rust
  ];

  home.sessionVariables = {
  };

  # Put all the paths of the sources of my configuration files in this setting.
  home.file = {
      ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/git/gitconfig;
      ".config/conky/conky.conf".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/conky/conky.conf;
      ".config/foot/foot.ini".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/foot/foot.ini;
      #".config/nvim/init.vim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/nvim/init.vim;
      ".config/rofi/config.rasi".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/rofi/config.rasi;
      #".config/sway/config.ref".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/sway/config;
      ".config/swaylock/config".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/swaylock/config;
      ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/waybar/config;
      ".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/waybar/style.css;
      ".Xdefaults".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/X/Xdefaults;
      ".Xresources".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/X/Xresources;
  };

  programs.fastfetch.enable = true;

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;


  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.waybar = {
    enable = true;
  };



  wayland.windowManager.sway = {
    #package = pkgs.swayfx;
    enable = true;
    #extraConfigEarly = "include ~/.config/sway/config.ref";
  };

  #programs.sway = {
  #  package = pkg.swayfx;
  #  enable = true;
  #  wrapperFeatuers.gtk = true;
  #};

  programs.swaylock = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
    configPath = ".bad/rofi-backup/config.rasi";
  };

  services.network-manager-applet = {
    enable = true;
  };

  services.dunst = {
    enable = true;
  };

  services.kanshi = {
    enable = true;
  };

  services.conky = {
    enable = true;
    extraConfig = ''

    '';
  };

  programs.mpv = {
    enable = true;
  };

  programs.imv = {
    enable = true;
  };

  programs.neovim.vimAlias = true;
  programs.neovim = {
      enable = true;
      #extraConfig = ''
      #  #" set autoindent
      #  set wrap
      #  set number
      #  set smartindent
      #  set tabstop=4
      #  set shiftwidth=4
      #  set softtabstop=4
      #  set expandtab
      #  set nocompatible
      #  filetype on
      #  filetype plugin on
      #  filetype indent on
      #  set nobackup
      #  set scrolloff=0
      #  set hlsearch
      #  set visualbell
      #  syntax on
      #'';
  };

  programs.htop.enable = true;

  programs.fd = { enable = true; };

  programs.tmux = {
    enable = true;
    keyMode = "emacs";
    extraConfig = ''
      set -g mouse on
    '';
  };







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
      };
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

  programs.urxvt = {
    enable = true;
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
      "ls" = "ls --color=auto";
      "grep" = "grep --color=auto";
      "ll" = "ls --color=auto -l";
      "la" = "ls --color=auto -a";
      "l" = "ls --color=auto";
      "e" = "vim";
      "rm" = "rm -i";
      "mv" = "mv -i";
      "cp" = "cp -i";
    };
    bashrcExtra = ''
      export PS1="──[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\W\[\e[0m\]]─╼ "
      export PATH="~/.local/bin:$PATH"
      export HISTCONTROL=erasedups:ignoreboth
    '';
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


  xresources.path = ".bad/.Xresources.bak";

  # xdg
  xdg = {

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

  xdg.configFile."sway/config".source = pkgs.lib.mkForce ./dotfiles/sway/config;



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
