{ config, pkgs, stdenv, lib, ... }:

#---------------------------------------------------------------------
# Tolga Erok
# 10/6/2023
# My personal NIXOS KDE user configuration 
# ¯\_(ツ)_/¯
#---------------------------------------------------------------------

{
  imports = [ ../user-profile-pic ];

  #---------------------------------------------------------------------
  # Set your time zone.
  #---------------------------------------------------------------------
  time.timeZone = "America/New_York";

  #---------------------------------------------------------------------
  # Select internationalisation properties.
  #---------------------------------------------------------------------
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
  # Configure keymap in X11
  #---------------------------------------------------------------------
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  #---------------------------------------------------------------------
  # User Configuration
  #---------------------------------------------------------------------
  users.users.brian = {
    homeMode = "0755";
    isNormalUser = true;
    description = "Brian Francisco";
    uid = 1000;
    extraGroups = [
      "adbusers"
      "audio"
      "corectrl"
      "disk"
      "docker"
      "input"
      "libvirtd"
      "lp"
      "mongodb"
      "mysql"
      "network"
      "networkmanager"
      "postgres"
      "power"
      "samba"
      "scanner"
      "smb"
      "sound"
      "systemd-journal"
      "udev"
      "users"
      "video"
      "wheel"
    ];

    packages = [ pkgs.home-manager ];

    #---------------------------------------------------------------------
    # Create new password => mkpasswd -m sha-512
    #---------------------------------------------------------------------
    hashedPassword =
      "$6$I7KYj.gTY/tyxvhi$bt9o6oU5F0hxgAbKg4JebjdVMaBB9BFLe13BLI9rMgNc4gxx./bJga3pilI.6YwJm9umQ2AGgeEi/JlyyJVDr0";

 #   openssh.authorizedKeys.keys = [
 #     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDrS+VQMWkyNZ70Ym/TZoozhPfLpj9Rx+IlswOK01ZVx kintolga@gmail.com"
 #   ];

  };

  #---------------------------------------------------------------------
  # Back up nixos folder every 59 min 
  #---------------------------------------------------------------------
  services.cron = {
    enable = true;
    systemCronJobs = [

      "*/59 * * * * nixos-archive >> /home/brian/test.log"

    ];
  };
}

