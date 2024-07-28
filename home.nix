{pkgs, inputs, ...}: {
  imports = with inputs; [
  ];

  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.packages = with pkgs; [
    neofetch
    distrobox
    podman
    docker
    foot
    pcmanfm
    gh
    lxappearance
    tldr
    mpv
    btrfs-progs
    networkmanagerapplet
    rsync
    fd-find
    editorconfig
    ripgrep
    wdisplays
    wlr-randr
    wl-clipboard
    gparted
    grim
    sway-contrib.grimshot
    conky
    rofi-wayland
    swaylock
    fira-code
  ];

  programs.home-manager.enable = true;

  documentation.info.enable = true;

  programs.waybar.enable = true;

  programs.sway.package = "swayfx";
  programs.sway.enable = true;

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
  programs.tmux.enable = true;
  programs.tmux.keyMode = "emacs";
  programs.autojump.enable = true;

  programs.virt-manager.enable = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;

  security.polkit.enable = true;
  security.polkit.debug = true;

  services.dbus.enable = true;

  services.btrfs.autoScrub.enable = true;

  services.printing.enable = true;


  services.emacs.enable = true;
  services.emacs.startWithGraphical = true;
  services.emacs.install = true;

  programs.git = {
    enable = true;
    userName = "Jason Shi";
    userEmail = "REDACTED";
  };

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableBrowserSocket = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # xdg
  xdg.terminal-exec.enable = true;
  xdg.terminal-exec.settings = {
      default = [
        "footclient"
      ];
  };
  xdg.portal.xdgOpenUsePortal = true;
  xdg.portal.wlr.enable = true;

  environment.etc = {
      "xdg/user-dirs.dirs".text = ''
        XDG_DOCUMENTS_DIR="$HOME/docs"
        XDG_DOWNLOAD_DIR="$HOME/downloads"
        XDG_MUSIC_DIR="$HOME/music"
        XDG_PICTURES_DIR="$HOME/media"
        XDG_PUBLICSHARE_DIR="$HOME/pub"
        XDG_TEMPLATES_DIR="$HOME/templates"
        XDG_VIDEOS_DIR="$HOME/videos"
        XDG_DESKTOP_DIR="$HOME/desk"
      '';
  };

  home.stateVersion = "24.05";
}
