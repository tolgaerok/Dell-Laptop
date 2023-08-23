{ config, lib, pkgs, modulesPath, ... }:

#--------------------------------------------------------------------- 
# Default Hardware Configuration for current pc
#--------------------------------------------------------------------- 

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ehci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sr_mod"
    "sdhci_pci"
  ];

  boot.extraModulePackages = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "mitigations=off" ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e4cd97fd-17b5-4851-9672-50798c2afcd4";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1591-80CE";
      fsType = "vfat";
    };

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

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  #---------------------------------------------------------------------
  # Tell Nix to use appropriate packages and configurations for this 
  # platform if they are not explicitly defined otherwise.
  #---------------------------------------------------------------------

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

}
