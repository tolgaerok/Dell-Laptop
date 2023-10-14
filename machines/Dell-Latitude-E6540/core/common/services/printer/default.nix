{ config, lib, pkgs, ... }:

let
  extraBackends = [ pkgs.epkowa ];

  #---------------------------------------------------------------------
  # Printers and printer drivers (To suit my HP LaserJet 600 M601)
  #---------------------------------------------------------------------
  printerDrivers =
    [ pkgs.gutenprint pkgs.gutenprintBin pkgs.hplip pkgs.hplipWithPlugin ];

in {

  #---------------------------------------------------------------------
  # Scanner and printing drivers
  #---------------------------------------------------------------------

  hardware.sane.enable = true;
  hardware.sane.extraBackends = extraBackends;
  services.printing.drivers = printerDrivers;
  services.printing.enable = true;
  services.printing.enable = true;
  services.printing.drivers = with pkgs.hplip; [ "hplip-3.23.3" ];
  #---------------------------------------------------------------------
  # Add a systemd tmpfiles rule that creates a directory /var/spool/samba 
  # with permissions 1777 and ownership set to root:root. 
  #---------------------------------------------------------------------

  systemd = {
    tmpfiles.rules = [
      "D! /tmp 1777 root root 0"
      "d /var/spool/samba 1777 root root -"
      "r! /tmp/**/*"
    ];
  };

}
