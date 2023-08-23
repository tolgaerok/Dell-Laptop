# MOTHERBOARD:  	Lenovo Motherboard 23926CU Win8 Pro DPK TPG
# MODEL:        	Lenovo ThinkPad T530 23926CU
# BIOS:         	Lenovo BIOS G4ETB7WW (2.77 ) 09/09/2019
# CPU:          	Intel(R) Core i7-3520M CPU @ 2.90GHz
# GPU:          	Intel 3rd Gen Core processor Graphics Controller
# RAM:          	2x RAM Module 8GB SODIMM DDR3 1600MT/s
# SATA:         	PNY CS900 1TB SSD
# NETWORK:      	Intel Centrino Advanced-N 6205 [Taylor Peak]
# BLUE-TOOTH:   	Broadcom BCM20702 Bluetooth 4.0 [ThinkPad]
#---------------------------------------------------------------------

{ config, desktop, pkgs, lib, username, ... }:

let 
    
in {

  #---------------------------------------------------------------------
  # Import snippet files:- 
  #---------------------------------------------------------------------

  imports = [

    # ./usernames/mutable-users-config.nix
    # ./usernames/root-user-config.nix
    #./custom-config { inherit config; }
    ./custom-pkgs
    ./hardware-acceleration
    ./hardware-configuration
    ./network
    ./nix
    ./pkgs
    ./printer
    ./scanner
    ./screensaver
    ./services

  ];

  #---------------------------------------------------------------------
  # Bootloader and System Settings
  #---------------------------------------------------------------------

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  #---------------------------------------------------------------------
  # SysRQ for is rebooting their machine properly if it freezes
  # SOURCE: https://oglo.dev/tutorials/sysrq/index.html
  #---------------------------------------------------------------------

  boot.kernel.sysctl."kernel.sysrq" = 1;

  #---------------------------------------------------------------------
  # Provides a virtual file system for environment modules. Solution
  # from NixOS forums to help shotwell to keep preference settings
  #---------------------------------------------------------------------

  services.envfs.enable = true;

  #---------------------------------------------------------------------
  # Dynamic device management. udev is responsible for device detection, 
  # device node creation, and managing device events.
  #---------------------------------------------------------------------

  services.udev.enable = true;

  #---------------------------------------------------------------------
  # Automatically detect and manage storage devices connected to your 
  # system. This includes handling device mounting and unmounting, 
  # as well as providing a consistent interface for accessing USB and 
  # managing disk-related operations.
  #---------------------------------------------------------------------

  services.devmon.enable = true;
  services.udisks2.enable = true;

  #---------------------------------------------------------------------
  # Activate the automatic trimming process for SSDs on the NixOS system  
  # Manual over-ride is sudo sudo fstrim / -v
  #---------------------------------------------------------------------
  services.fstrim.enable = true;

  #---------------------------------------------------------------------
  # Kernel Configuration
  #---------------------------------------------------------------------

  boot.kernel.sysctl."vm.swappiness" = 1;

  #---------------------------------------------------------------------
  # Time Zone and Locale
  #---------------------------------------------------------------------
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

  #---------------------------------------------------------------------
  # X11 and KDE Plasma
  #---------------------------------------------------------------------

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";

  #---------------------------------------------------------------------
  # Audio
  #---------------------------------------------------------------------

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
  #  jack.enable = true;
  };

  #---------------------------------------------------------------------
  # User Configuration
  #---------------------------------------------------------------------

  users.users.brianf = {
    homeMode = "0755";
    isNormalUser = true;
    description = "Brian Francisco";
    uid = 1000;
    extraGroups = [
      "audio"
      "disk"
      "input"
      "lp"
      "network"
      "networkmanager"
      "power"
      "scanner"
      "sound"
      "systemd-journal"
      "users"
      "video"
      "wheel"
    ];
    packages = [ pkgs.home-manager ];
  };

  #---------------------------------------------------------------------
  # Systemd tmpfiles configuration for user's home directory
  #---------------------------------------------------------------------

  systemd.user.tmpfiles.rules = [
    ''d /home/brianf/Development/NixOS 0755 brianf users - -''
  # ''d /home/brianf/Xcripts 0755 brianf users - -''
  # ''d /home/brianf/Syncthing 0755 brianf users - -'';

  ];

  #---------------------------------------------------------------------
  # Provide a graphical Bluetooth manager for desktop environments
  #---------------------------------------------------------------------

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  #---------------------------------------------------------------------
  # Nvidia drivers - NixOS wiki and help from David Turcotte. 
  # (https://davidturcotte.com)
  #---------------------------------------------------------------------

  hardware = {
  #  nvidia = {
  #    modesetting.enable = true;
  #    nvidiaPersistenced = true;
  #    package = config.boot.kernelPackages.nvidiaPackages.stable;
  #  };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        libvdpau-va-gl
        vulkan-validation-layers
      ];
    };
  };

  #services.xserver.videoDrivers = [ ''intel'' ];


  #---------------------------------------------------------------------
  # Automatic system upgrades, automatically reboot after an upgrade if
  # necessary
  #---------------------------------------------------------------------

  # system.autoUpgrade.allowReboot = true;  # Very annoying .

  system.autoUpgrade.enable = true;
  system.copySystemConfiguration = true;
  system.stateVersion = "23.05";
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
  #systemd.user.startServices = ''sd-switch''
}
