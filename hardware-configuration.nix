{ config, lib, pkgs, modulesPath, ... }:

#--------------------------------------------------------------------- 
# Default Hardware Configuration for current pc
#--------------------------------------------------------------------- 

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "ehci_pci"
    "sd_mod"
    "sr_mod"
    "uas"
    "usb_storage"
    "usbhid"
    "xhci_pci"
  ];

  boot.extraModulePackages = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "mitigations=off" ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e4cd97fd-17b5-4851-9672-50798c2afcd4";
      fsType = "ext4";
    # for ssd
    options =
      [ "noatime" "nodiratime" "discard" "errors=remount-ro" "data=ordered" ];
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1591-80CE";
      fsType = "vfat";
  };

#  fileSystems."/mnt/nixos_share" = {
#    device = "//192.168.0.20/LinuxData/HOME/PROFILES/NIXOS-23-05/TOLGA/";
#    fsType = "cifs";
#    options = let
#      automountOpts =
#        "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,x-systemd.requires=network.target";
#      uid =
#        "1000"; # Replace with your actual user ID, use `id -u <YOUR USERNAME>` to get your user ID
#      gid =
#        "100"; # Replace with your actual group ID, use `id -g <YOUR USERNAME>` to get your group ID
#      vers = "3.1.1";
#      cacheOpts = "cache=loose";
#      credentialsPath = "/etc/nixos/hardware-configuration/network/smb-secrets";
#    in [
#      "${automountOpts},credentials=${credentialsPath},uid=${uid},gid=${gid},vers=${vers},${cacheOpts}"
#    ];
#  };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/71bb2615-3252-4757-a54b-e334ba86c751"; }
    ];

  #---------------------------------------------------------------------
  # For AMD hardware / chipsets
  #---------------------------------------------------------------------

  # hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  #---------------------------------------------------------------------
  # For Intel hardware / chipsets
  #---------------------------------------------------------------------

  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  #---------------------------------------------------------------------
  # Tell Nix to use appropriate packages and configurations for this 
  # platform if they are not explicitly defined otherwise.
  #---------------------------------------------------------------------

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  networking.useDHCP = lib.mkDefault true;

  #---------------------------------------------------------------------
  # Latest real-time (RT) version of the Linux kernel.
  #---------------------------------------------------------------------

  # kernelPackages = pkgs.linuxPackages-rt_latest;

}
