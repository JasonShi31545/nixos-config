# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

#{ pkgs, inputs, ... }:
{ inputs, config, pkgs, ... }:

{

  imports = with inputs; [
    ./hardware/default-hardware.nix
    home-manager.nixosModules.default
  ];

  home-manager = {
      extraSpecialArgs = { inherit inputs; };
      backupFileExtension = "bak";
      users = {
        jason = import ./home.nix;
      };
  };

  # Bootloader.
  boot.loader.grub.enable = true;
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  #boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.gfxmodeEfi = "1024x768";

  # luks

  #boot.initrd.luks.devices = {
  #  luksroot = {
  #    device = "/dev/disk/by-uuid/place-holder-uuid-for-root-cryptsetup-partition";
  #    preLVM = true;
  #    allowDiscards = true;
  #  };
  #};

  # FS
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  # sysrq
  boot.kernel.sysctl."kernel.sysrq" = 502;

  # swappiness
  boot.kernel.sysctl."vm.swappiness" = 5;

  # Virtualisation

  virtualisation.containers.enable = true;
  virtualisation.docker.rootless.enable = true;
 
  virtualisation.libvirtd.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # default terminal editor
  environment.variables.EDITOR = "nvim";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  i18n.inputMethod.enabled = "ibus";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11
  #services.xserver = {
  #  layout = "us";
  #  xkbVariant = "";
  #};

  # Dynamic Linking (not recommended)
  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [];


  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;

  # Docs

  documentation.info.enable = true;

  # Dconf
  programs.dconf.enable = true;

  # Virt-manager
  programs.virt-manager.enable = true;


  # light
  programs.light = {
    enable = true;
  };

  # polkit
  security.polkit.enable = true;
  security.polkit.debug = true;

  # sudo
  security.sudo.configFile = ''
  Defaults	env_reset,timestamp_timeout=-1
  Defaults	mail_badpass
  Defaults	use_pty
  Defaults	!tty_tickets
  root	ALL=(ALL:ALL)	SETENV: ALL
  %wheel	ALL=(ALL:ALL)	SETENV:ALL
  Defaults:root,%wheel env_keep+=TERMINFO_DIRS
  Defaults:root,%wheel env_keep+=TERMINFO
  '';

  # btrfs
  #services.btrfs.autoScrub.enable = true;


  services.dbus.enable = true;
  services.printing.enable = true;

  # xdg
  xdg = {
    portal.enable = true;
    #portals.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    terminal-exec.enable = true;
    terminal-exec.settings = {
        default = [
          "footclient"
        ];
    };
    portal.xdgOpenUsePortal = true;
    portal.wlr.enable = true;
    mime.defaultApplications = {
        "image/*" = ["imv-wayland"];
        "video/*" = ["mpv.desktop"];
    };
  };

  # flatpak
  services.flatpak.enable = true;



  hardware.cpu.amd.updateMicrocode = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jason = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "video" ];
    initialPassword = "default";
  };

  # Install firefox.
  #programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableBrowserSocket = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable Swaylock
  security.pam.services.swaylock = {};

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # OpenGL

  hardware.opengl = {
    enable = true;
  #  package = (pkgs.mesa.override { galliumDrivers = [ "i915" ]; }).drivers;
  };

  # Systemd configs

  systemd = {
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?


  # Auto update? Nah
  system.autoUpgrade = {
    enable = false;
    # flake = inputs.self.outPath;
    # flags = [];
    # dates = "";
    # randomizedDelaySec = "45min";
  };

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
