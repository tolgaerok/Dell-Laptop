# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # network configuration
  networking.interfaces.enp3s0.ipv4.addresses = [ {
    address = "192.168.42.150";
    prefixLength = 24;
  } ];
  networking.defaultGateway = "192.168.42.1";
  networking.nameservers = [ "192.168.42.231" ];

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

# --------------------------------------------------------------------
# Switch to most recent kernel available (Standard Nixos)
#---------------------------------------------------------------------
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernel.sysctl = {

    #---------------------------------------------------------------------
    #   Network and memory-related optimizationss for desktop 16GB
    #---------------------------------------------------------------------
    "kernel.sysrq" = 1;                         # Enable SysRQ for rebooting the machine properly if it freezes. [Source](https://oglo.dev/tutorials/sysrq/index.html)
    "net.core.netdev_max_backlog" = 30000;      # Help prevent packet loss during high traffic periods.
    "net.core.rmem_default" = 262144;           # Default socket receive buffer size, improve network performance & applications that use sockets. Adjusted for 16GB RAM.
    "net.core.rmem_max" = 33554432;             # Maximum socket receive buffer size, determine the amount of data that can be buffered in memory for network operations. Adjusted for 16GB RAM.
    "net.core.wmem_default" = 262144;           # Default socket send buffer size, improve network performance & applications that use sockets. Adjusted for 16GB RAM.
    "net.core.wmem_max" = 33554432;             # Maximum socket send buffer size, determine the amount of data that can be buffered in memory for network operations. Adjusted for 16GB RAM.
    "net.ipv4.ipfrag_high_threshold" = 5242880; # Reduce the chances of fragmentation. Adjusted for SSD.
    "net.ipv4.tcp_keepalive_intvl" = 30;        # TCP keepalive interval between probes to detect if a connection is still alive.
    "net.ipv4.tcp_keepalive_probes" = 5;        # TCP keepalive probes to detect if a connection is still alive.
    "net.ipv4.tcp_keepalive_time" = 300;        # TCP keepalive interval in seconds to detect if a connection is still alive.
    "vm.dirty_background_bytes" = 8388608;      # Data (8 MB) modified in memory and needs to be written to disk. Adjusted for SSD.
    "vm.dirty_bytes" = 16777216;                # Data (16 MB) modified in memory and needs to be written to disk. Adjusted for SSD.
    "vm.min_free_kbytes" = 65536;               # Minimum free memory for safety (in KB), helping prevent memory exhaustion situations. Adjusted for 16GB RAM.
    "vm.swappiness" = 10;                       # Adjust how aggressively the kernel swaps data from RAM to disk. Lower values prioritize keeping data in RAM. Adjusted for 16GB RAM.
    "vm.vfs_cache_pressure" = 200;              # Adjust vfs_cache_pressure (0-1000) to manage memory used for caching filesystem objects. Adjusted for 16GB RAM.

    #---------------------------------------------------------------------
    #   SSD tweaks: Adjust settings for an SSD to optimize performance.
    #---------------------------------------------------------------------
    "vm.dirty_background_ratio" = "5";          # Set the ratio of dirty memory at which background writeback starts (5%). Adjusted for SSD.
    "vm.dirty_expire_centisecs" = "6000";       # Set the time at which dirty data is old enough to be eligible for writeout (6000 centiseconds). Adjusted for SSD.
    "vm.dirty_ratio" = "10";                    # Set the ratio of dirty memory at which a process is forced to write out dirty data (10%). Adjusted for SSD.
    "vm.dirty_time" = "0";                      # Disable dirty time accounting.
    "vm.dirty_writeback_centisecs" = "500";     # Set the interval between two consecutive background writeback passes (500 centiseconds).
  };
  
  #---------------------------------------------------------------------
  # Enable memory compression for (16GB) system
  # Faster processing and less SSD usage
  #---------------------------------------------------------------------
  zramSwap.enable = true;
  zramSwap.memoryPercent = 35;

  # 16GB
  zramSwap.memoryMax = 17179869184;
  #--------------------------------------------------------------------- 
  #   trim deleted blocks from ssd
  #---------------------------------------------------------------------
  services.fstrim.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

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
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brian = {
    isNormalUser = true;
    description = "Brian Francisco";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kakoune 
      vnstat 
      borgbackup 
      utillinux
      kate
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # network disabled (I need to check the ports used first)
  networking.firewall.enable = false;
      
  # services to enable
  services.openssh.enable = true;
  services.vnstat.enable = true;

  # samba service
  services.samba.enable = true;
  services.samba.enableNmbd = true;
  services.samba.extraConfig = ''
        workgroup = WORKGROUP
        server string = Samba Server
        server role = standalone server
        log file = /var/log/samba/smbd.%m
        max log size = 50
        dns proxy = no
        map to guest = Bad User
    '';
  services.samba.shares = {
      public = {
          path = "/home/public";
          browseable = "yes";
          "writable" = "yes";
          "guest ok" = "yes";
          "public" = "yes";
          "force user" = "share";
        };
     };
      
  # minidlna service
  services.minidlna.enable = true;
  services.minidlna.announceInterval = 60;
  services.minidlna.friendlyName = "Rorqual";
  services.minidlna.mediaDirs = ["A,/home/public/Musique/" "V,/home/public/Videos/"];
      
  # trick to create a directory with proper ownership
  # note that tmpfiles are not necesserarly temporary if you don't
  # set an expire time. Trick given on irc by someone I forgot the name..
  systemd.tmpfiles.rules = [ "d /home/public 0755 share users" ];
      
  # create my user, with sudo right and my public ssh key
  users.users.solene = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" ];
    openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOIZKLFQXVM15viQXHYRjGqE4LLfvETMkjjgSz0mzMzS personal"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOIZKLFQXVM15vAQXBYRjGqE6L1fvETMkjjgSz0mxMzS pro"
    ];
  };
      
  # create a dedicated user for the shares
  # I prefer a dedicated one than "nobody"
  # can't log into it
  users.users.share= {
    isNormalUser = false;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
