{ pkgs, ... }:
# ---------------------------------------------------------------------
# Switch to most recent kernel available (Standard Nixos)
#---------------------------------------------------------------------
{
  boot.kernelPackages = {

     linuxPackages_latest = pkgs.linuxPackages_latest;

  };
}
