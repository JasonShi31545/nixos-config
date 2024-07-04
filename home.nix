{pkgs, inputs, ...}: {
  imports = with inputs; [
  ];

  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.packages = [
    pkgs.neofetch
    pkgs.distrobox
    pkgs.podman
    pkgs.docker
  ];

  programs.home-manager.enable = true;

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

  programs.git = {
    enable = true;
    userName = "Jason Shi";
    userEmail = "REDACTED";
  };


  home.stateVersion = "24.05";
}
