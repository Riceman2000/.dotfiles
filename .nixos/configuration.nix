# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
    ];

  # Experimental 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true; # Memtest util
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ricepc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Nvidia config
  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ 
      vulkan-validation-layers
      libvdpau-va-gl 
      nvidia-vaapi-driver
    ];
  };
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Closed source is unfortunatley better
    open = false;

    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # This is GPU dependant 
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      reverseSync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:43:0:1";
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
  services.xserver.libinput.enable = true;

  # User account 
  users.users.rice = {
    isNormalUser = true;
    description = "rice";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [
      brave
      thunderbird
    ];
  };

  # Zsh as system default
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Steam/gaming related config
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # OpenSSH
  services.openssh.enable = true;

  # Syncthing
  services.syncthing = {
    enable = true;
    user = "rice";
    dataDir = "/home/rice/sync";
    configDir = "/home/rice/.config/syncthing";
    settings = {
      devices = {
        "Alexs-Air" = { id = "2CNAWNH-UIMML2Z-2KZ27BB-VQ5LEZA-6GHO33J-SCZ6OYM-52TRVCG-CGBKIQD"; };
      };
      folders = {
        "Dog Accessories" = {
          id = "isiay-ywwlr";
          path = "~/Sync/Dog Accessories";
          devices = [ "Alexs-Air" ];
          versioning.type = "staggered";
        };
        "KeePassXC" = {
          id = "jxzyx-j4d2g";
          path = "~/Sync/KeePassXC";
          devices = [ "Alexs-Air" ];
          versioning.type = "staggered";
        };
        "VPNs" = {
          id = "qygq2-rtwmr";
          path = "~/Sync/VPNs";
          devices = [ "Alexs-Air" ];
          versioning.type = "staggered";
        };
        "Misc" = {
          id = "veqod-wslkh";
          path = "~/Sync/Misc";
          devices = [ "Alexs-Air" ];
          versioning.type = "staggered";
        };
        "ssh" = {
          id = "zvfny-shq46";
          path = "~/.ssh";
          devices = [ "Alexs-Air" ];
          versioning.type = "staggered";
        };
      };
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
